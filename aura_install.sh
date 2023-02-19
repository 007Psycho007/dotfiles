
git clone https://aur.archlinux.org/aura-bin.git ~/.aura-temp
cd ~/.aura-temp
makepkg 
sudo pacman -U --noconfirm *.zst 
