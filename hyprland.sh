sudo pacman -Syu
sudo pacman -S --needed base-devel git cmake meson ninja \
  wayland wayland-protocols wlroots xorg-xwayland \
  polkit elogind \
  seatd

sudo pacman -S hyprland

sudo pacman -S waybar wofi kitty dunst wl-clipboard swaybg

sudo systemctl enable --now seatd.service

mkdir -p ~/.config/hypr
cp /usr/share/hyprland/hyprland.conf ~/.config/hypr/
