#!/bin/sh

source /etc/os-release
echo $NAME

function installApplication() {
    # google chrome
    # wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
    # sudo dpkg -i google-chrome-stable_current_amd64.deb ;
    # sudo apt -f install;
    
    # common app
    sudo snap install --classic code;
    sudo snap install spotify discord;
   
    # intelliJ
    # mkdir IntelliJ
    # cd IntelliJ
    # wget https://download.jetbrains.com/idea/ideaIU-2023.3.3.tar.gz
    # tar -xzf ideaIU-2023.3.3.tar.gz 
    # cd idea-IU-233.14015.106/bin
    # chmod +x IntelliJ\ IDEA.sh
    # ./IntelliJ\ IDEA.sh
}

function installNeoVim() {
    sudo apt install neovim -y;
    
}

function installJava11() {
    sudo apt-get install openjdk-11-jdk -y;
    echo "\n# Java" >> ~/.bashrc;
    echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
    echo "export PATH=\${PATH}:\${JAVA_HOME}/bin" >> ~/.bashrc
    . ~/.bashrc
}

function installJava17() {
    apt install openjdk-17-jdk openjdk-17-jre -y;
}

function installJenv(){
    git clone https://github.com/jenv/jenv.git ~/.jenv;
    echo 'export PATH="$HOME/.jenv/bin:$PATH"' >> ~/.bash_profile;
    echo 'eval "$(jenv init -)"' >> ~/.bash_profile;
    . ~/.bash_profile;
    jenv add;
}

function installMaven() {
    maven_link=$1

    sudo chmod 1777 /tmp
    sudo wget $maven_link -P /tmp
    sudo tar xf /tmp/apache-maven-*.tar.gz  -C /opt
    sudo ln -s /opt/apache-maven-* /opt/maven

    echo "\n# MAVEN" >> ~/.bashrc
    echo "export M2_HOME=/opt/maven" >> ~/.bashrc
    echo "export PATH=\${M2_HOME}/bin:\${PATH}" >> ~/.bashrc
    . ~/.bashrc
}

function installLazyGit() {
    LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*');
    curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz";
    tar xf lazygit.tar.gz lazygit;
    sudo install lazygit /usr/local/bin;

    echo "\# lazygit" >> ~/.bashrc;
    echo "alias lzg=lazygit" >> ~/.bashrc;
}

if [[ "$NAME" =~ ^(Ubuntu).*$ ]] ; then
    echo -n "Enter link for maven: "
    read maven_link

    sudo apt-get update -y && sudo apt-get upgrade -y;
    sudo apt install snapd -y;
    
     # java
    installJava11

    # maven
    installMaven $maven_link;

    installApplication;

    installNeoVim;
else
    sudo dnf upgrade;
fi
