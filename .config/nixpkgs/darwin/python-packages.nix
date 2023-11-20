pkgs:
let
  # TODO: parametrize for the whole module; this way we can have multiple different versions of Python running.
  # Python v3.12 exists, but it seemingly doesn't have as many packages in Nix Channel 23.05
  python-version = "311";

  python = pkgs."python${python-version}";
  python-packages = pkgs."python${python-version}Packages";
in
with pkgs; [
  # Development tools
  pipenv

  # Python language and ecosystem
  python

  # Python packages
  python-packages.black
  python-packages.isort
  python-packages.flake8
  python-packages.pylint
  python-packages.mypy
]
