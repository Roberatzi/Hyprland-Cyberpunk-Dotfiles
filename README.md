# ⚡ ARCH LINUX — NEON VOID

### A Cyberpunk-Inspired Hyprland Desktop

A personal Arch Linux dotfiles project built around **Hyprland**, a dark glass aesthetic, and vibrant neon accents. The goal is a cohesive Wayland desktop that combines a clean workflow with a futuristic cyberpunk atmosphere.

<p align="center">
  <strong>CYAN</strong> `#27e8f4` &nbsp; · &nbsp; <strong>MAGENTA</strong> `#f04dce` &nbsp; · &nbsp; <strong>DARK GLASS</strong>
</p>

---

## 🖥️ Desktop Preview

The desktop follows a dark, translucent visual style with neon highlights, technical details, and a consistent look across the main interface components.

---

## ✨ Features

- **Hyprland** — Wayland compositor with a tiling window-management workflow
- **Waybar** — Desktop bar and system information
- **Rofi** — Application launcher and command interface
- **SwayNC** — Notification center
- **Kitty** — GPU-accelerated terminal emulator
- **Cyberpunk-inspired styling** — Dark surfaces, cyan highlights, and magenta accents
- **Unified appearance** — A consistent design language across the desktop

> This project is a personal work in progress. Components, styling, and configuration may change as the setup evolves.

---

## 🎨 Design & Components

### 01 — Waybar

The central desktop bar brings system information and everyday controls into one interface. The visual direction uses neon cyan and magenta against a dark background. pages are clickable / scrollable and network is to quick access network configuration, the others are on_hover Information.

![Waybar configuration preview](assets/Waybar.png)

### 02 — Rofi

A matching application launcher keeps the workflow fast while maintaining the desktop's futuristic aesthetic.

![Rofi application launcher](assets/Rofi.png)

### 03 — SwayNC

Notifications should feel like part of the desktop instead of a separate application. SwayNC extends the same dark-glass and neon styling to the notification center. Buttons are still in progress but the Power butten redirects you to the [Powermenu](quickshell/powermenu/shell.qml) which allows you to sleep, reboot, shutdown etc.

![SwayNC notification center](assets/Swaync.png)

### 04 — Kitty Terminal

Kitty provides the terminal environment for everyday command-line work, system administration, and configuration editing. The terminals are designed to have "tech" edges like Cyberpunk.

![Kitty terminal layout](assets/Kitty-Layout.png)

---

## 🧩 Technology Stack

| Component | Purpose |
|---|---|
| Arch Linux | Base operating system |
| Wayland | Display protocol |
| Hyprland | Window manager / compositor |
| Waybar | Desktop bar |
| Rofi | Application launcher |
| SwayNC | Notification center |
| Kitty | Terminal emulator |

---

## ⌨️ Keybindings

Hyprland keybindings are defined in the Hyprland configuration. I have seperated them into multiple .lua . Add your actual shortcuts here so users can quickly understand how to navigate the desktop.

| Action | Shortcut |
|---|---|
| Open terminal | Add your configured shortcut |
| Open application launcher | Add your configured shortcut |
| Close active window | Add your configured shortcut |
| Switch workspace | Add your configured shortcut |
| Lock screen | Add your configured shortcut |

---

## 🚀 Installation

These dotfiles are intended for an Arch Linux environment using Wayland and Hyprland.

Before applying any configuration:

1. Review the files and their dependencies.
2. Back up existing configuration files.
3. Install the required packages.
4. Copy or link the desired configuration files into the appropriate locations.
5. Log into Hyprland and verify each component.

**Important:** This repository is a personal configuration, not yet a universal installer. File paths, package dependencies, and startup commands should be verified before copying anything into an existing setup.

---

## 🛠️ Project Status

**Status:** Work in progress

This setup is being refined over time, with a focus on visual consistency, usability, and a cohesive Wayland desktop experience.

---

## 📸 Screenshots

All screenshots used in this README are stored in the `assets/` directory.

| Component | Screenshot |
|---|---|
| Desktop bar | `Waybar.png` |
| Application launcher | `Rofi.png` |
| Notification center | `Swaync.png` |
| Terminal | `Kitty-Layout.png` |

---

<p align="center">
  <sub>Built on Arch Linux · Powered by Hyprland · Styled with neon</sub>
</p>
