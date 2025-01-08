#!/data/data/com.termux/files/usr/bin/bash

# Function to print animated text with color (optional, can be removed for speed)
animate_text() {
  local text="$1"
  local color="$2"
  echo -e "\033[${color}m"  # Apply color
  echo -n "$text"
  echo -e "\033[0m"  # Reset color
}

# Function to install multiple packages at once in parallel
install_packages() {
  pkg install "$@" -y &
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
sleep 1  # Reduced sleep for animation speed

# Print the next message
animate_text "This tool will install all basic packages for Termux in one click." "1;32"  # Light green
sleep 0.8  # Reduced sleep

# Skip confirmation, proceed directly with installation

# Step 1: Updating and upgrading packages
clear
animate_text "Step 1: Updating and upgrading packages..." "1;32"  # Light green
pkg update -y && pkg upgrade -y
sleep 0.5  # Reduced sleep

# Step 2: Installing Basic Packages in parallel
clear
animate_text "Step 2: Installing basic packages..." "1;32"  # Light green
install_packages git wget curl python python2 nano vim zip unzip

# Step 3: Installing System Utilities in parallel
clear
animate_text "Step 3: Installing system utilities..." "1;32"  # Light green
install_packages htop tree tmux screen busybox dos2unix

# Step 4: Installing Development Tools in parallel
clear
animate_text "Step 4: Installing development tools..." "1;32"  # Light green
install_packages clang make gdb

# Wait for all background processes to finish
wait

# Completion Message
clear
animate_text "Installation Complete!" "1;34"  # Blue color
animate_text "All required packages have been installed successfully." "1;34"
sleep 0.5  # Reduced sleep

# Thank You Message in Aqua Blue
clear
animate_text "Thank you for using BASIC-X Tool!!" "38;5;51"  # Aqua blue color
sleep 0.5  # Reduced sleep

# Exit
exit 0
