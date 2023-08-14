## macOS Setup

### Install NixOS

```sh
sh <(curl -L https://nixos.org/nix/install)
```

### Set Nix Configuration

Edit your nix configuration `/etc/nix/nix.conf`

```sh
extra-experimental-features = flakes
build-users-group = nixbld
```

### Customize config.nix

Make your `~/.config/nixpkgs/config.nix`

```sh
{
  packageOverrides = pkgs: with pkgs; {
    base-environment = pkgs.buildEnv {
      name = "base-environment";
      paths = [
        bash
        comma
        direnv
        fd
        fzf
        git
        glow
        htop
        jq
        ncdu
        ripgrep
        tree
        zoxide
        zsh
      ];
    };
  };
}
```

Apply `config.nix` to your default environment:

```sh
nix-env -riA nixpkgs.base-environment
```

### Enable direnv

```sh
echo 'eval "$(direnv hook zsh)"' >>~/.zshrc
```

### Enable zoxide

```sh
echo 'eval "$(zoxide init zsh)"' >>~/.zshrc
```

______________________________________________________________________

### Install Oh My Zsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install PowerLevel10k Theme for Oh My Zsh

```sh
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
```

update your `~/.zshrc` with

```sh
echo '''
ZSH_THEME="powerlevel10k/powerlevel10k"
''' >>~/.zshrc
```
