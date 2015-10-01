cd

sudo apt-get update -y
sudo apt-get upgrade -y
sudo apt-get install -y git curl zsh
git config --global user.name "Victor Viale"
git config --global user.email "somebodywas@gmail.com"


sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
chsh -s $(which zsh)

# Setup zsh
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh

wget https://gist.github.com/agnoster/3712874/raw/43cb371f361eecf62e9dac7afc73a1c16edf89c7/agnoster.zsh-theme
mv agnoster.zsh-theme .oh-my-zsh/themes

git clone git://github.com/sigurdga/gnome-terminal-colors-solarized.git ~/.solarized
bash .solarized/set_dark.sh 

# TODO: get .zshrc from git, cp to ~/.zshrc


# récupérer sublime text
wget http://c758482.r82.cf2.rackcdn.com/sublime-text_build-3083_amd64.deb -o sublime_text.deb
dpkg -i sublime_text.deb

# Installer rvm et ruby

# Préparer OpenGL et build-essential
sudo apt-get install -y build-essential cmake freeglut3 freeglut3-dev libglew-dev libglu1-mesa libglu1-mesa-dev libgl1-mesa-glx 
