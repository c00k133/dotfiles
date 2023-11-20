pkgs: with pkgs; [
  # General tools
  htop
  tmux
  vim

  # Terminal tools
  fzf
  fzf-zsh
  jq
  yq

  # Terminal theming
  starship
  powerline

  # Development tools
  terraform  # unfree: must be included in `nixpkgs.config.allowUnfreePredicate`
  aws-vault
  awscli2
]
