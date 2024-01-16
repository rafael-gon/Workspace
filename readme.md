# Rafael's Linux Setup Script

## Overview

This Bash script automates the setup process for a Linux environment, installing various essential packages and configuring popular applications. The script is designed to be run on systems with Git and Yay package manager installed.

**Note: Use this script at your own risk. Ensure that you have backups before proceeding.**

## Prerequisites

Before running the script, make sure you have the following dependencies installed on your system:

- Git
- Yay

## Usage

1. Clone this repository:

    ```bash
    git clone https://github.com/rafael-gon/workspace.git
    ```

2. Navigate to the script directory:

    ```bash
    cd workspace
    ```

3. Run the script:

    ```bash
    bash install.sh
    ```

4. Follow on-screen instructions.

## Features

- Installs base development tools, fonts, and various applications.
- Configures Bluetooth and enables essential services.
- Installs and configures Flatpak.
- Creates desktop entries for WhatsApp and Notion.

## Desktop Environment Selection

The script provides an option to choose your preferred desktop environment:

- Gnome
- Sway
- Plasma

## Additional Configuration

- **Gnome:** Installs Gnome Shell, extensions, and related tools.
- **Sway:** Installs Sway window manager with additional tools.
- **Plasma:** Installs the Plasma desktop environment and related components.

## Disclaimer

This script is provided as-is without any warranty. Use it responsibly and review the script content before execution.

## Credits

- [Whiptail](https://en.wikibooks.org/wiki/Bash_Shell_Scripting/Whiptail) - Used for creating dialog boxes in Bash scripts.
- [Yay](https://github.com/Jguer/yay) - Yay AUR Helper.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

---

Feel free to customize the README to better fit your preferences and provide more details about the purpose and usage of your script.
