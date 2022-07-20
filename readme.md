# IC Builder Quick Setup

Apparently the builders get nuked often. This script handles for you installing some reasonable dev dependencies and cloning the `ic` repo.

## Usage:

```
git clone https://github.com/anchpop/ic-builder-quick-setup.git
cd ic-builder-quick-setup
./setup.sh
```

## What it does

1. Installs a bunch of quality-of-life tools like `zsh` (with the `starship` theme), `lsd`, etc.

1. Clones `ic`

1. Sets up git-branchless in `ic`

1. Sets up direnv in `ic`

1. Sets up precommit in `ic`

1. Adds some aliases to `zsh`, like `clippy` to run the same command that's run on the CI, and `gpf` for `git push --force-with-lease` (which you should almost always use over `git push --force`). 
