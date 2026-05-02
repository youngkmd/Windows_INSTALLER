📖 Overview

FREE KADER Windows Installer is a license-based tool that installs Windows on any KVM-based Linux VPS in 10–30 minutes. It downloads a pre-configured Windows disk image, writes it to your VPS root disk, and reboots into Windows — with RDP enabled and ready to connect.

- ✅ Works on any KVM VPS (Hetzner, Contabo, DigitalOcean, Vultr, Linode, OVH, and more)
- ✅ Supports x86_64 and ARM64 processors
- ✅ 7 Windows versions available
- ✅ RDP pre-enabled on port 3389
- ✅ License credits never expire
- ❌ OpenVZ is not supported


## ⚡ Quick Start

 1. SSH Into Your VPS

```bash
ssh root@YOUR_VPS_IP
```

### 3. Run the Installer

```bash
curl -o ~/kader.sh https://raw.githubusercontent.com/youngkmd/Freedom/refs/heads/main/installer.sh
```

```bash
chmod +x ~/kader.sh
```

```bash
ln -sf ~/kader.sh /usr/local/bin/k
```

### 4. Follow the Prompts

```

Select Windows version to install:

  41) Windows 11               42) Windows 10
  43) Windows 7                44) Windows Server 2025
  45) Windows Server 2022      46) Windows Server 2019
  47) Windows 11 ARM

Enter choice [41-47]: 45

[WARNING] This will install Windows Server 2022 on this server.
[WARNING] ALL existing data will be LOST.
[WARNING] 1 install credit will be used.

Type YES to confirm and start installation: YES
```

### 5. Connect via RDP

After 10–30 minutes your VPS reboots into Windows. Connect via Remote Desktop:

| Field    | Value           |
|----------|-----------------|
| Host     | `YOUR_VPS_IP:3389` |
| Username | `Administrator` |
| Password | `Teddysun.com`  |

> ⚠️ **Change the default password immediately** after first login:
> ```
> net user Administrator YourNewStrongPassword
> ```

---

## 🪟 Supported Windows Versions

| Option | Version | Architecture | Notes |
|--------|---------|--------------|-------|
| `41` | Windows 11 | x86_64 | Modern desktop |
| `42` | Windows 10 | x86_64 | Stable, wide compatibility |
| `43` | Windows 7 | x86_64 | Legacy software support |
| `44` | Windows Server 2025 | x86_64 | Latest server OS |
| `45` | Windows Server 2022 | x86_64 | Recommended for servers |
| `46` | Windows Server 2019 | x86_64 | Proven LTS edition |
| `47` | Windows 11 ARM | ARM64 | ARM-based KVM VPS only |

> Windows is installed in **evaluation mode** (fully functional, activation watermark visible). A valid Microsoft license key is required for full activation — not included.

---

## 🖥️ Compatible VPS Providers

Any KVM-based VPS works. Tested providers include:

| Provider | VNC Required (First Login) | Notes |
|----------|---------------------------|-------|
| **Hetzner Cloud** | Usually not required | Excellent compatibility |
| **Vultr** | Usually not required | Fast network speeds |
| **Linode / Akamai** | Usually not required | |
| **Contabo** | ✅ Required | First VNC login triggers network auto-setup |
| **DigitalOcean** | ✅ Required | First VNC login triggers network auto-setup |
| **OVHcloud** | May be required | Depends on instance type |
| **Hostinger VPS** | Usually not required | |
| **UpCloud / Kamatera / Scaleway / IONOS** | Usually not required | |

> ❌ **OpenVZ is not supported.** KVM virtualization is required.

---

## 🖥️ First Login — VNC Notice

On some providers (Contabo, DigitalOcean), RDP won't work immediately after installation. You need to do a **one-time VNC login** first:

0. Download VNC Viewer  :[realvnc.com](https://www.realvnc.com/en/connect/download/viewer/)
1. Open your provider's VNC/console from their control panel
2. Log in with `Administrator` / `Teddysun.com`
3. A network configuration script runs **automatically** in the background
4. Wait ~60 seconds for it to complete
5. RDP is now ready — close VNC and connect normally

This is a one-time step. All future logins use RDP.

---
## 🔒 Security Notes

- The default Administrator password (`Teddysun.com`) is **publicly known** — change it immediately after first login
- RDP is exposed on port 3389 by default — consider restricting it to your IP via your provider's firewall
- Windows is installed in evaluation mode; activate with a legitimate Microsoft license key for production use

---



## ⚖️ Legal

- Windows is a trademark of **Microsoft Corporation**
- This tool installs Windows in evaluation/trial mode — you are responsible for licensing compliance
