# Dotfiles
This repository contains dotfiles on my development machines which includes configuration for workspace/environment programs (i3, zsh, ...) to development tools (git, nvim, ...).

## Usage
The files in this repo are designed to be intuitive and as such, the files organized to be relative to your home directory.

To use these dotfiles:
1. Clone the repository
2. Install prerequisite dependencies for plugins
3. Copy or symlink the configuration files or folders to the appropriate locations

## Dependencies
This section lists all the instructions required to install the dependencies for various programs this repository supports.

### Tmux - TPM, Powerline
Install the [Tmux Plugin Manager](https://github.com/tmux-plugins/tpm) (TPM)
```shell
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```
According to [themepacks](https://github.com/jimeh/tmux-themepack?tab=readme-ov-file#powerline-themes), ensure you have a Powerline font installed for Powerline themes.

### i3 - Maim, Feh, J4, Picom, Alacritty
Install the following programs
```bash
sudo apt install -y maim feh j4-dmenu-desktop
```

Build the latest Picom
```bash
git clone https://github.com/yshui/picom /tmp/picom
cd /tmp/picom
sudo apt install -y libconfig-dev libdbus-1-dev libegl-dev libev-dev libgl-dev libepoxy-dev libpcre2-dev libpixman-1-dev libx11-xcb-dev libxcb1-dev libxcb-composite0-dev libxcb-damage0-dev libxcb-dpms0-dev libxcb-glx0-dev libxcb-image0-dev libxcb-present-dev libxcb-randr0-dev libxcb-render0-dev libxcb-render-util0-dev libxcb-shape0-dev libxcb-util-dev libxcb-xfixes0-dev libxext-dev meson ninja-build uthash-dev
meson setup --buildtype=release build && ninja -C build
sudo ninja -C build install
```

Download Cargo for building Alacritty
```bash
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
source ~/.cargo/env
```

Build the latest Alacritty
```bash
git clone https://github.com/alacritty/alacritty /tmp/alacritty
cd /tmp/alacritty

# Build Alacritty
sudo apt install -y cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3
cargo build --release

# Create .desktop entry
sudo cp target/release/alacritty /usr/local/bin # or anywhere else in $PATH
sudo cp extra/logo/alacritty-term.svg /usr/share/pixmaps/Alacritty.svg
sudo desktop-file-install extra/linux/Alacritty.desktop
sudo update-desktop-database
```

### i3status - lm-sensors
Install the following programs
```bash
sudo apt update -y
sudo apt install -y lm-sensors
```

### Neovim - Make, GCC, Ripgrep, Unzip
Install the following programs
```bash
sudo apt update -y
sudo apt install -y make gcc ripgrep unzip
```
You may optional install a [Nerd Font](https://github.com/nvim-lua/kickstart.nvim?tab=readme-ov-file#install-external-dependencies).
