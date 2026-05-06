# solara-pkgs

AUR package repository for Solara Linux.

## What's in here

This repo builds and hosts AUR-only packages that aren't in the official Arch repos. If a package exists in `extra` or `core`, it doesn't belong here.

**Note on Pantheon:** Pantheon and its switchboard plugs are NOT on the AUR — they're in the official Arch `extra` repo. Install with `pacman -S pantheon`.

## Packages

| Package | Description |
|---------|-------------|
| `yay` | AUR helper — the one you actually need |
| `visual-studio-code-bin` | Official Microsoft VS Code binary |
| `arc-gtk-theme` | Flat GTK theme with transparent elements. Works great on Cinnamon, LXQt, Pantheon |
| `arc-icon-theme` | Matching icon theme for arc-gtk-theme |

## Usage

Add to `/etc/pacman.conf`:

```
[solara-pkgs]
SigLevel = Optional TrustAll
Server = https://ravecorelabs.github.io/solara-pkgs/x86_64
```

Then run:

```bash
pacman -Sy
pacman -S yay visual-studio-code-bin arc-gtk-theme arc-icon-theme
```

## Browse packages

[ravecorelabs.github.io/solara-pkgs](https://ravecorelabs.github.io/solara-pkgs)

## License

GPL-3.0
