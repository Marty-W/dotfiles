# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Plugin manager init
source $(brew --prefix)/opt/antidote/share/antidote/antidote.zsh
antidote load

eval "$(zoxide init zsh)"
eval "$(fnm env --use-on-cd)"
source $(brew --prefix)/opt/zsh-vi-mode/share/zsh-vi-mode/zsh-vi-mode.plugin.zsh
ZVM_VI_SURROUND_BINDKEY=s-prefix
ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

#OPTIONS
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=5000
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt incappendhistory

ZSH_DOT=~/.zshrc
YABAI_DOT=~/.yabairc
SKHD_DOT=~/.skhdrc
NVIM_DIR=~/.config/nvim
WEZTERM_DOT=~/.config/wezterm/wezterm.lua
SKETCHY_DOT=~/.config/sketchybar/sketchybarrc

NOTES_DIR=~/Documents/notes/logseq_os/

#ALIASES

alias szsh="source $ZSH_DOT"
alias nzsh="nvim $ZSH_DOT"
alias sbai="source $YABAI_DOT"
alias nbai="nvim $YABAI_DOT"
alias rbai="brew services restart yabai"
alias nskhd="nvim $SKHD_DOT"
alias rskhd="brew services restart skhd"
alias lg="lazygit"
alias n="nvim"
alias nd="nvim ."
alias pn="pnpm"
alias ..="cd .."
alias nnvim="cd $NVIM_DIR && nd"
alias b="exa -1 -l -a --colour-scale --icons --group-directories-first --git -h -m --no-permissions --no-user"
alias nwez="nvim $WEZTERM_DOT"
alias nsketchy="nvim $SKETCHY_DOT"
alias rsketchy="brew services restart sketchybar"
alias nlf="nvim ~/.config/lf/lfrc"
alias ntmux="nvim ~/.config/tmux/tmux.conf"
alias nzshplug="nvim ~/.zsh_plugins.txt"
alias nkitty="nvim ~/.config/kitty/kitty.conf"
alias upwez="brew upgrade --cask wezterm-nightly --no-quarantine --greedy-latest"


#PROJECTS
alias nos="cd $NOTES_DIR && nd"
alias nh="cd ~/code/habitist/ && nd"


mkcd() {
mkdir -p "$@" && cd "$@"
}

#LF
LFCD="/Users/martin/.config/lf/lfcd.sh"
    if [ -f "$LFCD" ]; then
        source "$LFCD"
    fi
export HIGHLIGHT_STYLE=github

export PATH="$PATH:$HOME/.local/bin"
export EDITOR="nvim"
export LANG=en_US.UTF-8
export PRETTIERD_LOCAL_PRETTIER_ONLY=true
export FZF_DEFAULT_COMMAND="fd --hidden"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# pnpm
export PNPM_HOME="/Users/martin/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
alias config='/usr/bin/git --git-dir=/Users/martin/.cfg/ --work-tree=/Users/martin'

# fnm
export PATH="/Users/martin/Library/Application Support/fnm:$PATH"
eval "`fnm env`"

#openai 
export OPENAI_API_KEY=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

bindkey '^I' end-of-line
