{ config, pkgs, lib, ... }:

let
  # unfree: must be included in `nixpkgs.config.allowUnfreePredicate`
  unfree-packages = [
    "terraform"
  ];
in {
  environment = {
    # List packages installed in system profile. To search by name, run:
    # $ nix-env -qaP | grep wget
    systemPackages = (import ./packages.nix pkgs) ++ (builtins.map (p: pkgs."${p}") unfree-packages);

    # Use a custom configuration.nix location.
    # $ darwin-rebuild switch -I darwin-config=$HOME/.config/nixpkgs/darwin/configuration.nix
    darwinConfig = "$HOME/.config/nixpkgs/darwin/configuration.nix";

    variables = {
      "EDITOR" = "vim";
    };
  };

  # TODO: figure out how to configure this in a separate file
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) unfree-packages;

  # Auto upgrade nix package and the daemon service.
  services.nix-daemon.enable = true;
  # nix.package = pkgs.nix;

  # Create /etc/zshrc that loads the nix-darwin environment.
  programs.zsh.enable = true;  # default shell on catalina

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;

  homebrew = {
    # Although nix-darwin complained earlier, this is a higher level configuration.
    # - https://daiderd.com/nix-darwin/manual/index.html
    enable = true;

    onActivation = {
      autoUpdate = true;
      cleanup = "uninstall";
    };

    # Use casks for GUI applications
    # - https://stackoverflow.com/a/46423275
    casks = [
      "iterm2"
      "docker"
      "logseq"
      "mac-mouse-fix"
    ];

    # brews = [ "..." ];
    # taps = [ " " ];
  };
}
