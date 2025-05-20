#!/bin/bash
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⣴⣾⣿⣿⣷⣦⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀
# ⠀⠀⠰⢾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡷⠆⠀⠀⠀
# ⠀⠀⢸⣷⣦⣈⠙⠛⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠛⠋⣁⣴⣾⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣷⣦⣄⣉⠛⠻⢿⣿⣿⡿⠟⠛⣉⣠⣴⣾⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣤⡌⢡⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀
# ⠀⠀⠘⠿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠃⠀⠀
# ⠀⠀⠀⠀⠀⠉⠛⠿⣿⣿⣿⣿⣿⣿⡇⢸⣿⣿⣿⣿⣿⣿⠿⠛⠉⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠛⠿⣿⡇⢸⣿⠿⠛⠋⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀
# ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
#
# Hack The Box Automation Script by @thedvlprguy 
# Hope You Guys Enjoying using this

VPN_PATH=~/Desktop/Hackerstuff/Hackthebox/academy-regular.ovpn  #Change the Path According to Your Preference
LOG_PATH=~/Desktop/Hackerstuff/Hackthebox/htb_log.txt #Change the Path According to Your Preference
PASSWORD='HTB_@cademy_stdnt!' #password for htb always must be same

# Check if the .ovpn file exists
if [[ ! -f "$VPN_PATH" ]]; then
    echo "[!] ERROR: .ovpn file not found at $VPN_PATH"
    echo "[!] Please check the filename and path."
    exit 1
fi

# Connect to VPN
echo "[+] Connecting to HTB VPN using $VPN_PATH..."
sudo openvpn --config "$VPN_PATH" &
VPN_PID=$!

# Wait for VPN to establish
echo "[+] Waiting for VPN to establish..."
sleep 15

# Ask for target IP
read -p "[?] Enter target HTB IP address: " TARGET_IP
echo "[+] Connecting to $TARGET_IP via SSH..."

# Log the IP connection
echo "$(date): Connected to $TARGET_IP" >> "$LOG_PATH"

# SSH using sshpass
sshpass -p "$PASSWORD" ssh -o StrictHostKeyChecking=no htb-student@$TARGET_IP

# After SSH ends
echo "[*] SSH session ended."
read -p "[?] Do you want to disconnect VPN? (y/n): " DISCONNECT

if [[ "$DISCONNECT" == "y" ]]; then
    echo "[+] Killing VPN process..."
    kill $VPN_PID
    echo "[+] VPN disconnected."
else
    echo "[*] VPN still running in background (PID: $VPN_PID)."
fi

