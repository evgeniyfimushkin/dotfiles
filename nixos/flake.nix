{
  description = "NixOS configuration";

  inputs = {
    # happ.url = "path:/home/eugene/test-happ";
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs,  nixpkgs-stable, home-manager, ... }@inputs: 
    let 
      system = "x86_64-linux";
      user = "eugene";
    in {
    
    nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        # ({ config, pkgs, ... }: {
        #   nixpkgs.config.allowUnfree = true;
        #   nixpkgs.overlays = [
        #     (final: prev: {
        #       happ = inputs.happ.packages.${system}.default;
        #     })
        #   ];
        # })
        # happ.nixosModules.happd
        # ({ pkgs, ... }: {
        #   services.happd.enable = true;
        #   # services.happd.extraArgs = [ "--some-flag" ];
        # }) 
        ./configuration.nix
        home-manager.nixosModules.home-manager
        {
          home-manager = {
            useGlobalPkgs = true;
            useUserPackages = true;
            extraSpecialArgs = { inherit inputs; };
            users.eugene = {
              imports = [ ./home-manager/home.nix ];
            };
          };
        }
      ];
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