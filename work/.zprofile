export CONFIG_DIR=$HOME/code/linux_config
export JAVA_HOME=/opt/jdk1.8.0_191
export MVN_HOME=/opt/apache-maven-3.6.0
export CMAKE_HOME=/opt/cmake-3.9.3-Linux-x86_64
export PATH=~/bin:$JAVA_HOME/bin:$MVN_HOME/bin:$CMAKE_HOME/bin:/usr/lib/ccache:$PATH

#Start X on login on tty1 only
if [ -z "$DISPLAY" ] && [ "$(fgconsole)" -eq 1 ]; then
	exec startx
fi
