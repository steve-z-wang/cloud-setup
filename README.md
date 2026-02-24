# Cloud GPU Setup

Setup scripts for training on cloud GPUs (RunPod, etc).

## Quick start

```bash
git clone https://github.com/steve-z-wang/cloud-setup.git /tmp/cloud-setup
bash /tmp/cloud-setup/setup.sh
```

Then clone your project and install deps:

```bash
bash /tmp/cloud-setup/scripts/repo.sh git@github.com:steve-z-wang/one.git
bash /tmp/cloud-setup/scripts/deps.sh /workspace/one/requirements.txt
```

## Scripts

| Script | What it does |
|---|---|
| `setup.sh` | Run all base scripts below |
| `scripts/system.sh` | Install system packages (tmux, htop, nvtop, tsp) |
| `scripts/ssh.sh` | Setup SSH key for GitHub (persists on /workspace) |
| `scripts/git.sh` | Configure git name/email |
| `scripts/repo.sh <url>` | Clone or pull a repo to /workspace |
| `scripts/deps.sh <req.txt>` | Install Python dependencies |

## RunPod setup

1. Create a **network volume** (20-50 GB)
2. Create a pod with the volume at `/workspace`
3. SSH in and run the quick start above
4. First run takes ~5 min. New pods reuse the volume — just re-run `setup.sh` to restore SSH keys and pull latest code
