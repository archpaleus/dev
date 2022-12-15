## macOS Setup

### Install NixOS
```
sh <(curl -L https://nixos.org/nix/install)
```

### Install OhMyZsh

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install PowerLevel10k Theme for OhMyZsh
```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

update your ~/.zshrc with
```
echo '''
ZSH_THEME="powerlevel10k/powerlevel10k"
''' >>~/.zshrc
```

### Customize config.nix
Make your ~/.config/nixpkgs/config.nix
```
{
  packageOverrides = pkgs: with pkgs; {
    mine = pkgs.buildEnv {
      name = "mine";
      paths = [
        direnv
        git
        glow
        jq
        htop
        ncdu
        rustc
        tree
      ];
    };
  };
}
```

Apply config.nix to your default environment:
```
nix-env -riA nixpkgs.mine
```

### Enable direnv
```
echo 'eval "$(direnv hook zsh)"' >>~/.zshrc
```

