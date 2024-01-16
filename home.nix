{ config, pkgs, ... }:

{ 
  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = (_: true);
    };
  };

    # set the user
    home.username = "adamb";
    home.homeDirectory = "/home/adamb";

    home.packages = [
	pkgs.unzip
	pkgs.zip
	pkgs.lf
	pkgs.platformio
	pkgs.tmux
	pkgs.git
	pkgs.openssh
	pkgs.zsh
	pkgs.github-cli
	pkgs.thefuck
        pkgs.zsh-autosuggestions
	pkgs.gcc
	pkgs.valgrind
	pkgs.gdb
	pkgs.wget
	pkgs.curl
	pkgs.lazygit
	pkgs.python3
	pkgs.vscode
	pkgs.pcsx2
	pkgs.gist
	pkgs.go
	pkgs.obs-studio
	pkgs.steam
	pkgs.lshw
	pkgs.screenkey
   	pkgs.appimage-run
	pkgs.yarn
	pkgs.nodejs
	pkgs.kicad
	pkgs.glibc
  
    ];
    
    home.stateVersion = "23.11";
   
    # let Home Manager install and manage itself.
    programs.home-manager.enable = true; 

    programs.neovim = {    
      
      enable	      = true;    
      vimAlias	      = true;
      viAlias	      = true;
    };
  
    programs.kitty = {
      
      enable = true;
      theme  = "Rosé Pine";
      
      font = { 
        name = "JetBrainsMono Nerd Font";
	size = 12.0;
      }; 
      
      settings = {
	scrollback_lines 	  = 10000;
	enable_audio_bell 	  = false;
	background_opacity 	  = "0.95";
	hide_window_decorations   = true;
	window_padding_width      = 5;
        disable-ligatures	  = false; 
      };
   };

    programs.git = {
      
      enable	= true; 
      userName	= "eggsrael";
      userEmail = "";
    };
    
    programs.zsh = { 
      
      enable = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;
     
      shellAliases = { 
	ls 	 = "lsd";
	update   = "home-manager switch";
	homefile = "nvim ~/nixfiles/home.nix";
        ssh 	 = "kitty +kitten ssh"; 
	vim	 = "steam-run nvim";
	initfile = "steam-run nvim ~/.config/nvim/init.lua";
      };

      oh-my-zsh = { 
	enable  = true;
	plugins = [ "git" ];
	theme   = "fox";
      };
      initExtra = '' 
	ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
	eval $(thefuck --alias)
	'';
    };

    programs.vscode = { 
	
	enable  = true; 
	package = pkgs.vscode;
	
	extensions = with pkgs.vscode-extensions; [
	  asvetliakov.vscode-neovim
	  enkia.tokyo-night
	];
    };
}
