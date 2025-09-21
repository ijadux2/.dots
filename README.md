# Dotfiles for ijadux2

This repository contains personal configuration (dotfiles) for the user `ijadux2`.
It is organized by component (Zsh, Neovim, Hyprland, Kitty, Nix, etc.) and is designed to be used with Nix/Home Manager but also supports manual installation of individual pieces.

## What's in this repo

- `home-manager/` — a Home Manager flake and `home.nix` to declaratively manage the user's home configuration.
- `nix/` — general Nix configuration files.
- `nvim/` — Neovim configuration (LazyVim starter + plugins). See `nvim/README.md`.
- `hypr/` — Hyprland configuration (window manager settings, keybinds, etc.).
- `kitty/` — Kitty terminal configuration and themes.
- `fastfetch/` — small fastfetch configuration snippet.
- `starship.toml` — Starship prompt configuration.
- `zsh.txt` — Zsh configuration / notes (contains `oh-my-zsh` settings and aliases).

## Highlights from current config

- Zsh: The `zsh.txt` file shows usage of `oh-my-zsh` with theme `robbyrussell`, plugins including `git`, `starship`, `zsh-autosuggestions`, `zsh-syntax-highlighting`, `zoxide`, and useful aliases like `v` → `nvim`, `ls` → `lsd`, and `cd` → `z`.
- Neovim: Based on LazyVim starter. See `nvim/README.md` for details.
- Home Manager flake: `home-manager/README.md` includes common `nix` commands to build and activate the Home Manager configuration.

## Installation

Two recommended ways to use these dotfiles: declarative (Nix + Home Manager) and manual (copy/install selected files).

### Declarative (recommended)

Prerequisites: Nix and Home Manager (flakes-enabled Nix recommended).

1. Clone or symlink this repository to `~/.dots` (or keep it where you prefer).

2. Use the Home Manager flake to build and activate your configuration. From this repo root:

```bash
# Build and activate the Home Manager activation package
nix run /home/ijadux2/.config/home-manager#homeConfigurations.ijadux2.activationPackage

# Or, if you have `home-manager` available as a command:
home-manager -f /home/ijadux2/.config/home-manager switch
```

Notes:
- If `homeConfigurations` shows `unknown`, ensure `home-manager/home.nix` exists and exports a valid module (sets `home.username` and `home.homeDirectory`).
- The flake currently points at `nixpkgs-unstable` and `nix-community/home-manager` — update `home-manager/flake.nix` inputs to change pins.

### Manual (selective)

If you don't want to run Nix/Home Manager, you can copy or source individual configs:

- Zsh: Add relevant content from `zsh.txt` to your `~/.zshrc`. Ensure you have `oh-my-zsh` installed and the referenced plugins available.
- Starship: Copy `starship.toml` to `~/.config/starship.toml` and install `starship`.
- Kitty: Copy files from `kitty/` into `~/.config/kitty/`.
- Neovim: See `nvim/README.md` for installing LazyVim and plugin setup.

## Customization

- Update `starship.toml` to change prompt behavior.
- Edit files under `hypr/` to customize Hyprland keybinds, themes, and layouts.
- Modify `nvim/` to add or remove plugins; use LazyVim docs for guidance.
- For Home Manager: edit `home-manager/home.nix` and re-run the activation commands above.

## Environment notes

- Zsh config references a Nix profile path and sources `/home/ijadux2/.nix-profile/etc/profile.d/nix.sh` when present.
- `zsh.txt` contains an `NGROK_AUTHTOKEN` environment variable — be careful not to commit or expose secrets in public repositories. Consider removing or replacing tokens with secret management (e.g., `home.sessionVariables` sourced from an encrypted file) before sharing.

## Contributing / Personalizing

This repository reflects a single user's environment. If you want to adapt it for your use:

1. Fork/clone the repo.
2. Search and replace `ijadux2` with your username where relevant (`home-manager` entries, paths).
3. Run the Home Manager activation or copy files manually.

If you want to contribute improvements back (tips, fixes), open a pull request with a short description.

## License

These dotfiles are provided as-is. No explicit license is included here — add a `LICENSE` file if you'd like to apply one.

---

If you'd like, I can also:

- Convert `zsh.txt` into a proper `~/.zshrc` file and add a prompt to load it.
- Add a `Makefile` or simple installer script to bootstrap these dotfiles on a fresh machine.
- Remove/flag secrets like the `NGROK_AUTHTOKEN` and suggest secure alternatives.

Tell me which of the above you want next and I'll implement it.
