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
   
    # java
    installJava

    # maven
    sudo apt-get install maven -y;


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
    sudo apt install neovim;
    
}

function installJava() {
    sudo apt-get install openjdk-11-jdk -y;
    # echo "export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64" >> ~/.bashrc
    # echo "export PATH=${PATH}:${JAVA_HOME}/bin" >> ~/.bashrc
    # source ~/.bashrc
}

if [[ "$NAME" =~ ^(Ubuntu).*$ ]] ; then
    sudo apt-get update -y && sudo apt-get upgrade -y;
    # sudo apt install vim apt-transport-https curl wget software-properties-common -y;
    sudo apt install snapd -y;
    
    installApplication;
    installNeoVim;
else
    sudo dnf upgrade;
fi
