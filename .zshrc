export DOTFILES="$HOME/.dotfiles"
export XDG_CONFIG_HOME="$HOME/.config"
export GPG_TTY=$TTY # https://unix.stackexchange.com/a/608921

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=208"

skip_global_compinit=1

export ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.zsh"

# 增加历史大小
# https://github.com/denolfe/dotfiles/blob/main/zsh/zshrc.zsh line 98
HISTSIZE=1000000000000000000
SAVEHIST=1000000000000000000
HISTFILE=~/.zsh_history
setopt SHARE_HISTORY      # Share history between all sessions.
# setopt HIST_IGNORE_DUPS   # Don't record an entry that was just recorded again.
# setopt HIST_FIND_NO_DUPS  # Do not display a line previously found.
# setopt HIST_REDUCE_BLANKS # Remove superfluous blanks before recording entry.
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:gl:gst:gd:gro"

# Return time on long running processes
REPORTTIME=2
TIMEFMT="%U user %S system %P cpu %*Es total"

source $DOTFILES/zsh/p10k.zsh

zinit ice depth=1; 
zinit light romkatv/powerlevel10k
zinit light zsh-users/zsh-autosuggestions
zinit light conda-incubator/conda-zsh-completion
zinit light zsh-users/zsh-completions


zinit snippet OMZ::lib/completion.zsh
zinit snippet OMZ::lib/history.zsh
zinit snippet OMZ::lib/key-bindings.zsh
zinit snippet OMZ::lib/theme-and-appearance.zsh
zinit snippet OMZ::plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet OMZ::plugins/sudo/sudo.plugin.zsh


#zinit ice lucid wait='1'
#zinit snippet OMZ::plugins/git/git.plugin.zsh

zinit light zsh-users/zsh-syntax-highlighting 
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# fpath+=${ZDOTDIR:-~}/.zsh_functions
zstyle ':completion:*' menu select
compinit


#zprof

export CUDA_HOME=/usr/local/cuda
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}


# pnpm
export PNPM_HOME="$HOME/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end


#avm
export PATH="$HOME/.avm/bin:$PATH"

#nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

#solana

export PATH="$HOME/.local/share/solana/install/active_release/bin:$PATH"

#go
export PATH="$PATH:/usr/local/go/bin"
export PATH=${PATH}:`go env GOPATH`/bin
