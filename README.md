# Dotfiles

My macOS / Ubuntu dotfiles — bash config, aliases, a fancy prompt, and a few
small scripts. Focused on configuration, not installing a pile of software.

Originally based on [Ben "Cowboy" Alman's dotfiles framework][cowboy], trimmed
down and modernized.

[cowboy]: https://github.com/cowboy/dotfiles

## Install

One command bootstraps a fresh machine — clone the repo into `~/.dotfiles`,
install a handful of CLI tools, and link everything into `~/`:

```sh
bash -c "$(curl -fsSL https://raw.githubusercontent.com/ameade/dotfiles/my_files/bin/dotfiles)" && source ~/.bashrc
```

Requirements:
- **macOS**: Xcode Command Line Tools (`xcode-select --install`). Homebrew is
  installed automatically if missing.
- **Ubuntu/Debian**: an account with `sudo` for `apt`.

Re-run any time to pull updates and re-link:

```sh
dotfiles
```

## What the `dotfiles` command does

1. Clones `~/.dotfiles` (or `git pull`s if it already exists).
2. Runs `init/*.sh` — installs a short list of essential CLI tools
   (`git tree ripgrep fzf bash-completion htop`) via Homebrew or apt. Already
   installed? It does nothing.
3. Copies `copy/*` into `~/` (files you'll edit locally, like `.gitconfig`).
4. Symlinks `link/*` into `~/` (edit these and you edit the repo).
5. Symlinks `claude/*` into `~/.claude/`, file by file (see below).

Anything in `~/` that would be overwritten is moved to `~/.dotfiles/backups/`.

## Layout

| Dir       | Purpose                                                             |
|-----------|---------------------------------------------------------------------|
| `bin/`    | Scripts added to `$PATH` (`serve`, `eachdir`, `isip`, `ssid`, `pid`)|
| `init/`   | Per-OS setup, run once per `dotfiles` invocation                    |
| `copy/`   | Copied into `~/` (edit the copy, not the repo)                      |
| `link/`   | Symlinked into `~/` (`.bashrc`, `.bash_profile`, `.tmux.conf`, …)   |
| `source/` | Sourced by `~/.bashrc` on every new shell (aliases, prompt, etc.)   |
| `conf/`   | Config that just sits here; not auto-applied                        |
| `claude/` | Claude Code config, symlinked file-by-file into `~/.claude/`        |

## Aliases & functions

`~/.bashrc` and `~/.bash_profile` stay tiny and shouldn't need editing. Put
aliases, functions, and settings in a file under `source/` — everything there
is sourced automatically on a new shell. Re-source without opening a new shell:

```sh
src          # re-source everything
src 50_misc  # re-source one file (by name, no .sh)
```

## Claude Code config

Files under `claude/` are symlinked **individually** into `~/.claude/` — never
the whole directory, because `~/.claude/` also holds runtime state (sessions,
projects, caches) that must not live in the repo. Tracked:

- `claude/settings.json` → `~/.claude/settings.json` — permissions (deny/ask/allow).
- `claude/CLAUDE.md` → `~/.claude/CLAUDE.md` — global instructions for all projects.

**Not tracked, intentionally:** `~/.claude.json` (OAuth account, history),
`~/.claude/projects`, `sessions`, `telemetry`, and other runtime state.
Machine-specific overrides go in `~/.claude/settings.local.json` (gitignored).

Skills live in `~/.agents/skills/` and are managed by their own installer, so
they're not vendored here.

## Secrets & machine-specific config

**Never commit secrets.** API tokens, work-specific paths, and per-machine
`PATH` tweaks go in gitignored local files that load automatically if present:

- `~/.bashrc.local` — interactive shell (sourced from `.bashrc`)
- `~/.bash_profile.local` — login shell (sourced from `.bash_profile`)
- `source/*.local.sh` — also sourced, also gitignored

## Prompt

The prompt shows git repo status, a timestamp, and the previous command's exit
code, and changes color over SSH or as root. Git repos display as
**[branch:flags]**:

- **?** untracked files
- **!** changed (unstaged) files
- **+** staged files

## License

Framework © 2012 "Cowboy" Ben Alman, MIT licensed. Personal config © Alex Meade.
