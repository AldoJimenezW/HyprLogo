# HyprLogo

<div align="center">

*Run NetLogo 6.2.1 smoothly on Wayland compositors like Hyprland*

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)
[![Supported Distributions](https://img.shields.io/badge/Supported-Arch%20|%20openSUSE%20|%20Ubuntu%20|%20Fedora-green)](https://github.com/yourusername/HyprLogo)

</div>

## 🔍 Overview

HyprLogo is a solution for running NetLogo 6.2.1 on modern Linux desktops using Wayland compositors (particularly Hyprland). It fixes rendering issues like black screens and improves overall performance through properly configured environment variables.

This tool is perfect for students and researchers who need to use NetLogo in modern Linux environments.

## ✨ Features

- **Easy installation** across major Linux distributions
- **Fixes black screen issues** common when running Java applications in Wayland
- **Proper desktop integration** with application launcher entries
- **Optimized performance** through carefully tuned environment variables
- **Educational environment ready** - works perfectly for classroom settings

## 📋 Requirements

- Linux distribution (Arch, openSUSE, Ubuntu/Debian, or Fedora)
- Internet connection (for downloading NetLogo and dependencies)
- Wayland compositor (Hyprland, Sway, or other)

## 🚀 Installation

### Option 1: Quick Install

```bash
git clone https://github.com/AldoJimenezW/HyprLogo.git
cd HyprLogo
chmod +x install.sh
./install.sh
```

Follow the on-screen prompts to select your distribution.

### Option 2: Manual Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/AldoJimenezW/HyprLogo.git
   cd HyprLogo
   ```

2. Install dependencies according to your distribution:
   - Arch: `sudo pacman -S jdk11-openjdk wget`
   - openSUSE: `sudo zypper install java-11-openjdk java-11-openjdk-devel wget`
   - Ubuntu/Debian: `sudo apt install openjdk-11-jdk wget`
   - Fedora: `sudo dnf install java-11-openjdk java-11-openjdk-devel wget`

3. Run the installation script:
   ```bash
   chmod +x install.sh
   ./install.sh
   ```

## 🖥️ Usage

After installation, you can launch NetLogo in two ways:

1. From your application launcher/menu (search for "NetLogo")
2. From the command line:
   ```bash
   ~/Documents/HyprLogo/run-netlogo.sh
   ```

## 🔧 How It Works

HyprLogo configures the Java environment with specific variables that ensure proper rendering in Wayland:

```bash
export _JAVA_AWT_WM_NONREPARENTING=1
export _JAVA_OPTIONS="-Dsun.java2d.xrender=false -Dsun.java2d.opengl=false -Dawt.useSystemAAFontSettings=on -Dswing.aatext=true"
export GDK_BACKEND=x11
export XDG_SESSION_TYPE=x11
export QT_QPA_PLATFORM=xcb
export LIBGL_ALWAYS_SOFTWARE=1
unset XLIB_SKIP_ARGB_VISUALS
```

These settings force Java applications to use X11 compatibility mode and software rendering, which prevents the black screen issues commonly encountered in Wayland environments.

### 🛠️ Hyprland Configuration

For optimal performance with Hyprland, add these lines to your `~/.config/hypr/hyprland.conf`:

```conf
# Java application configuration for Hyprland
windowrulev2 = workspace 2, class:^(netlogo-gui-Startup)$
windowrulev2 = float, class:^(netlogo-gui-Startup)$

# Environment variables for Java applications
env = _JAVA_AWT_WM_NONREPARENTING,1
env = _JAVA_OPTIONS,-Dawt.useSystemAAFontSettings=on -Dswing.aatext=true
env = GDK_BACKEND,x11
```

This configuration helps Hyprland properly manage NetLogo windows and ensures consistent rendering.

## 🤝 Contributing

Contributions are welcome! Feel free to:

- Report bugs
- Suggest improvements
- Add support for more distributions
- Enhance documentation

## 📄 License

This project is licensed under the MIT License - see the LICENSE file for details.

## 📚 Related Projects

- [NetLogo](https://ccl.northwestern.edu/netlogo/) - The official NetLogo website
- [Hyprland](https://hyprland.org/) - Dynamic tiling Wayland compositor

---

<div align="center">
<p>Created with ❤️ for the Linux and NetLogo communities</p>
</div>
