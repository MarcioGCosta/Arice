#!/bin/sh

## Uncommenting lines in pacman.conf, and making output prettier
sudo sed '/Color/s/^#//' -i /etc/pacman.conf && sudo sed '/ParallelDownloads/s/^#//' -i /etc/pacman.conf && sudo sed '/Color/i ILoveCandy' -i /etc/pacman.conf

## Ranking mirrorlist 
yes | sudo pacman -Sy reflector && sudo reflector --sort score --save /etc/pacman.d/mirrorlist. && sudo rm /etc/pacman.d/mirrorlist && sudo mv /etc/pacman.d/mirrorlist. /etc/pacman.d/mirrorlist

## Installing misc progams
yes | sudo pacman -Syu zsh-syntax-highlighting zsh-autosuggestions libvdpau-va-gl xf86-video-amdgpu vulkan-radeon libva-mesa-driver lib32-libva-mesa-driver mesa-vdpau mesa pulsemixer qbittorrent bat ripgrep htop ufw ntp wireplumber pipewire-jack foot mpv yt-dlp pipewire papirus-icon-theme pipewire-pulse pipewire-alsa libva-intel-driver playerctl dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh neovim doas yarn npm xsel sway 

## Moving folders
mv $HOME/Arice/config/.zshrc /$HOME/.zshrc && mv $HOME/Arice/config/.config /$HOME/

## Installing vim-plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


## Symlinking dash as /bin/sh
sudo ln -sfT dash /usr/bin/sh

## Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay* && yes | makepkg -si && cd .. && rm -rf yay

## Changing user shell to zsh
sudo chsh -s /usr/bin/zsh marcioc

## Configuring doas and Configuring neovim for doas/su 
touch doas.conf && echo permit nopass marcioc as root > doas.conf && sudo mv doas.conf /etc/ && sudo chown root:root /etc/doas.conf

## Installing misc programs in yay 
yay -S pfetch orphan-manager dashbinsh ly mercury-browser-bin

## Enabling daemons
sudo systemctl enable ufw.service && sudo systemctl enable ntpd.service && sudo systemctl enable ly.service

## Setting timezone
sudo timedatectl set-timezone America/Sao_Paulo

## Setting Xorg keymap
sudo localectl --no-convert set-x11-keymap br dvorak
