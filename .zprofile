export TERMINAL=st
export EDITOR=vim
export CONFIG_DIR=$HOME/code/linux_config
export JAVA_HOME=/opt/jdk-11.0.1
export PATH=~/bin:$JAVA_HOME/bin:$PATH

#Start X on login on tty1 only
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	exec startx
fi
