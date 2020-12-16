#
# ~/.bashrc
#
# If not running interactively, don't do anything
[[ $- != *i* ]] && return

#Default editor
export VISUAL=vim
export EDITOR="$VISUAL"

#Welcome message
welcome() { 
    #------------------------------------------ 
    #------WELCOME MESSAGE--------------------- 
    # customize this first message with a message of your choice. 
    # this will display the username, date, time, a calendar, the amount of users, and the up time. 
    #clear 
    # Gotta love ASCII art with figlet 
    figlet -f cybermedium "Welcome, " $USER; 
    #toilet "Welcome, " $USER; 
    echo -e ""; cal ; 
    echo -ne "Today is "; date #date +"Today is %A %D, and it is now %R" 
    echo -e "" 
    echo -ne "Up time:";uptime | awk /'up/' 
    free used 
    iostat
    netstat -i 
    echo ""; 
} 
welcome; 

#nnn config
#export EDITOR="vim"
#export NNN_USE_EDITOR=1

#Pywal exec on every terminal
#wal -i Wallpaper17.png -q
cat /home/xenophile/.cache/wal/sequences

# Make colorcoding available for everyone

Black='\[\e[0;30m\]'	# Black
Red='\[\e[0;31m\]'		# Red
Green='\[\e[0;32m\]'	# Green
Yellow='\[\e[0;33m\]'	# Yellow
Blue='\[\e[0;34m\]'		# Blue
Purple='\[\e[0;35m\]'	# Purple
Cyan='\[\e[0;36m\]'		# Cyan
White='\[\e[0;37m\]'	# White

# Bold
BBlack='\[\e[1;30m\]'	# Black
BRed='\[\e[1;31m\]'		# Red
BGreen='\[\e[1;32m\]'	# Green
BYellow='\[\e[1;33m\]'	# Yellow
BBlue='\[\e[1;34m\]'	# Blue
BPurple='\[\e[1;35m\]'	# Purple
BCyan='\[\e[1;36m\]'	# Cyan
BWhite='\[\e[1;37m\]'	# White

# Background
On_Black='\[\e[40m\]'	# Black
On_Red='\[\e[41m\]'		# Red
On_Green='\[\e[42m\]'	# Green
On_Yellow='\[\e[43m\]'	# Yellow
On_Blue='\[\e[44m\]'	# Blue
On_Purple='\[\e[45m\]'	# Purple
On_Cyan='\[\e[46m\]'	# Cyan
On_White='\[\e[47m\]'	# White

NC='\[\e[m\]'			# Color Reset

ALERT="${BWhite}${On_Red}" # Bold White on red background

# Useful aliases
alias c='clear'
alias ..='cd ..'
alias ls='ls -lah --color=auto'
alias ll='s -lisa --color=auto'
alias mkdir='mkdir -pv'
alias free='free -mt'
alias ps='ps auxf'
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'
alias wget='wget -c'
alias histg='history | grep'
alias myip='curl ipv4.icanhazip.com'
alias grep='grep --color=auto'
alias q='exit'
alias k='pkill'
alias home='cd ~'
alias root='cd /'
alias reboot="sudo shutdown -r now"
alias off="sudo shutdown -h now"
alias reload='source ~/.bashrc' #reloads .bashrc
alias nnn='nnn -e'


# Auto completion
complete -cf sudo
complete -cf which
bind 'TAB:menu-complete'


#Directory path bash prompt
# Colour codes are cumbersome, so let's name them
txtcyn='\[\e[0;96m\]' # Cyan
txtpur='\[\e[0;35m\]' # Purple
txtwht='\[\e[0;37m\]' # White
txtrst='\[\e[0m\]'    # Text Reset

# Which (C)olour for what part of the prompt?
pathC="${txtcyn}"
gitC="${txtpur}"
pointerC="${txtwht}"
normalC="${txtrst}"

# Get the name of our branch and put parenthesis around it
gitBranch() {
				    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
		}

# Build the prompt
export PS1="${pathC}\w ${gitC}\$(gitBranch) ${pointerC}\$${normalC} "



# Set PATH so it includes user's private bin directories
PATH="${HOME}/bin:${HOME}/.local/bin:${PATH}"






# Set prompt
PS1="${Yellow}\u@\h${NC}: ${Blue}\w${NC} \\$ "


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
#exec fish
