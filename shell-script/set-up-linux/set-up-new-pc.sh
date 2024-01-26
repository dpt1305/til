source /etc/os-release
echo $NAME

function installApplication() {
    # google chrome
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb;
    sudo dpkg -i google-chrome-stable_current_amd64.deb ;
    sudo apt -f install;
    
    # common app
    sudo snap install --classic code;
    sudo snap install spotify discord;
   
    # java
    sudo apt-get install openjdk-11-jdk -y;

}

if [[ "$NAME" =~ ^(Ubuntu).*$ ]] ; then
    sudo apt-get update -y && sudo apt-get upgrade -y;
    sudo apt install snapd -y;
    installApplication;

else
    sudo dnf upgrade;
fi
