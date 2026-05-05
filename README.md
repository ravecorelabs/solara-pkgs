# Solara PKGS 🌍

Custom package repository for Solara Linux.

## Usage

Add to `/etc/pacman.conf`:
```bash
[solara-pkgs]
SigLevel = Optional TrustAll
Server = https://raw.githubusercontent.com/RaveCore-Labs/solara-pkgs/main/$arch
```

Then install packages:
```bash
sudo pacman -S yay pantheon-desktop
```

## Available Packages

- `yay` - AUR helper (install this first!)
- `pantheon-desktop` - Elementary OS desktop environment
- More coming soon...

## For Maintainers

This repo uses GitHub Actions to automatically build and update packages from AUR.

### Adding a new package

1. Edit `packages.yaml` to add the package name
2. The workflow will automatically build it on the next run

### Manual build

```bash
# Build a package locally
makepkg -s

# Upload to repo
git add *.pkg.tar.zst
git commit -m "Add package"
git push
```