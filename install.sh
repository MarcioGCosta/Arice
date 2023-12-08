#!/bin/sh

## Uncommenting lines in pacman.conf, and making output prettier
sudo sed '/Color/s/^#//' -i /etc/pacman.conf && sudo sed '/ParallelDownloads/s/^#//' -i /etc/pacman.conf && sudo sed '/Color/i ILoveCandy' -i /etc/pacman.conf

## Ranking mirrorlist
yes | sudo pacman -Sy reflector && sudo reflector --sort score --save /etc/pacman.d/mirrorlist. && sudo rm /etc/pacman.d/mirrorlist && sudo mv /etc/pacman.d/mirrorlist. /etc/pacman.d/mirrorlist

## Installing misc progams
sudo pacman -Syu zsh-syntax-highlighting ttf-hack rofi zsh-autosuggestions libvdpau-va-gl xf86-video-amdgpu vulkan-radeon libva-mesa-driver qemu virt-manager edk2-ovmf dnsmasq mesa-vdpau mesa pulsemixer qbittorrent bat ripgrep htop ufw ntp wireplumber pipewire-jack foot mpv yt-dlp pipewire papirus-icon-theme pipewire-pulse pipewire-alsa libva-intel-driver playerctl dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh neovim doas yarn npm xsel sway

## Moving folders
mv $HOME/Arice/config/.zshrc /$HOME/.zshrc && mv $HOME/Arice/config/.config/* /$HOME/.config

## Symlinking dash as /bin/sh
sudo ln -sfT dash /usr/bin/sh

## Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay* && yes | makepkg -si && cd .. && rm -rf yay

## Changing user shell to zsh
sudo chsh -s /usr/bin/zsh $USER

## Configuring doas and Configuring neovim for doas/su
touch doas.conf && echo permit nopass "$USER" as root >doas.conf && sudo mv doas.conf /etc/ && sudo chown root:root /etc/doas.conf

## Installing misc programs in yay
yay -S pfetch orphan-manager dashbinsh ly mercury-browser-bin

## Enabling daemons
sudo systemctl enable ufw.service && sudo systemctl enable ntpd.service && sudo systemctl enable ly.service && sudo systemctl enable libvirtd.socket

## Setting timezone
sudo timedatectl set-timezone America/Sao_Paulo

## Setting Xorg keymap
sudo localectl --no-convert set-x11-keymap br dvorak

sudo usermod -aG libvirt $USER

sudo sed '/unix_sock_rw_perms/s/^#//' -i /etc/libvirt/libvirtd.conf
sudo sed '/unix_sock_group/s/^#//' -i /etc/libvirt/libvirtd.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-group"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed 's/libvirt-qemu/'$USER'/g' -i /etc/libvirt/qemu.conf
