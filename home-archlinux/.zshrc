# Created by Zap installer
eval "$(starship init zsh)"

[ -f "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh" ] && source "${XDG_DATA_HOME:-$HOME/.local/share}/zap/zap.zsh"

# Load and initialise completion system
#autoload -Uz compinit
#compinit
autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
    compinit -d ~/.zcompdump
done
compinit -C -d ~/.zcompdump

plug "zsh-users/zsh-autosuggestions"
plug "zap-zsh/supercharge"
#plug "zap-zsh/zap-prompt"
plug "zsh-users/zsh-syntax-highlighting"
plug "zsh-users/zsh-history-substring-search"
plug "zap-zsh/fzf"
plug "MichaelAquilina/zsh-you-should-use"
plug "Aloxaf/fzf-tab"
plug "zap-zsh/sudo"
plug "zap-zsh/completions"
plug "chivalryq/git-alias"
plug "hlissner/zsh-autopair"
#plug "MAHcodes/distro-prompt"

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=green,bold'
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_NOT_FOUND='fg=red,bold'
HISTORY_SUBSTRING_SEARCH_FUZZY=1
HISTORY_SUBSTRING_SEARCH_ENSURE_UNIQUE=1
HISTORY_SUBSTRING_SEARCH_PREFIXED=1

alias mirrors="sudo reflector -c ID,SG -l 7 -f 7 -p https --sort rate --save /etc/pacman.d/mirrorlist"
alias init="sudo mkinitcpio -P linux-lts"
alias grub-update="sudo grub-mkconfig -o /boot/grub/grub.cfg"
alias clean="yay -Scc && sudo pacman -Scc"
alias autoremove="sudo pacman -Qdtq | sudo pacman -Rs"
alias update="yay -Syu"

#music&video
alias music="foot -e cmus"
alias youtube="ytfzf -f -t -T sixel search_pattern"
alias download="ytfzf -d -f"
alias ytmusic="ytfzf --audio-only search_pattern"
alias downloadmp3="yt-dlp --extract-audio --audio-format mp3 --audio-quality 0"
#other
alias tree='eza -a --tree --color always --icons --group-directories-first'
alias treell='eza -a -l -b --tree --color always --icons --group-directories-first'
alias ls='eza -a --color always --icons --group-directories-first'
alias ll='eza -a -l -b --color always --icons --group-directories-first'
alias cat="bat"
alias mem="echo tami | sudo -S ps_mem"
alias hdd="echo tami | sudo -S hdsentinel"
alias recordaudio="wf-recorder --audio=alsa_output.pci-0000_00_1b.0.analog-stereo.monitor --file=wf-recorder-audio.mp4"
alias recordvideo="wf-recorder --file=wf-recorder-no-audio.mp4"
