# ---------- Powerlevel10k Instant Prompt
## Should stay close to the top of ~/.zshrc.
## Initialization code that may require console input (password prompts, [y/n]
## confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# ---------- Environment Variables
## export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.nvm/versions/node/v12.16.1/bin:$PATH" # Node
export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH" # Yarn
export NVM_DIR=~/.nvm


# ---------- Powerlevel10k
source $(brew --prefix)/share/powerlevel10k/powerlevel10k.zsh-theme
## set -x

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh


# ---------- PLUGINS

source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source $(brew --prefix)/share/zsh-completions/zsh-completions.zsh

if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

    autoload -Uz compinit
    compinit
  fi

chmod go-w '/usr/local/share' 
chmod -R go-w '/usr/local/share/zsh'

# plugins=(`#git` zsh-autosuggestions vi-mode)

# fzf
[ -f ~/.fzf.zsh ] && source ~/.gzg.zsh 
source ~/.zsh/fzf-tab/fzf-tab.plugin.zsh



# ---------- SCRIPTS
# Node Loads node
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" --no-use 

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/Users/jucgonzalezes/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/Users/jucgonzalezes/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/Users/jucgonzalezes/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/Users/jucgonzalezes/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# source $(brew --prefix nvm)/nvm.sh
alias node='unalias node ; unalias npm ; nvm use default ; node $@'
alias npm='unalias node ; unalias npm ; nvm use default ; npm $@'


# ---------- ALIASES
alias apcvm='docker run -it -v `pwd`:/project mfisherman/openmpi'
alias daserver='ssh -i ~/.ssh/public_ssh gonzalez@131.175.120.104'
alias monster='ssh gonzales@10.79.23.167'
alias thesis='cd OneDrive\ -\ Politecnico\ di\ Milano/Thesis/Thesis'
alias ls='ls --color=always'


# ---------- KEYBINDINGS
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# ---------- HISTORY
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# ---------- COMPLETION STYLING
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'

# ---------- Shell integrations
eval "$(fzf --zsh)"
