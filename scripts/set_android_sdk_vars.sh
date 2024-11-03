# Detect the shell profile file
if [[ $SHELL == *"zsh" ]]; then
  PROFILE_FILE="$HOME/.zshrc"
else
  PROFILE_FILE="$HOME/.bash_profile"
fi

# Append Android SDK environment variables to the profile
cat << 'EOF' >> $PROFILE_FILE

# JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/bin:$PATH

# Android SDK Environment
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
EOF

# Reload the profile
source $PROFILE_FILE

echo "Android SDK environment variables added to $PROFILE_FILE and profile reloaded."
echo $ANDROID_HOME
echo $JAVA_HOME