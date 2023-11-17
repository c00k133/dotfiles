{ config, pkgs, lib, ... }:

{
  environment = {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    systemPackages = [
      # General tools
      pkgs.htop
      pkgs.tmux
      pkgs.vim

      # Terminal tools
      pkgs.fzf
      pkgs.fzf-zsh
      pkgs.starship
      pkgs.powerline

      # Development tools
      pkgs.docker
      pkgs.terraform  # unfree: must be included in `nixpkgs.config.allowUnfreePredicate`
    ];

    # Use a custom configuration.nix location.
    # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
    darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

    variables = {
      "EDITOR" = "vim";
    };
  };

  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "terraform"
  ];

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  homebrew = {
    onActivation = {
      enable = true;
      autoUpdate = true;
      cleanup = "uninstall";
    };

    casks = [
      "iterm2"
    ];

    # brews = [ "..." ];
    # taps = [ " " ];
  };
}
