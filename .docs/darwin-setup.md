# Nix setup on Darwin (macOS)

Install Nix on Mac:
- https://nixos.org/download.html#nix-install-macos
  ```sh
  sh <(curl -L https://nixos.org/nix/install)
  ```

Follow the nix-darwin installation guide:
- https://github.com/LnL7/nix-darwin#installing
  ```sh
  nix-build https://github.com/LnL7/nix-darwin/archive/master.tar.gz -A installer
  ./result/bin/darwin-installer
  ```

Add Homebrew support to nix-darwing:
- https://github.com/MatthiasBenaets/nixos-config/blob/master/darwin.org#homebrew
    - See the nix-darwing configuration in this repository.
      The configuration in the link may be outdated.
- ```sh
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```
  If problems arise you can run `brew doctor` for diagnostics.

> [!TIP]
> Only install your own dotfiles afterwards.
> Otherwise some settings will be overridden.
> Files like `.zshrc` will be backed up and moved, read the logs of the programs ran above.

-------------------------------------------------------------------------------

References:
- [Using Nix on macOS - Hacker News](https://news.ycombinator.com/item?id=32290725)
- Installing Powerline fonts on Mac with iTerm2:
    - https://github.com/powerline/fonts#quick-installation
    - https://apple.stackexchange.com/a/413332
