# Linux-Kid-Safe
A starting point for hardening your linux install for children and teens so they can not bypass some of your security measures. 


I Started this project with the help of Chat GPT on March 12 2026. I know it started with AI but i'd like to get it expanded to be more useful and to be more of a community project.

---
A simple toolkit for locking down Linux desktops for children.

# Danger - At the moment this is a very basic script that only implements a few features. It is not a complete solution and should not be used as-is in production environments. Use at your own risk and always test in a safe environment first.

#Will possibly destroy all users on the system if used incorrectly. Always backup your data before running this script.


---

## Supported Distros
- Debian / Ubuntu
- Fedora
- Arch

## Supported Desktop Environments
- GNOME
- KDE (basic support)

## Features
- Non-admin child user creation
- GNOME lockdown policies
- Network settings protected with polkit
- Firefox parental restrictions
- Cross-distro installer

## Usage

Run as root:

```bash
sudo bash install.sh
```

## Future Ideas
- DNS enforcement
- Flatpak restrictions
- USB device blocking
- Login time limits
- Kiosk mode

Contributions welcome!
