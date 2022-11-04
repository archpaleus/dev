## macOS Setup

### Install NixOS
```
sh <(curl -L https://nixos.org/nix/install)
```

### Install OhMyZsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install NerdFonts
```
brew tap homebrew/cask-fonts &&
brew install --cask font-meslo-nerd-font
```
or

https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/Meslo/M/Regular/complete

### Install PowerLevel10k
update your ~/.zshrc with
```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

### Customize config.nix
Copy to ~/.config/nixpkgs/config.nix
```
{
  packageOverrides = pkgs: with pkgs; {
    mine = pkgs.buildEnv {
      name = "mine";
      paths = [
        direnv
        git
        jq
        htop
        ncdu
        #rust
        tree
      ];
    };
  };
}
```

```
nix-env -riA nixpkgs.mine
```