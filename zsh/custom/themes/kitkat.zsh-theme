function theme_precmd {
  local TERMWIDTH=$(( COLUMNS - ${ZLE_RPROMPT_INDENT:-1} ))

  PR_FILLBAR=""
  PR_PWDLEN=""

  local promptsize=${#${(%):---(%n@%m:%l)---()--}}
  local rubypromptsize=${#${(%)$(ruby_prompt_info)}}
  local pwdsize=${#${(%):-%~}}
  local venvpromptsize=$((${#$(virtualenv_prompt_info)}))
  local histeventsize=${#${(%):----<%h>}}

  # Truncate the path if it's too long.
  if (( promptsize + rubypromptsize + pwdsize + venvpromptsize + histeventsize > TERMWIDTH )); then
    (( PR_PWDLEN = TERMWIDTH - promptsize ))
  elif [[ "${langinfo[CODESET]}" = UTF-8 ]]; then
    PR_FILLBAR="\${(l:$(( TERMWIDTH - (promptsize + rubypromptsize + pwdsize + venvpromptsize + histeventsize) ))::${PR_HBAR}:)}"
  else
    PR_FILLBAR="${PR_SHIFT_IN}\${(l:$(( TERMWIDTH - (promptsize + rubypromptsize + pwdsize + venvpromptsize + histeventsize) ))::${altchar[q]:--}:)}${PR_SHIFT_OUT}"
  fi
}

function theme_preexec {
  setopt local_options extended_glob
  if [[ "$TERM" = "screen" ]]; then
    local CMD=${1[(wr)^(*=*|sudo|-*)]}
    echo -n "\ek$CMD\e\\"
  fi
}

autoload -U add-zsh-hook
add-zsh-hook precmd  theme_precmd
add-zsh-hook preexec theme_preexec


# Set the prompt

# Need this so the prompt will work.
setopt prompt_subst

# See if we can use colors.
autoload zsh/terminfo
for color in RED GREEN YELLOW BLUE MAGENTA CYAN WHITE GREY; do
  typeset -g PR_$color="%{$terminfo[bold]$fg[${(L)color}]%}"
  typeset -g PR_LIGHT_$color="%{$fg[${(L)color}]%}"
done
PR_NO_COLOUR="%{$terminfo[sgr0]%}"

# catpuccin machiato colors
# main colors
typeset -g CAT_BLACK="%F{#494d64}"
typeset -g CAT_WHITE="%F{#b8c0e0}"
typeset -g CAT_RED="%F{#ed8796}"
typeset -g CAT_GREEN="%F{#a6da95}"
typeset -g CAT_YELLOW="%F{#eed49f}"
typeset -g CAT_BLUE="%F{#8aadf4}"
typeset -g CAT_PINK="%F{#f5bde6}"
typeset -g CAT_TEAL="%F{#8bd5ca}"
typeset -g CAT_B_BLACK="%F{#5b6078}"
typeset -g CAT_B_WHITE="%F{#b8c0e0}"
typeset -g CAT_B_RED="%F{#ec7486}"
typeset -g CAT_B_GREEN="%F{#8ccf7f}"
typeset -g CAT_B_YELLOW="%F{#e1c682}"
typeset -g CAT_B_BLUE="%F{#78a1f6}"
typeset -g CAT_B_PINK="%F{#f2a9dd}"
typeset -g CAT_B_TEAL="%F{#63cbc0}"
# accent colors
typeset -g CAT_PEACH="%F{#f5a97f}"
typeset -g CAT_ROSEWATER="%F{#f4dbd6}"
typeset -g CAT_FLAMINGO="%F{#f0c6c6}"
typeset -g CAT_MAUVE="%F{#c6a0f6}"
typeset -g CAT_MAROON="%F{#ee99a0}"
typeset -g CAT_SKY="%F{#91d7e3}"
typeset -g CAT_SAPPHIRE="%F{#7dc4e4}"
typeset -g CAT_LAVENDER="%F{#b7bdf8}"

typeset -g CAT_ACCENT=${CAT_MAUVE}

# Modify Git prompt
ZSH_THEME_GIT_PROMPT_PREFIX=" ${CAT_B_WHITE}on ${CAT_GREEN}"
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
ZSH_THEME_GIT_PROMPT_DIRTY="${CAT_MAUVE}⋯"
ZSH_THEME_GIT_PROMPT_CLEAN="${CAT_GREEN}."

ZSH_THEME_GIT_PROMPT_ADDED="${CAT_SKY} %{%G⊕%}"
ZSH_THEME_GIT_PROMPT_MODIFIED="${CAT_BLUE} %{%G⚙%}"
ZSH_THEME_GIT_PROMPT_DELETED="${CAT_RED} %{%G✕%}"
ZSH_THEME_GIT_PROMPT_RENAMED="${CAT_PINK} %{%G⇾%}"
ZSH_THEME_GIT_PROMPT_UNMERGED="${CAT_ROSEWATER} %{%G═%}"
ZSH_THEME_GIT_PROMPT_UNTRACKED="${CAT_SAPPHIRE} %{%G⋃%} "

# Use extended characters to look nicer if supported.
if [[ "${langinfo[CODESET]}" = UTF-8 ]]; then
  PR_SET_CHARSET=""
  PR_HBAR="─"
  PR_ULCORNER="╭"
  PR_LLCORNER="╰"
  PR_LRCORNER="╯"
  PR_URCORNER="╮"
else
  typeset -g -A altchar
  set -A altchar ${(s..)terminfo[acsc]}
  # Some stuff to help us draw nice lines
  PR_SET_CHARSET="%{$terminfo[enacs]%}"
  PR_SHIFT_IN="%{$terminfo[smacs]%}"
  PR_SHIFT_OUT="%{$terminfo[rmacs]%}"
  PR_HBAR="${PR_SHIFT_IN}${altchar[q]:--}${PR_SHIFT_OUT}"
  PR_ULCORNER="${PR_SHIFT_IN}${altchar[l]:--}${PR_SHIFT_OUT}"
  PR_LLCORNER="${PR_SHIFT_IN}${altchar[m]:--}${PR_SHIFT_OUT}"
  PR_LRCORNER="${PR_SHIFT_IN}${altchar[j]:--}${PR_SHIFT_OUT}"
  PR_URCORNER="${PR_SHIFT_IN}${altchar[k]:--}${PR_SHIFT_OUT}"
fi

# Decide if we need to set titlebar text.
case $TERM in
  xterm*)
    PR_TITLEBAR=$'%{\e]0;%(!.-=*[ROOT]*=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\a%}'
    ;;
  screen)
    PR_TITLEBAR=$'%{\e_screen \005 (\005t) | %(!.-=[ROOT]=- | .)%n@%m:%~ | ${COLUMNS}x${LINES} | %y\e\\%}'
    ;;
  *)
    PR_TITLEBAR=""
    ;;
esac

# Decide whether to set a screen title
if [[ "$TERM" = "screen" ]]; then
  PR_STITLE=$'%{\ekzsh\e\\%}'
else
  PR_STITLE=""
fi

# Finally, the prompt.
PROMPT='
${PR_SET_CHARSET}${PR_STITLE}${(e)PR_TITLEBAR}\
${CAT_ACCENT}${PR_ULCORNER}${PR_HBAR}${CAT_WHITE}(\
${CAT_PEACH}%${PR_PWDLEN}<...<%~%<<\
${CAT_WHITE})$(virtualenv_prompt_info)$(ruby_prompt_info)${CAT_ACCENT}${PR_HBAR}${PR_HBAR}${(e)PR_FILLBAR}\
${CAT_WHITE}<${CAT_BLUE}%!${CAT_WHITE}>${CAT_ACCENT}${PR_HBAR}${PR_HBAR}${PR_HBAR}${PR_HBAR}${CAT_WHITE}(\
${CAT_TEAL}%(!.%SROOT%s.%n)${CAT_WHITE}@${CAT_GREEN}%m:%l\
${CAT_WHITE})${CAT_ACCENT}${PR_HBAR}${PR_URCORNER}\

${CAT_ACCENT}${PR_LLCORNER}${PR_HBAR}${CAT_WHITE}(\
${CAT_YELLOW}%D{%H:%M:%S}\
${CAT_BLUE}%{$reset_color%}$(git_prompt_info)$(git_prompt_status)${CAT_WHITE})${CAT_ACCENT}${PR_HBAR}\
${PR_HBAR}\
>${PR_NO_COLOUR} '

# display exitcode on the right when > 0
return_code="%(?..${CAT_RED}[%?] %{$reset_color%})"
RPROMPT=' $return_code${CAT_ACCENT}├${PR_HBAR}${PR_HBAR}\
(${CAT_YELLOW}%D{%a,%b%d}${CAT_ACCENT})${PR_HBAR}${PR_LRCORNER}${PR_NO_COLOUR}'

PS2='${CAT_ACCENT} ▏  ${PR_NO_COLOUR}'
PS3='${CAT_PEACH} Pick an option ${CAT_ACCENT}->${PR_NO_COLOUR} '
PS4='${CAT_B_RED}DEBUG: ${CAT_B_TEAL}%N${CAT_WHITE}:${CAT_LAVENDER}%i %1(e.${CAT_ROSEWATER}(%e%) ..)${CAT_ACCENT}>>${PR_NO_COLOUR} '
