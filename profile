# /etc/profile: system-wide .profile file for the Bourne shell (sh(1))
# and Bourne compatible shells (bash(1), ksh(1), ash(1), ...).

if [ "$PS1" ]; then
  if [ "$BASH" ] && [ "$BASH" != "/bin/sh" ]; then
    # The file bash.bashrc already sets the default PS1.
    # PS1='\h:\w\$ '
    if [ -f /etc/bash.bashrc ]; then
      . /etc/bash.bashrc
    fi
  else
    if [ "`id -u`" -eq 0 ]; then
      PS1='# '
    else
      PS1='$ '
    fi
  fi
fi

if [ -d /etc/profile.d ]; then
  for i in /etc/profile.d/*.sh; do
    if [ -r $i ]; then
      . $i
    fi
  done
  unset i
fi
# set java environment JAVA运行环境
export JAVA_HOME=/usr/lib/jvm/jdk-9.0.1 
export JRE_HOME=/usr/lib/jvm/jdk-9.0.1/jre
export PATH=$JAVA_HOME/bin:$JRE_HOME/bin:$PATH

#set tomcat 环境变量
export CATALINA_HOME=/usr/local/tomcat

#set gradle Path
#export GRADLE_HOME=/usr/local/gradle-4.1
#export PATH=$GRADLE_HOME/bin:$PATH 

#set android platform-tools 并没有起效果
export PATH=$/home/chenggong/sdk/platform-tools:$PATH

#set node (and nodejs) path
export NODE_HOME=/usr/local/node-v8.11.1
export PATH=$NODE_HOME/bin:$PATH

#set node module path
export NODE_PATH=/usr/local/node-v8.11.1/lib/node_modules
export PATH=$NODE_PATH:$PATH
