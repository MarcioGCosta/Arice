#!/bin/sh

## Uncommenting lines in pacman.conf, and making output prettier
sudo sed '/Color/s/^#//' -i /etc/pacman.conf && sudo sed '/ParallelDownloads/s/^#//' -i /etc/pacman.conf && sudo sed '/Color/i ILoveCandy' -i /etc/pacman.conf

## Ranking mirrorlist
yes | sudo pacman -Sy reflector && sudo reflector --sort score --save /etc/pacman.d/mirrorlist. && sudo rm /etc/pacman.d/mirrorlist && sudo mv /etc/pacman.d/mirrorlist. /etc/pacman.d/mirrorlist

## Installing misc progams
sudo pacman -Sy kcalc gvfs zsh-syntax-highlighting vim zsh-autosuggestions libvdpau-va-gl xf86-video-amdgpu vulkan-radeon libva-mesa-driver qemu virt-manager edk2-ovmf dnsmasq mesa-vdpau mesa pulsemixer qbittorrent htop ufw ntp wireplumber pipewire-jack foot mpv yt-dlp pipewire pipewire-pulse pipewire-alsa playerctl dash go zsh noto-fonts-emoji ttf-nerd-fonts-symbols ttf-ibm-plex feh doas yarn npm xsel android-tools android-udev libreoffice-fresh-pt-br wine lutris wine-mono winetricks bluez-libs bluez-utils bluez pcmanfm-qt dosfstools vkd3d vulkan-headers mesa lib32-mesa lib32-vulkan-icd-loader lib32-vulkan-radeon xfce4-screenshooter xfce4 qterminal gamemode innoextract lib32-gamemode lib32-vkd3d python-pefile noto-fonts noto-fonts-cjk noto-fonts-emoji noto-fonts-extra ttf-liberation ttf-dejavu ttf-roboto ttf-jetbrains-mono ttf-fira-code ttf-hack adobe-source-code-pro-fonts qemu-full blueman gvfs gvfs-mtp lxqt-archiver pcmanfm-qt

## Moving folders
mv $HOME/Arice/config/.zshrc /$HOME/.zshrc && mv $HOME/Arice/config/.config/* /$HOME/.config

## Installing yay
git clone https://aur.archlinux.org/yay.git && cd yay* && yes | makepkg -si && cd .. && rm -rf yay

## Changing user shell to zsh
sudo chsh -s /usr/bin/zsh $USER

## Configuring doas and 

touch doas.conf && echo permit nopass "$USER" as root >doas.conf && sudo mv doas.conf /etc/ && sudo chown root:root /etc/doas.conf

sudo mv $HOME/Arice/config/20-amdgpu.conf /etc/X11/xorg.conf.d && sudo chown root:root /etc/X11/xorg.conf.d/20-amdgpu.conf

## Installing misc programs in yay
yay -S pfetch orphan-manager floorp-bin ly ttf-noto adobe-source-han-sans-otc-fonts ttf-liberation ttf-dejavu freecad-weekly-appimage

## Enabling daemons
sudo systemctl enable ufw.service && sudo systemctl enable ntpd.service && sudo systemctl enable libvirtd.socket && sudo systemctl enable bluetooth.service && sudo systemctl enable ly.service

sudo usermod -aG libvirt $USER

sudo sed '/unix_sock_rw_perms/s/^#//' -i /etc/libvirt/libvirtd.conf
sudo sed '/unix_sock_group/s/^#//' -i /etc/libvirt/libvirtd.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-group"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed '/user = "libvirt-qemu"/s/^#//' -i /etc/libvirt/qemu.conf
sudo sed 's/libvirt-qemu/'$USER'/g' -i /etc/libvirt/qemu.conf

#yt-dlp --embed-info-json --embed-metadata --embed-thumbnail --audio-format best --extract-audio "%(title)s.%(ext)%"
