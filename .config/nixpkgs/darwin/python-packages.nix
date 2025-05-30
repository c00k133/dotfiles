pkgs:
let
  # TODO: parametrize for the whole module; this way we can have multiple different versions of Python running.
  python-version = "312";

  python = pkgs."python${python-version}";
  python-packages = pkgs."python${python-version}Packages";
in
with pkgs; [
  # Python language and ecosystem
  python

  # Development tools
  pipenv
  pyright
  virtualenv

  # Linters, fixers, and type-checkers
  python-packages.autopep8
  python-packages.black
  python-packages.flake8
  python-packages.isort
  python-packages.mypy
  python-packages.pylint
]
