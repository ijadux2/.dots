Home Manager flake for /home/ijadux2

This directory is a Home Manager flake that imports `home.nix`.

Common commands:

- Show flake outputs:

```bash
nix flake show /home/ijadux2/.config/home-manager
```

- Apply the home configuration (recommended when using Home Manager as a user):

```bash
# build and activate the configuration
nix run /home/ijadux2/.config/home-manager#homeConfigurations.ijadux2.activationPackage
# or, with home-manager installed as a command
home-manager -f /home/ijadux2/.config/home-manager switch
```

Notes:
- If `homeConfigurations` shows `unknown`, ensure `home.nix` exists and exports a valid Home Manager module (e.g., sets `home.username` and `home.homeDirectory` or relies on `home.sessionVariables`).
- The flake points to `nixpkgs-unstable` and `home-manager` from `nix-community`. Adjust `flake.nix` inputs if you prefer a different channel or pinned revision.
