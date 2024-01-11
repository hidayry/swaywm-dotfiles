#--
#--
#export BAT_THEME="Dracula"
#--
#. "$HOME/.cargo/env"
export FZF_BASE="/usr/bin/fzf"
export EDITOR='nvim'
export BROWSER='google-chrome-stable'
export ZSH="$HOME/.oh-my-zsh"

if [ -d "$HOME/.local/bin" ] ;
then PATH="$HOME/.local/bin:$PATH"
fi

#load compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit -d ~/.zcompdump
done
compinit -C -d ~/.zcompdump

autoload -Uz add-zsh-hook
autoload -Uz vcs_info
precmd () { vcs_info }
_comp_options+=(globdots)

zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS} 'ma=48;5;197;1'
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*:warnings' format "%B%F{red}No matches for:%f %F{magenta}%d%b"
zstyle ':completion:*:descriptions' format '%F{yellow}[-- %d --]%f'
zstyle ':vcs_info:*' formats ' %B%s-[%F{magenta}%f %F{yellow}%b%f]-'

#waiting dots
expand-or-complete-with-dots() {
    echo -n "\e[31m…\e[0m"
    zle expand-or-complete
    zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

#zsh option
setopt PROMPT_SUBST        # enable command substitution in prompt
setopt MENU_COMPLETE       # Automatically highlight first element of completion menu
setopt LIST_PACKED		   # The completion menu takes less space.
setopt AUTO_LIST           # Automatically list choices on ambiguous completion.
setopt HIST_IGNORE_DUPS	   # Do not write events to history that are duplicates of previous events
setopt HIST_FIND_NO_DUPS   # When searching history don't display results already cycled through twice
setopt COMPLETE_IN_WORD    # Complete from both ends of a word.
stty start undef
stty stop undef
setopt noflowcontrol

#plugin
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
#source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh
#bindkey '^A' history-substring-search-up
#bindkey '^B' history-substring-search-down

plugins=(git fzf cp aliases adb sudo colored-man-pages dirhistory debian zsh-interactive-cd web-search wd systemd starship)

source $ZSH/oh-my-zsh.sh

##alias
#apt
alias list="sudo nala list --installed"
alias clean="sudo apt autoclean"
alias remove="sudo nala autoremove && sudo nala autopurge"
alias update="sudo nala update && sudo nala upgrade"
#music&video
alias music="ncmpcpp"
alias youtube="ytfzf -f -t search_pattern"
alias download="ytfzf -d -f"
alias ytmusic="ytfzf --audio-only search_pattern"
alias downloadmp3="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0"
#other
alias tree='exa -a --tree --color always --icons --group-directories-first'
alias treell='exa -a -l -b --tree --color always --icons --group-directories-first'
alias ls='exa -a --color always --icons --group-directories-first'
alias ll='exa -a -l -b --color always --icons --group-directories-first'
alias cat="batcat"
alias hdd="echo tami | sudo -S $HOME/.scripts/HDSentinel"
alias mem="echo tami | sudo -S ps_mem"
