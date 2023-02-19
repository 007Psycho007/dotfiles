
git clone https://github.com/AlphaNecron/lightdm-evo.git /.init/evo
cp -r /home/psycho/.init/evo /usr/share/lightdm-webkit/themes/lightdm-evo
sed -i 's/^webkit_theme\s*=\s*\(.*\)/webkit_theme = lightdm-evo/g' /etc/lightdm/lightdm-webkit2-greeter.conf
sed -i 's/^\(#\?greeter\)-session\s*=\s*\(.*\)/greeter-session = lightdm-webkit2-greeter/g' /etc/lightdm/lightdm.conf

rm -rf /.init
