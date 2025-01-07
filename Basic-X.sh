#!/data/data/com.termux/files/usr/bin/bash

# Function to print animated text with color
animate_text() {
  local text="$1"
  local color="$2"
  echo -e "\033[${color}m"  # Apply color
  for (( i=0; i<${#text}; i++ )); do
    echo -n "${text:i:1}"
    sleep 0.05
  done
  echo -e "\033[0m"  # Reset color
}

# Function to animate package installation
install_package() {
  local package="$1"
  animate_text "Installing $package..." "1;32"  # Green color for each package
  pkg install $package -y
  sleep 1
}

# Clear the screen
clear

# Display Banner
echo -e "\033[38;5;214m"  # Orange color
echo " ______   ___   _____  _____  _____         __   __"
echo "| ___ \ / _ \ /  ___||_   _|/  __ \        \ \ / /"
echo "| |_/ // /_\ \\ \`--.   | |  | /  \/ ______  \ V / "
echo "| ___ \|  _  | \`--. \  | |  | |    |______| /   \ "
echo "| |_/ /| | | |/\__/ / _| |_ | \__/\        / /^\ \ "
echo "\____/ \_| |_/\____/  \___/  \____/        \/   \/ "
echo -e "\033[0m"  # Reset color
echo -e "\033[38;5;214mDeveloped by Tech-Xploit\033[0m\n"  # Text in orange

# Get terminal width
cols=$(tput cols)

# Calculate the padding to center the "Welcome to BASIC-X Tool" message
padding=$(( (cols - 27) / 2 ))  # 27 is the length of the "Welcome to BASIC-X Tool" text

# Print "Welcome to BASIC-X Tool" centered
printf "%${padding}s" ""  # Add leading spaces
animate_text "*Welcome to BASIC-X Tool*" "38;5;51"  # Cyan blue
sleep 0.5  # Add a small pause

# Print the next message on the same screen, starting from the left
animate_text "This tool will install all basic packages for Termux in one click." "1;32"  # Light green
sleep 1  # Pause after the message

# New Screen for Time Warning
clear
animate_text "This tool may take some time to install the packages,please be patient...." "38;5;196"  # Candy red
sleep 2

# New Screen for Confirmation Prompt (On same line)
clear
echo -e "\033[1;32mDo you want to proceed with the installation? (y/n): \033[0m"
read -n 1 answer  # -n 1 allows reading one character on the same line
echo  # Move to the next line
# Handle user response
if [[ "$answer" != "y" ]]; then
  clear
  animate_text "Installation declined!" "1;31"  # Red color for declined message
  exit 0
fi

# Step 1: Updating and upgrading packages
clear
animate_text "Step 1: Updating and upgrading packages..." "1;32"  # Light green
pkg update -y && pkg upgrade -y
sleep 2

# Step 2: Installing Basic Packages
clear
animate_text "Step 2: Installing basic packages..." "1;32"  # Light green
install_package "git"
install_package "wget"
install_package "curl"
install_package "python"
install_package "python2"
install_package "nano"
install_package "vim"
install_package "zip"
install_package "unzip"
sleep 2

# Step 3: Installing System Utilities
clear
animate_text "Step 3: Installing system utilities..." "1;32"  # Light green
install_package "htop"
install_package "tree"
install_package "tmux"
install_package "screen"
install_package "busybox"
install_package "dos2unix"
sleep 2

# Step 4: Installing Development Tools
clear
animate_text "Step 4: Installing development tools..." "1;32"  # Light green
install_package "clang"
install_package "make"
install_package "gdb"
sleep 2

# Completion Message
clear
animate_text "Installation Complete!" "1;34"  # Changed completion color to blue (1;34)
animate_text "All required packages have been installed successfully." "1;34"
sleep 1  # Sleep after completion message

# Thank You Message in Aqua Blue
clear
animate_text "Thank you for using BASIC-X Tool!!" "38;5;51"  # Aqua blue color
sleep 2

# Exit
exit 0
