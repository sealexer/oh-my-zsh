# sealexer.zsh-theme (based on af-magic.zsh-theme)
#
# Author: Alexander Shusherov
# URL: https://github.com/sealexer
# Repo: https://github.com/sealexer/oh-my-zsh
# Direct Link: https://github.com/sealexer/oh-my-zsh/blob/master/themes/sealexer.zsh-theme
#
# Created on:		June 19, 2012
# Last modified on:	June 20, 2012



if [ $UID -eq 0 ]; then NCOLOR="red"; else NCOLOR="green"; fi
local return_code="%(?..%{$fg[red]%}%? ↵%{$reset_color%})"


# primary prompt
#PROMPT='$FG[237]------------------------------------------------------------%{$reset_color%}
#$FG[032]%~ \
#$FG[105]$(prompt_welcome_char)%{$reset_color%} '

PROMPT='$(prompt_nonzero_exit_code)$FG[032]%~ \
$FG[105]$(prompt_welcome_char)%{$reset_color%} '

PROMPT2='%{$fg[red]%}\ %{$reset_color%}'
RPS1='${return_code}'

# right prompt
RPROMPT='$(right_prompt)'

# color vars
eval my_gray='$FG[237]'
eval my_orange='$FG[214]'
eval my_red='$fg_bold[red]'

function prompt_nonzero_exit_code() {
  if [[ $? > 0 ]]; then
    echo "$my_red(non-zero exit code: %?%)%{$reset_color%}\n\r"
  fi
}

function prompt_welcome_char() {
  # Add red '#' if we are root
  char="%(!.$my_red#%{$reset_color%} .)"
  if [ $(in_hg) ]; then
    # Orange mercurial sign
    char="$char${my_orange}\u263f%{$reset_color%}"
  else
    char="$char»"
  fi
  echo $char
}

function right_prompt() {
  if [ $(in_hg) ]; then
    # Orange name of the branch
    echo "$my_orange$(hg_prompt_info)%{$reset_color%}%"
  else
    # Date
    echo "%*"
  fi
}

# git settings
#ZSH_THEME_GIT_PROMPT_PREFIX="$FG[075](branch:"
#ZSH_THEME_GIT_PROMPT_CLEAN=""
#ZSH_THEME_GIT_PROMPT_DIRTY="$my_orange*%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="$FG[075])%{$reset_color%}"
