# 🔐 HTBStart – Hack The Box VPN + SSH Automation Script

A powerful Bash script to automate your Hack The Box (HTB) workflow — connects to the HTB Academy VPN and directly SSHs into the target machine in seconds with a single command: `htbstart`.

---

## ⚙️ Features

* ✅ One-liner to start HTB lab workflow
* 🔒 Auto-connects to HTB VPN (OpenVPN)
* 🧠 Prompts for target IP dynamically
* 🧠 Auto SSH into target machine (with pre-set credentials)
* 📁 Logs your IP connection history
* 🛑 Option to auto-disconnect VPN after SSH session

---

## 📁 Folder Structure

```bash
Hackerstuff/
└── Hackthebox/
    ├── academy-regular.ovpn     # Your HTB VPN file
    ├── htb_auto.sh              # Automation script
    └── htb_log.txt              # Connection history log (auto-created)
```

---

## 🛠️ Setup

### 1. Clone or Download

Make sure your `.ovpn` file is placed correctly:

```bash
~/Desktop/Hackerstuff/Hackthebox/academy-regular.ovpn
```

### 2. Make Script Executable

```bash
chmod +x ~/Desktop/Hackerstuff/Hackthebox/htb_auto.sh
```

### 3. Add `htbstart` Alias

Edit your `~/.bashrc` (or `~/.zshrc`) and add:

```bash
alias htbstart='~/Desktop/Hackerstuff/Hackthebox/htb_auto.sh'
```

Apply changes:

```bash
source ~/.bashrc
```

---

## 🚀 Usage

```bash
htbstart
```

1. Connects to the HTB VPN using your `.ovpn` file
2. Waits for the VPN to establish
3. Prompts you to enter the **target IP**
4. Logs your session
5. SSHs into the machine using:

   * **Username:** `htb-student`
   * **Password:** `HTB_@cademy_stdnt!`
6. After SSH ends, gives you an option to disconnect the VPN

---

## 🧩 Requirements

* `openvpn`
* `sshpass`
* `bash` shell

Install dependencies (if missing):

```bash
sudo apt update
sudo apt install openvpn sshpass -y
```
---

## ✨ Author

Made with 🔥 by Aditya a.k.a **thedvlprguy**

---
