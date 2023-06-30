#!/usr/bin/env bash

# Configure .zshrc
echo "# Set path if required" >> ${HOME}/.zshrc
echo "#export PATH=$GOPATH/bin:/usr/local/go/bin:$PATH" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# Aliases" >> ${HOME}/.zshrc
echo "alias ls='ls --color=auto'" >> ${HOME}/.zshrc
echo "alias ll='ls -lah --color=auto'" >> ${HOME}/.zshrc
echo "alias grep='grep --color=auto'" >> ${HOME}/.zshrc
echo "alias ec="$EDITOR $HOME/.zshrc" # edit .zshrc" >> ${HOME}/.zshrc
echo "alias sc="source $HOME/.zshrc"  # reload zsh configuration" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# Set up the prompt - if you load Theme with zplugin as in this example, this will be overriden by the Theme. If you comment out the Theme in zplugins, this will be loaded." >> ${HOME}/.zshrc
echo "autoload -Uz promptinit" >> ${HOME}/.zshrc
echo "promptinit" >> ${HOME}/.zshrc
echo "prompt adam1            # see Zsh Prompt Theme below" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# Use vi keybindings even if our EDITOR is set to vi" >> ${HOME}/.zshrc
echo "bindkey -e" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "setopt histignorealldups sharehistory" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# Keep 5000 lines of history within the shell and save it to ~/.zsh_history:" >> ${HOME}/.zshrc
echo "HISTSIZE=5000" >> ${HOME}/.zshrc
echo "SAVEHIST=5000" >> ${HOME}/.zshrc
echo "HISTFILE=~/.zsh_history" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# Use modern completion system" >> ${HOME}/.zshrc
echo "autoload -Uz compinit" >> ${HOME}/.zshrc
echo "compinit" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# zplug - manage plugins" >> ${HOME}/.zshrc
echo "source /usr/share/zplug/init.zsh" >> ${HOME}/.zshrc
echo "zplug "plugins/git", from:oh-my-zsh" >> ${HOME}/.zshrc
echo "zplug "plugins/sudo", from:oh-my-zsh" >> ${HOME}/.zshrc
echo "zplug "plugins/command-not-found", from:oh-my-zsh" >> ${HOME}/.zshrc
echo "zplug "zsh-users/zsh-syntax-highlighting"" >> ${HOME}/.zshrc
echo "zplug "zsh-users/zsh-autosuggestions"" >> ${HOME}/.zshrc
echo "zplug "zsh-users/zsh-history-substring-search"" >> ${HOME}/.zshrc
echo "zplug "zsh-users/zsh-completions"" >> ${HOME}/.zshrc
echo "zplug "junegunn/fzf"" >> ${HOME}/.zshrc
echo "zplug "themes/robbyrussell", from:oh-my-zsh, as:theme   # Theme" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc
echo "# zplug - install/load new plugins when zsh is started or reloaded" >> ${HOME}/.zshrc
echo "if ! zplug check --verbose; then" >> ${HOME}/.zshrc
echo "    printf "Install? [y/N]: "" >> ${HOME}/.zshrc
echo "    if read -q; then" >> ${HOME}/.zshrc
echo "        echo; zplug install" >> ${HOME}/.zshrc
echo "    fi" >> ${HOME}/.zshrc
echo "fi" >> ${HOME}/.zshrc
echo "zplug load --verbose" >> ${HOME}/.zshrc
echo "" >> ${HOME}/.zshrc

# #install starship
mkdir -p ${HOME}/.config
curl -o "${HOME}/.config/starship.toml" "https://gist.githubusercontent.com/afbase/eca9d8a11a3231ea1600622e205f7775/raw/373842b69617b32bda8f912f0f0646fa22632bf0/starship.toml"
echo 'eval "$(starship init zsh)"' >> "${HOME}/.zshrc"
curl -fsSL https://starship.rs/install.sh | sh -s -- --yes

# #Nerd Font
FONTS_FOLDER="/usr/share/fonts/truetype/mononoki"
# FONTS_FOLDER="${HOME}/.local/share/fonts"
MONONOKI_FONT_ZIP="${FONTS_FOLDER}/Mononoki.zip"
mkdir -p "${FONTS_FOLDER}"
wget "https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.2/Mononoki.zip" -P ${FONTS_FOLDER}
unzip "${MONONOKI_FONT_ZIP}" -d "${FONTS_FOLDER}"
apt-get -y install --no-install-recommends fontconfig
fc-cache -fv
fc-cache -fv ${FONTS_FOLDER}

# set zsh as default
# https://wiki.debian.org/Zsh
chsh -s /bin/zsh