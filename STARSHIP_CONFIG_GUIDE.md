# Starship Configuration Guide

This guide covers how to configure Starship, the minimal, blazing-fast, and extremely customizable prompt for any shell.

**Official Documentation:** https://starship.rs/config/

## Table of Contents

- [Getting Started](#getting-started)
- [Config File Location](#config-file-location)
- [Basic Configuration](#basic-configuration)
- [Format Strings](#format-strings)
- [Styling](#styling)
- [Prompt Options](#prompt-options)
- [Common Modules](#common-modules)
- [Examples](#examples)

## Getting Started

To start configuring Starship, you need to create the configuration file:

```bash
mkdir -p ~/.config && touch ~/.config/starship.toml
```

This creates the `.config` directory in your home folder (if it doesn't exist) and creates an empty `starship.toml` file.

You can then edit this file with your preferred text editor:

```bash
# Using nano
nano ~/.config/starship.toml

# Using vim
vim ~/.config/starship.toml

# Using VS Code
code ~/.config/starship.toml
```

## Config File Location

By default, Starship looks for its configuration at `~/.config/starship.toml`.

### Custom Location

You can change the default configuration file location with the `STARSHIP_CONFIG` environment variable:

**Bash/Zsh:**
```bash
export STARSHIP_CONFIG=~/example/non/default/path/starship.toml
```

**PowerShell (Windows):**
```powershell
$ENV:STARSHIP_CONFIG = "$HOME\example\non\default\path\starship.toml"
```

**Cmd (Windows) - in `starship.lua`:**
```lua
os.setenv('STARSHIP_CONFIG', 'C:\\Users\\user\\example\\non\\default\\path\\starship.toml')
```

## Basic Configuration

### Terminology

- **Module:** A component in the prompt that provides contextual information (e.g., `nodejs` shows Node.js version)
- **Variable:** Sub-components within modules that contain specific information (e.g., `version` variable in `nodejs` module)

### Strings in TOML

Starship uses TOML syntax for configuration. Text values can be declared with:
- `'` - Single quotes (literal strings)
- `"` - Double quotes (regular strings)
- `'''` - Triple single quotes (multi-line literal)
- `"""` - Triple double quotes (multi-line regular)

**Special Characters:** The following symbols have special meaning and must be escaped: `$ [ ] ( )`

```toml
# Literal string
format = '☺\☻ '

# Regular string (requires escaping backslashes)
format = "☺\\☻ "

# Escaping Starship symbols
format = '\[\$\] '
```

## Format Strings

Format strings control how modules display their information. They can contain:

### Variables

Variables start with `$` followed by the variable name (letters, numbers, and `_` only):

```toml
# Single variable
format = '$version'

# Multiple variables
format = '$git_branch$git_commit'

# Variables with spacing
format = '$git_branch $git_commit'
```

### Text Groups

Text groups combine formatting and styling:

```toml
# Syntax: [text](style)
format = '[on](red bold)'

# With variables
format = '[⌘ $version](bold green)'

# Nested groups
format = '[a [b](red) c](green)'
```

### Conditional Format Strings

Wrapped in `()`, these only render if all variables inside are non-empty:

```toml
# Shows @ + region value, or nothing if region is empty
format = '(@$region)'

# Always shows nothing (no variables)
format = '(some text)'
```

## Styling

### Style Strings

Most modules have a `style` option for customizing appearance:

```toml
# Green text on blue background
style = 'fg:green bg:blue'

# Bright green text on blue background
style = 'bg:blue fg:bright-green'

# Bold text with ANSI color 27
style = 'bold fg:27'

# Underlined text on burnt orange background
style = 'underline bg:#bf5700'

# Bold italic purple text
style = 'bold italic fg:purple'

# Explicitly disable all styling
style = ''
```

**Note:** Actual appearance depends on your terminal emulator and color theme.

## Prompt Options

Configure prompt-wide settings in your `starship.toml`:

### Key Options

| Option | Default | Description |
|--------|---------|-------------|
| `format` | See below | Custom format string for the prompt |
| `right_format` | `''` | Enable right-side prompt |
| `scan_timeout` | `30` | Timeout for scanning files (milliseconds) |
| `command_timeout` | `500` | Timeout for commands run by starship (milliseconds) |
| `add_newline` | `true` | Add blank line before prompt |
| `palette` | `''` | Custom color palette name |
| `palettes` | `{}` | Define custom color palettes |
| `follow_symlinks` | `true` | Follow symlinks when checking directories |

### Default Prompt Format

If no `format` is specified, Starship uses:

```toml
format = '$all'

# Which expands to all available modules:
# $username, $hostname, $directory, $git_branch, $git_status,
# $nodejs, $python, $rust, $golang, and many more...
```

### Extending Default Format

To add to the default format without duplicating modules:

```toml
# Move directory to second line
format = '$all$directory$character'
```

## Common Modules

### Directory Module

```toml
[directory]
truncation_length = 3
truncate_to_repo = true
format = '[$path]($style)[$read_only]($read_only_style) '
style = 'bold cyan'
```

### Git Branch Module

```toml
[git_branch]
format = '[$symbol$branch]($style) '
symbol = ' '
style = 'bold purple'
```

### Git Status Module

```toml
[git_status]
format = '([\[$all_status$ahead_behind\]]($style) )'
style = 'bold red'
conflicted = '🏳'
ahead = '⇡${count}'
behind = '⇣${count}'
diverged = '⇕⇡${ahead_count}⇣${behind_count}'
untracked = '?${count}'
stashed = '$${count}'
modified = '!${count}'
staged = '+${count}'
renamed = '»${count}'
deleted = '✘${count}'
```

### Language Modules (Node.js example)

```toml
[nodejs]
format = '[via $symbol($version )]($style)'
symbol = ' '
style = 'bold green'
detect_extensions = ['js', 'mjs', 'cjs', 'ts', 'mts', 'cts']
detect_files = ['package.json', '.node-version']
detect_folders = ['node_modules']
```

### Character Module (Prompt Symbol)

```toml
[character]
success_symbol = '[➜](bold green)'
error_symbol = '[➜](bold red)'
vimcmd_symbol = '[V](bold green)'
```

### Command Duration Module

```toml
[cmd_duration]
min_time = 500
format = '[took $duration]($style) '
style = 'bold yellow'
```

## Examples

### Minimal Configuration

```toml
# ~/.config/starship.toml
format = """
$directory\
$git_branch\
$git_status\
$character
"""

[directory]
style = 'bold cyan'

[character]
success_symbol = '[❯](bold green)'
error_symbol = '[❯](bold red)'
```

### Custom Styled Configuration

```toml
# ~/.config/starship.toml
format = '''
[┌───────────────────>](bold green)
[│](bold green)$directory$rust$package
[└─>](bold green) '''

scan_timeout = 10
add_newline = false

# Custom color palette
palette = 'custom'

[palettes.custom]
blue = '21'
mustard = '#af8700'

[directory]
style = 'bold mustard'
truncation_length = 5
```

### Multi-line with Right Prompt

```toml
# ~/.config/starship.toml
format = """
$username\
$hostname\
$directory\
$git_branch\
$git_status\
$line_break\
$character"""

right_format = """
$cmd_duration\
$time"""

[time]
disabled = false
format = '[$time]($style) '
style = 'bold white'

[cmd_duration]
min_time = 1000
format = '[took $duration]($style)'
style = 'bold yellow'
```

### Nerd Font Icons Configuration

```toml
# ~/.config/starship.toml
[aws]
symbol = '  '

[conda]
symbol = ' '

[dart]
symbol = ' '

[directory]
read_only = ' 󰌾'

[docker_context]
symbol = ' '

[elixir]
symbol = ' '

[elm]
symbol = ' '

[git_branch]
symbol = ' '

[golang]
symbol = ' '

[haskell]
symbol = ' '

[hg_branch]
symbol = ' '

[java]
symbol = ' '

[julia]
symbol = ' '

[memory_usage]
symbol = '󰍛 '

[nim]
symbol = '󰆥 '

[nix_shell]
symbol = ' '

[nodejs]
symbol = ' '

[package]
symbol = '󰏗 '

[python]
symbol = ' '

[rust]
symbol = ' '

[scala]
symbol = ' '

[swift]
symbol = ' '
```

## Logging

Starship logs warnings and errors to `~/.cache/starship/session_${STARSHIP_SESSION_KEY}.log`.

Change the cache location with the `STARSHIP_CACHE` environment variable:

```bash
export STARSHIP_CACHE=~/.starship/cache
```

## Advanced Configuration

For more advanced topics including:
- Custom commands
- Conditional formatting
- Color palettes
- Module-specific options

Visit the official documentation at: https://starship.rs/config/

## Testing Your Configuration

After modifying `starship.toml`, open a new terminal or reload your shell:

```bash
# Bash/Zsh
exec $SHELL

# Or simply open a new terminal window
```

## Troubleshooting

1. **Prompt not updating:** Ensure Starship is properly initialized in your shell config (`.bashrc`, `.zshrc`, etc.)
2. **Icons not showing:** Install a [Nerd Font](https://www.nerdfonts.com/) and configure your terminal to use it
3. **Slow prompt:** Increase `scan_timeout` or disable expensive modules
4. **Syntax errors:** Validate your TOML syntax at https://www.toml-lint.com/

## Resources

- **Official Documentation:** https://starship.rs/config/
- **Presets:** https://starship.rs/presets/
- **Advanced Config:** https://starship.rs/advanced-config/
- **GitHub Repository:** https://github.com/starship/starship
