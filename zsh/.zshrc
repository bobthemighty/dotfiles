# If you come from bash you might have to change your $PATH.
export ZSH_CACHE_DIR="$HOME/.local/zsh/cache"
export GOPATH=$HOME/go
export PATH=/home/bob/.gem/ruby/2.5.0/bin:$GOPATH/bin:$HOME/.gem/ruby/2.4.0/bin/:$HOME/bin:/usr/local/bin:$PATH

fpath=( "$HOME/.local/zsh/site_functions" "$HOME/.local/zsh/plugins/zsh-completions/src" $fpath )
setopt auto_cd
source "$HOME/.local/zsh/site_functions/last-working-dir.zsh"
source "$HOME/.local/zsh/site_functions/z.sh"

## History file configuration
[ -z "$HISTFILE" ] && HISTFILE="$HOME/.zsh_history"
HISTSIZE=50000
SAVEHIST=10000

## History command configuration
setopt extended_history       # record timestamp of command in HISTFILE
setopt hist_expire_dups_first # delete duplicates first when HISTFILE size exceeds HISTSIZE
setopt hist_ignore_dups       # ignore duplicated commands history list
setopt hist_ignore_space      # ignore commands that start with space
setopt hist_verify            # show command with history expansion to user before running it
setopt inc_append_history     # add commands to HISTFILE in order of execution
setopt share_history # share command history data

source ~/.local/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
autoload -U promptinit; promptinit
prompt pure

# Preferred editor for local and remote sessions
 if [[ -n $SSH_CONNECTION ]]; then
   export EDITOR='vim'
 else
   export EDITOR='nvim'
 fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/rsa_id"

bindkey -v
bindkey '^R' history-incremental-search-backward
#source <(awless completion zsh)
source /usr/share/fzf/completion.zsh


d=.dircolors
test -r $d && eval "$(dircolors -b $d)"
alias ls='ls --color=auto'
alias cat='bat'

# FZFFS
export FZF_DEFAULT_COMMAND='rg --files --no-ignore --hidden --follow -g "!{.git,node_modules}/*" 2> /dev/null'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
eval "$(direnv hook zsh)"
# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored _approximate
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'r:|[._-]=** r:|=**'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/bob/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

ssh() {
        /usr/bin/ssh -t $@ "TERM=xterm-256color tmux new || zsh || bash";
}

export WORKON_HOME=$HOME/.virtualenvs
export PROJECT_HOME=$HOME/Devel
source /usr/bin/virtualenvwrapper.sh
alias nvimdiff='nvim -d'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
