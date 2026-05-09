# Repository Context

## Owner
- **Org**: `celestia-foundation` (NOT `ravecorelabs`)

## Repo
- `celestia-foundation/solara-pkgs` - SOLARA Linux AUR package repo

## Project Details
- AUR (Arch User Repository) package building for Solara Linux
- Builds packages from AUR: `yay`, `solara-kernel`, etc.
- Uses GitHub Actions to auto-build and release packages
- GitHub Pages serves pacman repo at https://celestia-foundation.github.io/solara-pkgs

## CI/CD
- Workflow: `.github/workflows/build.yml`
- Uses Arch Linux container (`ghcr.io/archlinux/archlinux:latest`)
- Creates non-root `builder` user for builds
- Uploads artifacts, creates GitHub Releases, deploys to Pages

## pacman.conf
```
[solara-pkgs]
SigLevel = Optional TrustAll
Server = https://celestia-foundation.github.io/solara-pkgs/x86_64
```
