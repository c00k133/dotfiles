pkgs: with pkgs; [
  # General tools
  htop
  tmux
  neovim
  vim

  # Terminal tools
  fd
  fzf
  fzf-zsh
  jq
  shellcheck
  ripgrep
  ranger
  yq
  gnupg
  s3cmd

  # Terminal theming
  nerdfonts
  powerline
  starship

  # Development tools
  aws-vault
  awscli2
  cargo
  colima
  duckdb
  # localstack  # currently fails...
  nodejs_23  # Latest NodeJS version (2025/01/25), `nodejs` points to `20.18.1`
  pqrs
  terragrunt
  tgswitch
]
