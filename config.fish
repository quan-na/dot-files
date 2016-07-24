set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_91.jdk/Contents/Home
set -x PATH /usr/local/sbin /usr/local/bin /usr/bin /bin /usr/sbin /sbin /opt/X11/bin /usr/local/mysql/bin /Users/sstvn/.composer/vendor/bin /Users/sstvn/Library/PackageManager/bin /usr/local/texlive/2015/bin/x86_64-darwin /Volumes/DATA/clojure
#:/Users/sstvn/sms-usage-analysis"
# export MANPATH="/usr/local/man:$MANPATH"
#export DYLD_LIBRARY_PATH=/usr/local/mysql-5.5.42-osx10.8-x86_64/lib/:$PATH

# Add GHC 7.10.2 to the PATH, via https://ghcformacosx.github.io/
#export GHC_DOT_APP="/Volumes/DATA/ghc-7.10.2.app"
#if [ -d "$GHC_DOT_APP" ]; then
#  export PATH="${HOME}/.local/bin:${HOME}/.cabal/bin:${GHC_DOT_APP}/Contents/bin:${PATH}"
#fi

#source $ZSH/oh-my-zsh.sh

# Quick launch of programs
alias em="/usr/local/Cellar/emacs-mac/emacs-24.4.91-mac-5.5/bin/emacs -nw"
function e
    emacs $argv &
end
alias mysqlc="mysql -u root -proot -h 127.0.0.1 "
alias mysqls="sudo /usr/local/mysql/support-files/mysql.server "
alias kbfast="defaults write -g InitialKeyRepeat -int 10; and defaults write -g KeyRepeat -int 1 "
alias noatime="sudo mount -vuwo noatime / "
alias docker-start="sudo bash /Applications/Docker/Docker\\ Quickstart\\ Terminal.app/Contents/Resources/Scripts/start.sh"
#alias ftpload="sudo -s launchctl load -w /System/Library/LaunchDaemons/ftp.plist"
#alias ftpunload="sudo -s launchctl unload -w /System/Library/LaunchDaemons/ftp.plist"
#alias moai="~/moaidist/osx/moai"
#alias gcc="/usr/local/bin/gcc-4.9"

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
set __fish_git_prompt_char_dirtystate '⚡'
set __fish_git_prompt_char_stagedstate '→'
set __fish_git_prompt_char_untrackedfiles '☡'
set __fish_git_prompt_char_stashstate '↩'
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

set curr_char 0

# may need some function from latest fish repository
function fish_prompt
  set last_status $status

  set_color $fish_color_cwd
  printf '%s' (prompt_pwd)
  set_color normal

  printf '%s' (__fish_git_prompt)
  printf '%s' (__fish_svn_prompt)

  set_color blue
  #printf " \U1F401 " # mouse
  #printf " \U1F407 " # rabbit
  switch $curr_char
    case 0; printf " \U1F415 " # dog
    case 1; printf " \U1F416 " # pig
    case 2; printf " \U1F420 " # fish
    case 3; printf " \U1F422 " # turtle
    case 4; printf " \U1F427 " # penguin
    case 5; printf " \U1F42D " # mouse face
    case 6; printf " \U1F428 " # koala
    case 7; printf " \U1F430 " # rabbit face
    case 8; printf " \U1F436 " # dog face
    case 9; printf " \U1F43E " # paw
  end
  set curr_char (math "(($curr_char + 1) % 10)")
  set_color green
  printf "\U2318 "
  set_color normal
end

function j7
  set -x JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home
end

function and19
  set -x NDK /Volumes/DATA/android-ndk-r11c
  set -x SYSROOT $NDK/platforms/android-19/arch-arm
  set -x CC $NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64/bin/arm-linux-androideabi -v --sysroot=$SYSROOT -target armv7-none-linux-androideabi -gcc-toolchain $NDK/toolchains/arm-linux-androideabi-4.9/prebuilt/darwin-x86_64
end

# copied from oh-my-fish/plugin-fasd
# Detect fasd
if type -q fasd
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
  function e; emacs -nw (f $argv); end
  function o; open (f $argv); end
  function v; vim (f $argv); end
else
  echo " *** Please install 'fasd' first!"
end
