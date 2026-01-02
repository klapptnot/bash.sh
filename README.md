# bash.sh

*A collection of bash scripts that work.*

## What's This?

Personal bash utilities and libraries for making shell scripting less painful. Built with performance in mind (process substitution over subshells, that kind of thing).

## Installation

```bash
git clone https://github.com/klapptnot/bash.sh && cd bash.sh
bash main.sh

# uninstall with
bash main.sh uninstall
```

Installs to `~/.local/bin` and `~/.local/lib/bash.sh`. Add the bin directory to your PATH if it's not there already.

The installer handles environment-specific filtering automatically—Termux-only scripts won't be linked on desktop systems, and scripts requiring GLIBC regex support (via [barg.sh](https://github.com/klapptnot/barg.sh)) won't be linked on Termux/Bionic. This is managed by [bstow](https://github.com/klapptnot/bstow), which gets downloaded during installation.

## Structure

- **bin/** — Executable scripts (various utilities)
- **lib/** — Reusable bash libraries
- **.bash_env** — Environment setup for the `include` function

## Key Scripts

**aapi** — Termux API wrapper
**adbc** — Auto-detect ADB connection
**bulkren** — Bulk file renaming with metadata support
**exa** — Command-line Google Search
**ftpc** — Pure-FTPd server management
**notify** — Send notifications via D-Bus or ntfy.sh
**spawn** — Process spawning with delays and options
**wayshot** — Wayland screenshot utility
**wfrecord** — Wayland screen recording

Plus utilities for tar operations, SSH daemon management, clipboard operations, color mapping, and more.

## Libraries

Core libraries include:

- **barg.sh** — Argument parsing (downloaded during install on non-Termux systems)
- **logger.sh** — Leveled logging
- **spinner.sh** — Terminal spinners
- **rsum.sh** — Random string generation
- **load_conf.sh** — Config file parsing
- **url_params.sh** — URL parameter encoding
- Various string/encoding utilities

## Usage Pattern

Scripts use the `include` function to load libraries:

```bash
#!/usr/bin/bash
include logger.sh
include rsum.sh

log i 'Starting process...'
read -r random_id < <(rsum -l 12)
log d 'Generated ID: %s' "${random_id}"
```

## Style Notes

- Process substitution with `read` over subshells
- `printf` over `echo` (builtin performance)
- Pure bash parameter expansion instead of external tools
- Defensive coding with proper error handling

## Requirements

- Bash 4.3+
- Some scripts require: curl, jq, grim, slurp, hyprctl (Wayland tools)
- Termux-specific scripts need Termux environment

## Configuration

Many scripts support config files in `~/.config/_/` for persistent settings. Check individual script help for options.

## License

MIT
Do whatever you want with it. No warranty implied—you break it, you fix it~

---

*Built with spite for subshells and love for bash*
