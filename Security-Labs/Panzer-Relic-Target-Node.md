
# 🛡️ Homelab Deployments: PC 3 — Panzer Relic Setup

A comprehensive look at configuring a bare-metal DevOps test node and security target server running Ubuntu Server 24.04 LTS.

## 💻 Hardware Specification
- **OS:** Ubuntu Server 24.04 LTS (CLI-only) / Linux Mint 22 (XFCE base transition)
- **Compute:** Intel Core i5 4th Gen | Pegatron H81-M1 Motherboard | 8GB DDR3 RAM
- **Storage:** 250GB Seagate 7200 RPM HDD (Mechanical Laptop Drive)
- **Network Role:** 24/7 Web host / Isolated penetration test target node

---

## 🚀 Purpose & Operating System Provisioning

### Why I Built This
This target node provides an isolated environment to safely test security configurations, automate patch deployments, and practice penetration testing methodologies without risking my primary production systems.

---

## 📅 Progress Update: July 30, 2026

### 🔧 OS Installation Log & Status Updates

#### ❌ Phase 1: Debian & Ubuntu Server 24.04 LTS Deployments (FAILED)
*   **Target OS:** Debian Minimal Netinst / Ubuntu Server 24.04 LTS (CLI Only)
*   **Result:** Installation Failure / Post-Boot System Initialization Failure
*   **Root Cause Analysis:** 
    *   **Storage Degradation:** The target server's aging 250GB Seagate mechanical laptop HDD (`7200 RPM`) struggled with high write-latency demands during modern Debian/Ubuntu installation phases, resulting in silent data corruption and installer timeouts.
    *   **Firmware Mismatch:** The Pegatron H81-M1 transition-era legacy motherboard conflicted with the strict modern UEFI layout configurations of Ubuntu 24.04, leading to initialization blocks and bootloader writing failures.

#### ❌ Phase 2: Alpine Linux Deployment (FAILED)
*   **Target OS:** Alpine Linux (v3.20 Standard x86_64)
*   **Result:** Installation Failure (Aborted during manual disk partitioning)
*   **Root Cause Analysis:** 
    *   **Network Isolation:** The node successfully obtained a local DHCP IP address (`192.168.42.242`) from the physical router but completely failed to resolve external DNS records (`wget: bad address 'mirrors.alpinelinux.org'`), forcing an offline configuration fallback.
    *   **Missing Bootloader Dependencies:** Running the installation architecture completely offline meant it could not fetch the mandatory `syslinux` bootloader package required to write a valid boot sector to `/dev/sda`. The ultra-lightweight Alpine live image lacks these binaries natively.

---

#### ⏳ Phase 3: Linux Mint XFCE Deployment (PENDING / NEXT STEPS)
*   **Target OS:** Linux Mint 22.x (XFCE Edition - 64-bit)
*   **Deployment Strategy:** Pivoting away from minimal, network-dependent command-line installers. Switching to a comprehensive, fully self-contained desktop distribution package to bypass baseline network and boot sector dependency conflicts during initial deployment.
*   **Expected Structural Benefits:** 
    *   **Self-Contained Media:** The installation ISO image bundles all legacy BIOS and modern UEFI bootloaders directly on the flash drive, completely eliminating the need to pull package dependencies from the internet during core setup.
    *   **Under-the-Hood Parity:** Built directly on top of the rock-solid Ubuntu package base, ensuring complete compatibility with automated DevOps toolchains (Terraform, Ansible, Docker) and perfectly mirroring target server environments.
*   **Post-Install Configuration Plan:** To maximize hardware optimization, the graphical user interface will be permanently disabled immediately post-installation via:
    ```bash
    sudo systemctl set-default multi-user.target
    ```
    This drops the system down into a pure, headless CLI server configuration to preserve RAM allocations.
