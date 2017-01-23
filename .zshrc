#!/usr/bin/zsh
umask 022
/usr/bin/kdestroy -A -q
set -o noclobber
set -o vi
ulimit -s unlimited
compctl -g '*(/)' cd
autoload -Uz compinit
autoload -Uz promptinit
compinit
promptinit
prompt fire
setopt correctall
setopt hist_ignore_all_dups
setopt autocd
setopt autopushd
setopt extended_glob
setopt histignorealldups sharehistory
bindkey -e
if [[ -x /usr/lib/command-not-found ]] ; then
        function command_not_found_handler() {
                /usr/lib/command-not-found --no-failure-msg -- $1
        }
fi

export READNULLCMD=less
export HISTSIZE=20000
export HISTFILE="$HOME/.history"
export SAVEHIST=$HISTSIZE
export COLORTERM="yes"
stty erase "^?"
mesg y
export GREP_COLOR='00;38;5;226'
export GREP_OPTIONS='--color=auto'
alias cd..='cd ..'
alias lhidf='ls -d .* | grep -v "\/"'
alias lhidd='ls -d .*/'
alias k9='kill -9'
alias ls-r="ls --author --color --show-control-chars -i -F -l -a -h"
alias cpucheck='ps -e u | sort -g -k 3 | tail'
alias memcheck='ps -e u | sort -g -k 4 | tail'
alias mstat='ps -e u | grep R'
alias rm='rm -rf'
alias rmtilda='rm -rf *~'
alias delzero='rm `find . -type f -size 0k`'
alias cltex='rm -rf *.log *.dvi *.aux *.toc *.bbl *.out *.blg *.nav *.snm *.vrb'
alias unset_omp="export OMP_DYNAMIC='' ; export OMP_NESTED='' ; export OMP_SCHEDULE='' ; export OMP_NUM_THREADS='' ;"
alias set_omp="export OMP_DYNAMIC=true; export OMP_NESTED=true; export OMP_SCHEDULE='DYNAMIC'; export OMP_NUM_THREADS=`
_AA=$(lscpu  | grep 'Thread(s) per core' |  cut -d ":" -f 2 | tr -d ' ');
_BB=$(lscpu  | grep 'Core(s) per socket' |  cut -d ":" -f 2 | tr -d ' ');
_CC=$(lscpu  | grep -i 'socket(s)' |  cut -d ":" -f 2 | tr -d ' ');
echo $(($_AA * $_BB * $_CC ))`"

export MY="/temp/$USER"
export MYOPT="$MY/opt"
export MYLIB="$MY/lib"
export MYBIN="$MY/bin"
export LD_LIBRARY_PATH="$MYLIB:$LD_LIBRARY_PATH"
export LIBRARY_PATH="$MYLIB:$LIBRARY_PATH"
export PATH="$MYBIN:$PATH"
export TERM="xterm"
export EDITOR="vim"
export VISUAL="gedit"
export BROWSER="firefox"
export SHELL="zsh"
export PAGER="less"
export HOME="/home/$USER"

alias tmp="cd $MY"
alias python="python3"

#turbomole
export TURBODIR=/psi/turbomole-6.2/TURBOMOLE
source ${TURBODIR}/Config_turbo_env
export PATH=/psi/turbomole-6.2/calculate_2.2:/psi/turbomole-6.2/MoleControl_2.1:/psi/turbomole-6.2/TmoleX301_64/symlinks:$PATH

#dftb+
PP="dft/dftb+_1.2"
PAI=$(echo $PATH | grep /psi/$PP | wc -c)
if [[ $PAI == 0 ]]; then
#        export PATH=/psi/$PP:$PATH
fi

#gdftp
PP="dft/gdftb"
PAI=$(echo $PATH | grep /psi/$PP/bin | wc -c)
if [[ $PAI == 0 ]]; then
        export PATH=/psi/$PP/bin:$PATH
fi

#openbabel
PP="dft/openbabel-2.3.1"
PAI=$(echo $PATH | grep /psi/$PP/bin | wc -c)
if [[ $PAI == 0 ]]; then
        export PATH=/psi/$PP/bin:$PATH
fi
if [[ -z "${LD_LIBRARY_PATH}" ]] ; then 
        export LD_LIBRARY_PATH="/psi/${pp}/openbabel-2.3.1/lib:${LD_LIBRARY_PATH}"
else 
	export LD_LIBRARY_PATH="/psi/${pp}/openbabel-2.3.1/lib"
fi

#dptools+ase
PP="dft/dptools-0.1"
ASE="/temp/$USER/ase"
PAI=$(echo $PATH | grep /psi/$PP/bin | wc -c)
if [[ $PAI == 0 ]]; then
        export PATH=/psi/$PP/bin:$ASE/bin:$PATH
fi
if [[ -z "${PYTHONPATH}" ]] ; then
    export PYTHONPATH="/psi/dft/dptools-0.1/lib/python2.6/site-packages:$ASE/lib/python2.7/site-packages:$PYTHONPATH"
else
    export PYTHONPATH="/psi/dft/dptools-0.1/lib/python2.6/site-packages:$ASE/lib/python2.7/site-packages"
fi

#nwchem
PP="dft/nwchem-6.0"
PAI=$(echo $PATH | grep /psi/$PP/bin | wc -c)
if [[ $PAI == 0 ]]; then
        export PATH=/psi/$PP/bin:$PATH
fi

if [[ ! -e "$HOME/.nwchemrc" ]] ;  then
        ln -s /psi/dft/nwchem-6.0/data/default.nwchemrc $HOME/.nwchemrc
fi

unset PP PAI

zstyle ':completion:*:descriptions' format '%U%B%d%b%u'
zstyle ':completion:*:warnings' format '%BSorry, no matches for: %d%b'
zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
eval "$(dircolors -b)"
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' menu select=long
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'
