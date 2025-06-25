# .bashrc

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

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
alias wpi24="~/wpilib/2024/vscode/VSCode-linux-x64/bin/code"
alias wpi25b="~/wpilib/2025/vscode/VSCode-linux-x64/bin/code"
alias wpi25="~/wpilib/2025/vscode/VSCode-linux-x64/bin/code"
alias c="code ."
alias frcfmt="./gradlew spotlessApply"
alias frcbuild="./gradlew build -Dorg.gradle.java.home=\"/home/lseiden/wpilib/2025/jdk\""
alias exit="quit"
alias choreo="WEBKIT_DISABLE_DMABUF_RENDERER=1 pnpm tauri dev"
alias poke="/home/lseiden/Documents/personal/emerald-emulator/mGBA-0.10.4-appimage-x64.appimage"
alias reefSim=""
alias restartKDE="kquitapp5 plasmashell
kstart5 plasmashell"
echo 'export TERM=xterm-256color' >> $HOME/.bash_profile
alias gcam="git cam"
alias crun="cargo run"

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
# Install Ruby Gems to ~/gems
export GEM_HOME="$HOME/gems"
export PATH="$HOME/gems/bin:$PATH"
. "$HOME/.cargo/env"

# pnpm
export PNPM_HOME="/home/lseiden/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

if [[ ! "$TERM_PROGRAM" == tmux && ! "$TERM_PROGRAM" == "vscode" ]]; then
	echo "starting tmux"	
	tmux new -A -s "default"
fi

cbonsai -p --leaf="&","@"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
