# Get the aliases and function
if [ -f ~/.bashrc ]; then
		.~/.bashrc
fi

# Load profile if exists
if [ -f ~/.profile ]; then
	.~/.profile
fi

# Set architecture flags
export ARCHFLAGS="-arch x86_64"
# Ensure user-installed binaries take precedence
export PATH=/usr/local/bin:$PATH
# Load .bashrc if it exists
test -f ~/.bashrc && source ~/.bashrc
JAVA_HOME=$(/usr/libexec/java_home)
alias fix_brew='sudo chown -R $USER /usr/local/'

# Setting PATH for Python 3.5
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/3.5/bin:${PATH}"
export PATH

# Fastboot
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi

# Setting PATH for Python 2.7
# The original version is saved in .bash_profile.pysave
PATH="/Library/Frameworks/Python.framework/Versions/2.7/bin:${PATH}"
export PATH

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/bshellnu/.sdkman"
[[ -s "/Users/bshellnu/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/bshellnu/.sdkman/bin/sdkman-init.sh"
