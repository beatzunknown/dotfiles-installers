#!/bin/sh

# RE / PWN
sudo apt install -y strace ltrace \
objdump

pip3 install r2pipe \
ropper \
xortoor \
z3-solver \
unicorn \
angr
python3 -m pip install --upgrade pwntools

sudo git clone https://github.com/niklasb/libc-database /opt/libc-database
sudo chown -R andrew:andrew /opt/libc-database
/opt/libc-database/get ubuntu

git clone https://github.com/pwndbg/pwndbg.git /opt/pwndbg && \
cd /opt/pwndbg && ./setup.sh

gem install one_gadget --user-install
gem install seccomp-tools --user-install

sudo apt install -y openssl liblzma pkg-config
cargo install pwninit

wget -qO binaryninja.zip https://cdn.binary.ninja/installers/BinaryNinja-demo.zip
7z x binaryninja.zip
sudo mv binaryninja /opt/binaryninja
wget -qO logo.png https://binary.ninja/icons/android-chrome-512x512.png
sudo cp logos/logo_binaryninja.png /opt/binaryninja/logo.png
sudo echo "[Desktop Entry]                                                     ─╯
Name=Binary Ninja
Exec=/opt/binaryninja/binaryninja
Icon=/opt/binaryninja/logo.png
Terminal=false
Type=Application
MimeType=application/x-binaryninja;x-scheme-handler/binaryninja;
Categories=Utility;
Comment=Binary Ninja: A Reverse Engineering Platform" > /usr/applications/binaryninja.desktop;
chmod +x /usr/applications/binaryninja.desktop
rm binaryninja.zip

wget -qO ghidra.zip https://github.com/NationalSecurityAgency/ghidra/releases/download/Ghidra_10.1.5_build/ghidra_10.1.5_PUBLIC_20220726.zip
7z x ghidra.zip
sudo mv ghidra /opt/ghidra
sudo cp logos/logo_ghidra.png /opt/ghidra/logo.png
sudo echo "[Desktop Entry]
Name=Ghidra
GenericName=Ghidra Disassembler and Decompiler
Exec=/opt/ghidra/ghidra
Icon=/opt/ghidra/logo.png
MimeType=
Terminal=false
Type=Application
Categories=Utility
Comment=Ghidra Disassembler and Decompiler" > /usr/applications/ghidra.desktop;
chmod +x /usr/applications/ghidra.desktop
rm ghidra.zip

# FUZZERS
sudo apt -y install afl++

# WEB SECURITY
wget -qO burpsuite.jar "https://portswigger.net/DownloadUpdate.ashx?Product=Free"
chmod 755 burpsuite.jar
sudo mkdir -p /opt/burpsuite
sudo mv burpsuite.jar /opt/burpsuite/burpsuite.jar
sudo cp logos/logo_burpsuite.svg /opt/burpsuite/logo.svg
echo "[Desktop Entry]
Name=BurpSuite
Exec=/usr/bin/java -jar /opt/burpsuite/burpsuite.jar
Icon=/opt/burpsuite/logo.svg
Terminal=false
Type=Application
Categories=Security;Development;
StartupNotify=false" > burpsuite.desktop
chmod +x burpsuite.desktop
sudo mv burpsuite.desktop /usr/share/applications/burpsuite.desktop

# WIFI SECURITY
sudo apt -y install aircrack-ng
git clone --depth 1 https://github.com/v1s1t0r1sh3r3/airgeddon.git
mv airgeddon /opt/airgeddon

# ENUMERATION
wget -qO amass.zip https://github.com/OWASP/Amass/releases/download/v3.18.2/amass_linux_amd64.zip
7z x amass.zip
mv amass_linux_amd64 /opt/amass
rm amass.zip

# ANDROID
sudo apt install -y adb \
apktool

# FORENSICS
sudo apt install -y autopsy

# MALWARE ANALYSIS
pip install -U flare-capa

# METASPLOIT
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
chmod 755 msfinstall && \
./msfinstall
