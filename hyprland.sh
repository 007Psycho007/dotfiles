sudo pacman -Syu
sudo pacman -Sy  base-devel git cmake meson ninja wayland wayland-protocols wlroots xorg-xwayland elogind seatd hyprland waybar wofi kitty dunst wl-clipboard swaybg meson cmake go

sudo systemctl enable --now seatd.service

mkdir -p ~/.config/hypr
cp config/hypr/hyprland.conf ~/.config/hypr/

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

hyprpm enable
hyprpm add https://github.com/outfoxxed/hy3
