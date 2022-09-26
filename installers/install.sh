#!/bin/sh

sudo dpkg --add-architecture i386
sudo apt update && sudo apt upgrade -y

# ESSENTIALS
sudo apt install -y apt-transport-https \
net-tools \
curl \
wget \
vim \
gnupg2 \
neofetch \
git \
jq \
p7zip-full \
apache2 \
xxd \
tmux \
rsync

# C SETUP

sudo apt install -y manpages-dev man-db build-essential \
gcc-multilib g++-multilib \
libc6 libc6-dev libc6-dbg  \
libc6:i386 libc6-dev:i386 libc6-dbg:i386 libncurses5:i386 libstdc++6:i386 \
libseccomp-dev libssl-def libffi-def libini-config-dev \
gdb gdb-multiarch valgrind \
nasm cmake \


# ZSH INSTALL
sudo apt install -y zsh
chsh -s $(which zsh)

# POWERLEVEL10K SETUP
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
mkdir ~/.local/share/fonts
cd  ~/.local/share/fonts
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Italic.ttf
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Bold%20Italic.ttf
fc-cache -f -v
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/themes/powerlevel10k
sed -i 's/robbyrussell/powerlevel10k\/powerlevel10k/g' ~/.zshrc
echo "Log out of this terminal, change terminal font, and log back in then run 'p10k configure'"

# ZSH SETUP
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/marlonrichert/zsh-autocomplete.git $ZSH_CUSTOM/plugins/zsh-autocomplete
sudo apt install autojump


# PYTHON
sudo apt install -y python3 python3-dev python3-pip ipython3

# PERL
sudo apt install -y perl

# RUBY
sudo apt install -y ruby-full

# RUST
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
rustup update

mkdir -p ~/.local/bin
curl -L https://github.com/rust-lang/rust-analyzer/releases/latest/download/rust-analyzer-x86_64-unknown-linux-gnu.gz | gunzip -c - > ~/.local/bin/rust-analyzer
chmod +x ~/.local/bin/rust-analyzer

# JAVA
sudo apt install -y openjdk-8-jdk openjdk-11-jdk

# DATABASES
sudo apt install -y postgresql

# MISC CLI TOOLS
sudo apt install -y rename
sudo apt install -y ffmpeg libmp3lame0 libmp3lame-dev
sudo apt install -y \
menulibre

# GENERAL PYTHON APPS
pip3 install -U yt-dlp
pip3 install -U tidal-dl

# NETWORK
sudo apt install -y socat netcat \
nmap \
tcpdump wireshark \

# NEOVIM
wget -qO neovim.deb "https://github.com/neovim/neovim/releases/download/v0.7.2/nvim-linux64.deb"
sudo apt install ./neovim.deb
rm neovim.deb
pip3 install -U neovim

curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"

mkdir -p $HOME/.local/share/nvim/site/pack/plugins/start/
cd $HOME/.local/share/nvim/site/pack/plugins/start/
git clone https://git.sr.ht/~whynothugo/lsp_lines.nvim

# SUBLIME TEXT
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install -y sublime-text
echo "Ctrl+Shift+P Install Package Manager then install following packages (with Advanced Install):
DocBlockr 2021,FileIcons,HexViewer,LaTeXTools,MarkdownLivePreview,SublimeLinter,Terminal,Terminus,MIPS Syntax,Rust Enhanced,LSP,LSP-rust-analyzer,LSP-file-watcher-chokidar"

# SNAPS
sudo apt install -y snapd
sudo snap install core
sudo snap install gimp
sudo snap install spotify
sudo snap install firefox
sudo snap install slack
sudo snap install vlc
sudo snap install intellij-idea-ultimate --classic
sudo snap install postman

# VIRTUAL BOX
echo "deb [arch=amd64] http://download.virtualbox.org/virtualbox/debian bullseye contrib" | sudo tee /etc/apt/sources.list
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo apt-key add -
wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | sudo apt-key add -
sudo apt-get update
sudo apt-get install -y virtualbox-6.1

# ANDROID
sudo apt install -y adb \
apktool

# OTHER GUI APPS
# HandBrake
sudo apt install -y appstream autoconf automake autopoint \
build-essential cmake git libass-dev libbz2-dev libfontconfig1-dev \
libfreetype6-dev libfribidi-dev libharfbuzz-dev libjansson-dev liblzma-dev \
libmp3lame-dev libnuma-dev libogg-dev libopus-dev libsamplerate-dev \
libspeex-dev libtheora-dev libtool libtool-bin libturbojpeg0-dev \
libvorbis-dev libx264-dev libxml2-dev libvpx-dev \
m4 make meson nasm ninja-build \ 
patch pkg-config python tar zlib1g-dev
#sudo apt install -y libva-dev libdrm-dev
sudo apt install -y intltool libdbus-glib-1-dev libglib2.0-dev \
libgstreamer1.0-dev libgstreamer-plugins-base1.0-dev libgtk-3-dev \
libgudev-1.0-dev libnotify-dev libwebkit2gtk-4.0-dev
git clone https://github.com/HandBrake/HandBrake.git
mv HandBrake /opt/HandBrake
cd /opt/HandBrake
./configure --launch-jobs=$(nproc) --launch
sudo make --directory=build install

# MKVToolNix
sudo wget -O /usr/share/keyrings/gpg-pub-moritzbunkus.gpg https://mkvtoolnix.download/gpg-pub-moritzbunkus.gpg
echo "deb [signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ bullseye main" | sudo tee /etc/apt/sources.list.d/mkvtoolnix.download.list
echo "deb-src [signed-by=/usr/share/keyrings/gpg-pub-moritzbunkus.gpg] https://mkvtoolnix.download/debian/ bullseye main " | sudo tee /etc/apt/sources.list.d/mkvtoolnix.download.list
sudo apt update
sudo apt install -y mkvtoolnix mkvtoolnix-gui

# PlayOnLinux
sudo apt install -y winbind playonlinux

# MegaBasterd
wget -qO megabasterd.jar https://github.com/tonikelope/megabasterd/releases/download/v7.55/MegaBasterd_7.55.jar
sudo mkdir -p /opt/megabasterd
sudo mv megabasterd.jar /opt/megabasterd/megabasterd.jar

# PIA VPN
sudo apt install -y openvpn
wget -qO pia-linux.run https://installers.privateinternetaccess.com/download/pia-linux-3.3-06906.run
sh pia-linux.run
rm pia-linux.run

# Askii
wget -qO askii.deb https://github.com/nytopop/askii/releases/download/v0.6.0/askii_0.6.0_amd64.deb
sudo apt install -y ./askii.deb
rm askii.deb
