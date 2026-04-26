{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    nix-flatpak.url = "github:gmodena/nix-flatpak/?ref=latest";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    wg-feed.url = "github:exeteres/wg-feed";
  };

  outputs =
    {
      self,
      nixpkgs,
      nixpkgs-stable,
      nix-flatpak,
      home-manager,
      wg-feed,
      ...
    }@inputs:
    let
      system = "x86_64-linux";
      user = "eugene";

      mkHost =
        {
          hostname,
          extraModules ? [ ],
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs; };
          modules = [
            nix-flatpak.nixosModules.nix-flatpak
            wg-feed.nixosModules.wg-feed
            ./hosts/${hostname}/configuration.nix
            home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = { inherit inputs; };
                users.${user} = {
                  imports = [ ./home-manager/home.nix ] ++ extraModules;
                };
              };
            }
          ];
        };
    in
    {
      nixosConfigurations = {
        honor = mkHost {
          hostname = "honor";
          extraModules = [ ./home-manager/desktop.nix ];
        };
        lab = mkHost {
          hostname = "lab";
        };
      };

      homeConfigurations."${user}" = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.${system};
        extraSpecialArgs = {
          inherit inputs user;
        };
        modules = [
          ./home-manager/home.nix
        ];
      };
    };
}
