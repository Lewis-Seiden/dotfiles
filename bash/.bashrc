# .bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH
export EDITOR=/usr/bin/nvim

RED="$(tput setaf 1)"
BRIGHT_RED="$(tput setaf 9)"
RESET="$(tput sgr0)"
WHITE="$(tput setaf 7)"

PROMPT_COMMAND=''
PS1='\[${BRIGHT_RED}\]\u\[${WHITE}\]@\[${BRIGHT_RED}\]\H\[${WHITE}\]:\[${RED}\]\w\[${RESET}\]$ '

# User specific aliases and functions
alias c="code ."
alias crun="cargo run"
alias ll="ls -l"
alias la="ls -la"
# stolen from stack overflow
alias tr="ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'"
alias auto-rotate="sh ~/.config/niri/auto_rotate_display.sh"
alias suspend="systemctl suspend"

# Converts LaTeX to Unicode, prints the result, and copies it to the clipboard
uc() {
  if [ $WAYLAND_DISPLAY ]; then
    python -m unicodeit.cli $@ | tee >(wl-copy -n)
  else
    python -m unicodeit.cli $@ | tee >(xclip -sel)
  fi
}

if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export DOCKER_HOST=unix://$XDG_RUNTIME_DIR/docker.sock
# cbonsai -p --leaf="&","@"

. "$HOME/.local/share/../bin/env"
