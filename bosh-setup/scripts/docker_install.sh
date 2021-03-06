apt-get -y install nginx curl wget unzip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce
apt-get install -y python-pip
pip install ansible
pip install ansible-modules-hashivault
wget https://cdn.twistlock.com/releases/4f7a5540/twistlock_2_2_100.tar.gz -P /tmp
mkdir /opt/twistlock
tar xzf /tmp/twistlock_2_2_100.tar.gz -C /opt/twistlock
echo "$1" > /opt/check
