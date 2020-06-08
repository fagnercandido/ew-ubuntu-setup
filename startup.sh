echo 'updating system'
sudo apt update
sudo apt -y full-upgrade

echo 'installing all dependencies'
sudo apt install aptitude gnome-tweak-tool dconf-editor gnome-shell-extensions gnome-shell-extension-system-monitor ncdu tmux zsh vim vim-gtk meld git-core build-essential exuberant-ctags ncurses-term python-jinja2 cmake xterm curl ssh net-tools jq tilix dirmngr gpg wget snapd -y

echo 'installing git' 
sudo apt install git -y
git config --global user.name "Fagner Candido"
git config --global user.email "fsouzacandido@gmail.com"
git config --global core.editor vim

echo 'installing tool to handle clipboard via CLI'
sudo apt-get install xclip -y

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens' 
gsettings set org.gnome.mutter workspaces-only-on-primary false

export alias pbcopy='xclip -selection clipboard'
export alias pbpaste='xclip -selection clipboard -o'
source ~/.zshrc

echo 'installing vim'
sudo apt install vim -y

echo 'installing snap'
snap refresh
snap install code --classic
snap install skype --classic
snap install heroku --classic 
snap install spotify
snap install exercism
snap install insomnia

echo 'installing extensions of vscode'
code --install-extension dbaeumer.vscode-eslint
code --install-extension christian-kohler.path-intellisense
code --install-extension dbaeumer.vscode-eslint
code --install-extension dracula-theme.theme-dracula
code --install-extension esbenp.prettier-vscode
code --install-extension foxundermoon.shell-format
code --install-extension pmneo.tsimporter
code --install-extension waderyan.gitblame
code --install-extension yzhang.markdown-all-in-one
code --install-extension vscoss.vscode-ansible
code --install-extension ms-vscode.cpptools
code --install-extension ms-azuretools.vscode-docker
code --install-extension vscjava.vscode-java-pack
code --install-extension ms-python.python

source ~/.zshrc

echo 'installing autosuggestions' 
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing docker' 
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose' 
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version


echo 'installing fzf'
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install --all

echo 'installing asdf'
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc
echo '. $HOME/.asdf/completions/asdf.bash' >> ~/.zshrc


sudo apt-get install -y git-core curl wget build-essential autoconf unzip libssl-dev libncurses5-dev libreadline-dev zlib1g-dev libsqlite3-dev inotify-tools pkg-config

source .bashrc
source .zshrc

source .asdf/asdf.sh


asdf plugin-add nodejs https://github.com/asdf-vm/asdf-nodejs.git
bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
asdf plugin-add java https://github.com/halcyon/asdf-java.git
asdf plugin-add golang https://github.com/kennyp/asdf-golang.git
asdf plugin-add gradle https://github.com/rfrancis/asdf-gradle.git
asdf plugin-add maven


echo 'installing zsh'
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh
