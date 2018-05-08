
function fish_greeting
    echo '                 '(set_color F00)'___
  ___======____='(set_color FF7F00)'-'(set_color FF0)'-'(set_color FF7F00)'-='(set_color F00)')
/T            \_'(set_color FF0)'--='(set_color FF7F00)'=='(set_color F00)')
[ \ '(set_color FF7F00)'('(set_color FF0)'0'(set_color FF7F00)')   '(set_color F00)'\~    \_'(set_color FF0)'-='(set_color FF7F00)'='(set_color F00)')
 \      / )J'(set_color FF7F00)'~~    \\'(set_color FF0)'-='(set_color F00)')
  \\\\___/  )JJ'(set_color FF7F00)'~'(set_color FF0)'~~   '(set_color F00)'\)
   \_____/JJJ'(set_color FF7F00)'~~'(set_color FF0)'~~    '(set_color F00)'\\
   '(set_color FF7F00)'/ '(set_color FF0)'\  '(set_color FF0)', \\'(set_color F00)'J'(set_color FF7F00)'~~~'(set_color FF0)'~~     '(set_color FF7F00)'\\
  (-'(set_color FF0)'\)'(set_color F00)'\='(set_color FF7F00)'|'(set_color FF0)'\\\\\\'(set_color FF7F00)'~~'(set_color FF0)'~~       '(set_color FF7F00)'L_'(set_color FF0)'_
  '(set_color FF7F00)'('(set_color F00)'\\'(set_color FF7F00)'\\)  ('(set_color FF0)'\\'(set_color FF7F00)'\\\)'(set_color F00)'_           '(set_color FF0)'\=='(set_color FF7F00)'__
   '(set_color F00)'\V    '(set_color FF7F00)'\\\\'(set_color F00)'\) =='(set_color FF7F00)'=_____   '(set_color FF0)'\\\\\\\\'(set_color FF7F00)'\\\\
          '(set_color F00)'\V)     \_) '(set_color FF7F00)'\\\\'(set_color FF0)'\\\\JJ\\'(set_color FF7F00)'J\)
                      '(set_color F00)'/'(set_color FF7F00)'J'(set_color FF0)'\\'(set_color FF7F00)'J'(set_color F00)'T\\'(set_color FF7F00)'JJJ'(set_color F00)'J)
                      (J'(set_color FF7F00)'JJ'(set_color F00)'| \UUU)
                       (UU)'(set_color normal)
end

# git prompt
set normal (set_color normal)
set magenta (set_color magenta)
set yellow (set_color yellow)
set green (set_color green)
set red (set_color red)
set gray (set_color -o black)

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate '(×)'
set __fish_git_prompt_char_stagedstate '(→)'
set __fish_git_prompt_char_untrackedfiles '(*)'
set __fish_git_prompt_char_stashstate '(↩)'
set __fish_git_prompt_char_upstream_ahead '[↑]'
set __fish_git_prompt_char_upstream_behind '[↓]'
set __fish_git_prompt_char_upstream_equal '[√]'
set __fish_git_prompt_char_upstream_diverged '[?]'

set curr_char 0

# may need some function from latest fish repository
if set -q curr_char; true; else; set curr_char 0; end
function fish_prompt
  set last_status $status

  set_color 4169E1
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s' (__fish_git_prompt)
  #printf '%s' (__fish_svn_prompt)

  set_color yellow
  switch $curr_char
      case 0; printf " ٩ʕ•͡×•ʔ۶ "
      case 1; printf " ʕっ•ᴥ•ʔっ "
      case 2; printf " ᕦʕ ⊙ ◡ ⊙ ʔᕤ "
      case 3; printf " ʕ´• ᴥ •`ʔ "
      case 4; printf " ʕ•̫͡•ʕ•̫͡•ʔ•̫͡•ʔ "
      case 5; printf " ˁ˙˟˙ˀ "
      case 6; printf " (∪￣ ㋓ ￣∪) "
      case 7; printf " ヾ(;￫㉨￩)ﾉ "
      case 8; printf " ⊂(ο･㉨･ο）⊃ "
      case 9; printf " ( ◍•㉦•◍ ) "
      case 10; printf " (^・ω・^ ) "
      case 11; printf " ヽ(^‥^=ゞ) "
      case 12; printf " (^._.^)ﾉ "
      case 13; printf " ฅ^•ﻌ•^ฅ "
      case 14; printf " (´pゝω･) "
      case 15; printf " (＾*･.･*＾) "
      case 16; printf " [^._.^]ﾉ彡 "
      case 17; printf " ₍˄·͈༝·͈˄₎◞ ̑̑ෆ "
      case 18; printf " ₍˄·͈༝·͈˄*₎◞ ̑̑ "
      case 19; printf " |˄·͈༝·͈˄₎.｡oO "
  end
  set curr_char (math "(($curr_char + 1) % 20)")
  if test $last_status -eq 0
      set_color cyan
      printf "⚛ "
  else
      set_color red
      printf "$last_status⚡ "
  end
  set_color normal
end

# copied from oh-my-fish/plugin-fasd
# Detect fasd
if type -q fasd
  alias f="fasd -f"
  alias a="fasd -a"
  alias s="fasd -s"
  alias d="fasd -d"
  # Hook into fish preexec event
  function __fasd_run -e fish_preexec
    #command fasd -A (command fasd --sanitize $argv) > "/dev/null" 2>&1 &
    set arglist (echo $argv | tr ' ' '\n')
    for item in $arglist
      #echo $item
      command fasd -A "$item" > "/dev/null" 2>&1 &
    end
  end
  function j; cd (d $argv); end
else
  echo " *** Please install 'fasd' first!"
end

alias g.se="git submodule foreach "
alias xx="sleep 1; exit"

# split panes using | and -
alias t.wsh="tmux split-window -h"
alias t.wsv="tmux split-window -v"
# reload config file (change file location to your the tmux.conf you want to use)
alias t.r="tmux source-file ~/.tmux.conf"
# switch panes using Alt-arrow without prefix
alias t.wl="tmux select-pane -L"
alias t.wr="tmux select-pane -R"
alias t.wu="tmux select-pane -U"
alias t.wd="tmux select-pane -D"
# clear buffer
alias t.c="clear; tmux clear-history; fish_greeting"
