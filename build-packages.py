import yaml
import subprocess
import os

with open("packages.yaml") as f:
    pkgs = yaml.safe_load(f)["packages"]

os.makedirs("/tmp/pkgout", exist_ok=True)

for pkg in pkgs:
    subprocess.run(["git", "clone", f"https://aur.archlinux.org/{pkg}.git", f"/tmp/{pkg}"], check=True)
    subprocess.run(["chown", "-R", "builder:builder", f"/tmp/{pkg}"], check=True)
    subprocess.run(["su", "-", "builder", "-c", f"cd /tmp/{pkg} && makepkg -s --noconfirm --noprogress"], check=True)
    subprocess.run(f"cp /tmp/{pkg}/*.pkg.tar.zst /tmp/pkgout/ || true", shell=True)
