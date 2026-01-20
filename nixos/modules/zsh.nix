{ config, lib, pkgs, ... }:
{
  programs.zsh = {
	  enable = true;
     	#enableCompletion = true;
     	#autosuggestions.enable = true;  # автоматические подсказки
     	#syntaxHighlighting.enable = true;
	  ohMyZsh = {
	  	enable = true;
	  	plugins = [ "git" "docker" "sudo" ];
	  	theme = "maran";
	  };
  };
}
