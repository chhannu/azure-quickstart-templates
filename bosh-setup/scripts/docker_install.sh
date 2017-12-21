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
wget https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip?_ga=2.153712881.833076594.1513700779-686395587.1508758592 -P /tmp
mv /tmp/vault_0.9.0_linux_amd64.zip\?_ga\=2.72832858.833076594.1513700779-686395587.1508758592 /tmp/vault_0.9.0_linux_amd64.zip
unzip /tmp/vault_0.9.0_linux_amd64.zip -d /usr/local/bin/
export VAULT_ADDR=https://vault.platform.mnscorp.net
export VAULT_TOKEN=$1
vault auth -method=github token=$1
