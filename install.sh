set -euxo pipefail

cd "$HOME"

whoami

echo "deb https://dl.bintray.com/sbt/debian /" | sudo tee -a /etc/apt/sources.list.d/sbt.list
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 2EE0EA64E40A89B84B2DF73499E82A75642AC823

# echo "deb http://repo.pritunl.com/stable/apt cosmic main" | sudo tee -a /etc/apt/sources.list.d/pritunl.list
# sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A

sudo ln -fs /usr/share/zoneinfo/Europe/Paris /etc/localtime

sudo add-apt-repository ppa:neovim-ppa/stable -y

sudo apt-get update && \
sudo apt-get install -y \
  git curl wget zsh build-essential cmake \
  python-dev python-pip python3-dev python3-pip \
  git-cola \
  libncurses5-dev libncursesw5-dev \
  firefox \
  jq \
  htop \
  liferea \
  sbt \
  gnome-tweak-tool \
  gnome-shell-extensions \
  chrome-gnome-shell \
  tmux \
  autotools-dev \
  automake \
  pkg-config \
  silversearcher-ag \
  tilix \
  postgresql-client \
  docker.io \
  shellcheck \
  yamllint \
  neovim \
  vlc
  # pritunl-client-electron \

printenv

curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -o ./install_zsh.sh
sh ./install_zsh.sh --unattended
rm -f ./install_zsh.sh

mkdir -p "$HOME/.config/nvim"
git clone https://github.com/koroeskohr/dotfiles
(cd dotfiles && bash deploy.sh)
rm -rf dotfiles

pip2 install --user neovim
pip3 install --user neovim

sudo usermod -aG docker "$USER"
sudo systemctl enable docker

curl https://sh.rustup.rs -sSf > rust.sh
sh rust.sh -y
rm -f rust.sh

wget --quiet https://download.java.net/java/GA/jdk11/9/GPL/openjdk-11.0.2_linux-x64_bin.tar.gz && \
  sudo mkdir -p /usr/lib/jvm && \
  sudo tar xvf openjdk-11.0.2_linux-x64_bin.tar.gz --directory /usr/lib/jvm/ && \
  sudo update-alternatives --install /usr/bin/java java /usr/lib/jvm/jdk-11.0.2/bin/java 1 && \
  sudo update-alternatives --install /usr/bin/javac javac /usr/lib/jvm/jdk-11.0.2/bin/javac 1

(
  cd "$(mktemp -d)" && \
    git clone https://github.com/jonas/tig && \
    cd tig && \
    sudo make prefix=/usr/local && sudo make install prefix=/usr/local
)

sudo curl https://raw.githubusercontent.com/rupa/z/master/z.sh -o /etc/profile.d/z.sh

mkdir "$HOME/.nvm"
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.34.0/install.sh | bash

curl -LsS https://go.microsoft.com/fwlink/\?LinkID\=760868 > vscode.deb
sudo apt install ./vscode.deb
rm vscode.deb

# sudo snap install postman

curl -L https://dbeaver.io/files/dbeaver-ce_latest_amd64.deb > dbeaver.deb
sudo apt install ./dbeaver.deb -y
rm ./dbeaver.deb

sudo chsh -s /usr/bin/zsh "$USER"

