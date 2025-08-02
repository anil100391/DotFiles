# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
bindkey -v


# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/anils/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall


# git prompt
autoload -Uz vcs_info
precmd() { vcs_info }

# Format prompt with git branch information
setopt prompt_subst

get_moon_phase()
{
  local moons=("" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
  #local moons=("" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "" "")
  #
  # Current timestamp in seconds
  local now=$(date +%s)

  # Julian Day = Unix time in days + offset
  local jd=$(( now / 86400.0 + 2440587.5 ))

  # Days since known new moon (Jan 6, 2000 = JD 2451549.5)
  local days_since_new=$(( jd - 2451549.5 ))

  # Moon age in days (modulo synodic period)
  local age=$(( days_since_new % 29.530588853 ))

  (( age > 28 )) && age=28     # clamp to max 28
  age=$(printf "%.0f" "$age")
  echo ${moons[$((age))]}
}

autoload -U colors && colors

# Set completion styles
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*:descriptions' format '%F{yellow}--- %d ---%f'
zstyle ':completion:*:messages' format '%F{purple}--- %d ---%f'
zstyle ':completion:*:warnings' format '%F{red}--- %d ---%f'
zstyle ':completion:*:errors' format '%F{red}--- %d ---%f'
zstyle ':completion_menu:*' menu-bg-color 'blue'


PROMPT='%S%K{black}%F{yellow}%B%n%b@%F{blue}%B%m %F{cyan}%1~ %f%b%k${vcs_info_msg_0_}%s $(get_moon_phase) '
zstyle ':vcs_info:git:*' formats ' %b'

# Enable colors for common commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
