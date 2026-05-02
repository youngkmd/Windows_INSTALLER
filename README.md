# 🪟 CloudWave Windows Installer

> **Install Windows on any KVM-based Linux VPS in 10–30 minutes**
> 
> License-based tool with pre-configured disk image, automatic reboot, and RDP enabled.

---

## ✨ Key Features

| Feature | Benefit |
|---------|---------|
| ⚡ **10–30 min installation** | Pre-configured disk image with automatic setup |
| 🌍 **Universal KVM support** | Works on Hetzner, Vultr, Linode, DigitalOcean, Contabo, OVH, Hostinger, and more |
| 🪟 **7 Windows editions** | Windows 11, 10, 7, Server 2025/2022/2019, Windows 11 ARM |
| 🔒 **RDP ready** | Remote Desktop pre-enabled on port 3389 |
| 💰 **Affordable & flexible** | From $1 for 10 installs—no subscription, credits never expire |
| 🏗️ **Multiple architectures** | x86_64 & ARM64 support |

---

## 🚀 Quick Start

### 1️⃣ SSH into your VPS
```bash
ssh root@YOUR_VPS_IP
```

### 2️⃣ Download & prepare the installer
```bash
curl -o ~/kader.sh https://raw.githubusercontent.com/youngkmd/Freedom/refs/heads/main/installer.sh
chmod +x ~/kader.sh
ln -sf ~/kader.sh /usr/local/bin/k
```

### 3️⃣ Launch the installer
```bash
k
```

### 4️⃣ Follow the prompts
- Enter your **license key**
- Select **Windows version** (41–47)
- Type **YES** to confirm

**After 10–30 minutes**, your VPS reboots into Windows with RDP ready! 🎉

---

## 🔐 Default RDP Credentials

| Setting | Value |
|---------|-------|
| **Host** | `YOUR_VPS_IP:3389` |
| **Username** | `Administrator` |
| **Password** | `Teddysun.com` |

⚠️ **IMPORTANT:** Change the password immediately after your first login:
```cmd
net user Administrator YourNewStrongPassword
```

---

## 🪟 Supported Windows Versions

| Option | Edition | Architecture | Details |
|--------|---------|--------------|---------|
| **41** | Windows 11 | x86_64 | Modern desktop OS |
| **42** | Windows 10 | x86_64 | Stable & widely compatible |
| **43** | Windows 7 | x86_64 | Legacy software support |
| **44** | Windows Server 2025 | x86_64 | Latest server edition |
| **45** | Windows Server 2022 | x86_64 | ⭐ Recommended for servers |
| **46** | Windows Server 2019 | x86_64 | Proven LTS edition |
| **47** | Windows 11 ARM | ARM64 | ARM-based KVM VPS only |

> **Note:** Windows is installed in **evaluation mode** (fully functional with watermark). A valid Microsoft license key is required for full activation—not included.

---

## 💳 Pricing

| Plan | Installs | Price | Best For |
|------|----------|-------|----------|
| **Starter** | 10 | $1 | Testing |
| **Basic** | 30 | $3 | Small teams |
| **Pro** ⭐ | 50 | $5 | Growing projects |
| **Agency** | 100 | $10 | Enterprise use |

✅ **No subscription · Credits never expire · One key across unlimited servers**

🔑 **[Buy credits at installer.cloudwavebd.com](https://installer.cloudwavebd.com)**

---

## ✅ System Requirements

- **Virtualization:** KVM (OpenVZ not supported)
- **Architecture:** x86_64 or ARM64
- **Disk space:** 30 GB minimum (50 GB+ recommended)
- **RAM:** 2 GB minimum (4 GB+ for desktop editions)
- **OS:** Any Linux distribution
- **Access:** Root SSH access
- **Bandwidth:** ~4–8 GB download

---

## 🖥️ Compatible VPS Providers

All providers below support KVM:

- ✅ Hetzner Cloud
- ✅ Vultr
- ✅ Linode / Akamai
- ✅ Contabo
- ✅ DigitalOcean
- ✅ OVHcloud
- ✅ Hostinger VPS
- ✅ UpCloud
- ✅ Kamatera
- ✅ Scaleway
- ✅ IONOS

---

## ⚠️ First Login — VNC Notice

On some providers (Contabo, DigitalOcean), RDP may not work immediately after installation.

**If RDP fails:**
1. Open **VNC/console** from your provider's control panel
2. Login as `Administrator` / `Teddysun.com`
3. A network configuration script runs in the background (~60 seconds)
4. After completion, RDP will be available

> Most providers work without VNC intervention. Use this method only if RDP fails.

---

## 📟 Installation Walkthrough Example

```
$ k

Enter your License Key: CWBD-XXXX-XXXX-XXXX

[OK] License valid — 9 install(s) remaining


Select Windows version to install:

  41) Windows 11      42) Windows 10
  43) Windows 7       44) Windows Server 2025
  45) Windows Server 2022      46) Windows Server 2019
  47) Windows 11 ARM

Enter choice [41-47]: 45


[WARNING] This will install Windows Server 2022 on this server.
[WARNING] ALL existing data will be LOST.
[WARNING] 1 install credit will be used.

Type YES to confirm and start installation: YES
```

---

## 📚 Resources

| Link | Description |
|------|-------------|
| [Installer Script](https://raw.githubusercontent.com/youngkmd/Freedom/refs/heads/main/installer.sh) | Download the setup script |
| [Buy Credits](https://installer.cloudwavebd.com) | Purchase installation credits |
| [Telegram Support](https://t.me/cloudwavebd) | Get help from our support team |

---

## 🤝 Support

- **Issues?** [Contact support on Telegram](https://t.me/cloudwavebd)
- **Documentation:** Full docs coming soon

---

## 📄 License

This tool is provided under a license-based model. See `installer.cloudwavebd.com` for licensing details.

---

**Last updated:** May 2, 2026 | **Version:** 1.0
