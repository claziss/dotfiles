# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
module use ~/modulefiles

#######################################
# user specific environment
#######################################

# for mc, cvs, svn, ...
export EDITOR=emacs

#######################################
# change app defaults
# Note one can disable an alias for a
# command by running like \command
#######################################

# highlight $HOST:$PWD prompt
#PS1='\[\e[1m\]\h:\w\$\[\e[0m\] '
PS1="\[\e[1m]\]\h:\W\$?>\[$(tput sgr0)\]\[\e[0m\]"

# Don't store duplicate adjacent items in the history
HISTCONTROL=ignoreboth

# E.G: seq 1000 | sed 's/.*/s(&)/' | bc -l | plot linecolor 2
plot() { { echo 'plot "-"' "$@"; cat; } | gnuplot -persist; }

# GREP_COLOR=bright yellow on black bg.
# use GREP_COLOR=7 to highlight whitespace on black terminals
# LANG=C for speed. See also: http://www.pixelbeat.org/scripts/findrepo
alias grep='GREP_COLOR="1;33;40" LANG=C grep --color=auto'

alias ls="BLOCK_SIZE=\'1 ls --color=auto" #enable thousands grouping and colour
alias minicom='minicom -c on' #enable colour
alias cal='cal -3' #show 3 months by default
alias units='units -t' #terse mode
alias diff='LC_ALL=C TZ=GMT0 diff -Naur' #normalise diffs for distribution
alias lynx='lynx -force_html -width=$COLUMNS' #best settings for viewing HTML
alias links='links -force-html' #need to enable colour in config menu manually
alias xterm='xterm -fb "" -bg black -fg gray -fa "Sans Mono" -fs 12 +sb -sl 3000 -g 80x50+1+1'
#alias sudo='sudo env PATH=$PATH' #work around sudo built --with-secure-path (ubuntu)
alias gdb='gdb -tui -quiet' #enable the text window interface if possible
alias head='head -n $((${LINES:-12}-2))' #as many as possible without scrolling
alias tail='tail -n $((${LINES:-12}-2)) -s.1' #Likewise, also more responsive -f
alias mplayer='mplayer -msglevel all=-1:statusline=5:cplayer=5' #less verbose

# Tell less to display colours, and use smartcase searching
# Also don't wrap lines, as less supports horizontal scolling
# Note setting Q to use the visible bell, may cause delays.
export LESS="-RSi"
# Adjust the less highlight colors
export LESS_TERMCAP_so="$(printf 'rev\nbold\nsetaf 3\n' | tput -S)"
export LESS_TERMCAP_se="$(tput sgr0)"

# canonicalize path (including resolving symlinks)
realpath . >/dev/null 2>&1 || alias realpath='readlink -f'

# make and change to a directory
md () { mkdir -p "$1" && cd "$1"; }

#######################################
# Developer stuff
#######################################

# Enable gcc colours, available since gcc 4.9.0
export GCC_COLORS=1

function _update_ps1() {
    PS1="$(powerline-shell $?)"
}

if [ "$TERM" != "linux" ]; then
    PROMPT_COMMAND="_update_ps1; $PROMPT_COMMAND"
fi

#if [ -f `which powerline-daemon` ]; then
#  powerline-daemon -q
#  POWERLINE_BASH_CONTINUATION=1
#  POWERLINE_BASH_SELECT=1
#  . /usr/share/powerline/bash/powerline.sh
#fi

PATH="/home/claziss/perl5/bin${PATH:+:${PATH}}"; export PATH;
PERL5LIB="/home/claziss/perl5/lib/perl5${PERL5LIB:+:${PERL5LIB}}"; export PERL5LIB;
PERL_LOCAL_LIB_ROOT="/home/claziss/perl5${PERL_LOCAL_LIB_ROOT:+:${PERL_LOCAL_LIB_ROOT}}"; export PERL_LOCAL_LIB_ROOT;
PERL_MB_OPT="--install_base \"/home/claziss/perl5\""; export PERL_MB_OPT;
PERL_MM_OPT="INSTALL_BASE=/home/claziss/perl5"; export PERL_MM_OPT;

HOSTLINK_PATH="/home/claziss/projects/Synopsys/arc-marketplace/hostlink/prebuild/lib/"; export HOSTLINK_PATH

# needed for gcc docs.
CVS_RSH=ssh
