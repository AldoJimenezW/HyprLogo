#!/bin/bash

install_dependencies() {
    case $1 in
        arch)
            sudo pacman -S --noconfirm jdk11-openjdk wget
            ;;
        opensuse)
            sudo zypper --non-interactive install java-11-openjdk java-11-openjdk-devel wget
            ;;
        ubuntu)
            sudo apt update
            sudo apt install -y openjdk-11-jdk wget
            ;;
        fedora)
            sudo dnf install -y java-11-openjdk java-11-openjdk-devel wget
            ;;
        *)
            echo "System not suported"
            exit 1
            ;;
    esac
}

echo "HyprLogo Instaler"
echo "Select Distro:"
echo "1) Arch Linux"
echo "2) openSUSE"
echo "3) Ubuntu/Debian"
echo "4) Fedora"
read -p "Option [1-4]: " distro_option

case $distro_option in
    1)
        distro="arch"
        ;;
    2)
        distro="opensuse"
        ;;
    3)
        distro="ubuntu"
        ;;
    4)
        distro="fedora"
        ;;
    *)
        echo "Error"
        exit 1
        ;;
esac

install_dependencies $distro

mkdir -p ~/Documents
mkdir -p ~/Documents/HyprLogo
cd ~/Documents/HyprLogo

wget https://ccl.northwestern.edu/netlogo/6.2.1/NetLogo-6.2.1-64.tgz
tar -xzf NetLogo-6.2.1-64.tgz
rm NetLogo-6.2.1-64.tgz
mv NetLogo\ 6.2.1 NetLogo-6.2.1

cat > ~/Documents/HyprLogo/run-netlogo.sh << 'EOF'
#!/bin/bash

NETLOGO_DIR="$HOME/Documents/HyprLogo/NetLogo-6.2.1"

export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dsun.java2d.xrender=false -Dsun.java2d.opengl=false -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export GDK_BACKEND=x11
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
export LIBGL_ALWAYS_SOFTWARE=1
unset XLIB_SKIP_ARGB_VISUALS

cd "$NETLOGO_DIR" && ./NetLogo
EOF

chmod +x ~/Documents/HyprLogo/run-netlogo.sh

mkdir -p ~/.local/share/applications

cat > ~/.local/share/applications/netlogo.desktop << EOF
[Desktop Entry]
Type=Application
Name=NetLogo 6.2.1
Comment=NetLogo multi-agent programmable modeling environment
Exec=$HOME/Documents/HyprLogo/run-netlogo.sh
Icon=$HOME/Documents/HyprLogo/NetLogo-6.2.1/NetLogo.ico
Terminal=false
Categories=Education;Science;
StartupWMClass=netlogo-gui-Startup
EOF

if command -v update-desktop-database &> /dev/null; then
    update-desktop-database ~/.local/share/applications
fi

echo "HyprLogo installed in ~/Documents/NetLogo-6.2.1"
echo "exec with: ~/Documents/run-netlogo.sh"
