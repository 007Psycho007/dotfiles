sudo pacman -Syu
sudo pacman -S --needed base-devel git cmake meson ninja \
  wayland wayland-protocols wlroots xorg-xwayland \
  polkit elogind \
  seatd

sudo pacman -S hyprland

sudo pacman -S waybar wofi kitty dunst wl-clipboard swaybg

sudo systemctl enable --now seatd.service

mkdir -p ~/.config/hypr
cp config/hypr/hyprland.conf ~/.config/hypr/

sudo pacman -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si

git clone https://github.com/outfoxxed/hy3
cd hy3
make all

mkdir -p ~/.local/share/hyprland/plugins
cp build/hy3.so ~/.local/share/hyprland/plugins/

