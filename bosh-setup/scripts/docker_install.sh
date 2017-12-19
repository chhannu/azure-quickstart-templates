apt-get -y install nginx curl wget unzip
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt-get update
apt-cache policy docker-ce
apt-get install -y docker-ce

wget https://cdn.twistlock.com/releases/4f7a5540/twistlock_2_2_100.tar.gz -P /tmp
mkdir /opt/twistlock
tar xzf /tmp/twistlock_2_2_100.tar.gz -C /opt/twistlock

wget https://releases.hashicorp.com/vault/0.9.0/vault_0.9.0_linux_amd64.zip?_ga=2.153712881.833076594.1513700779-686395587.1508758592 -P /tmp
mv /tmp/vault_0.9.0_linux_amd64.zip\?_ga\=2.72832858.833076594.1513700779-686395587.1508758592 /tmp/vault_0.9.0_linux_amd64.zip
unzip /tmp/vault_0.9.0_linux_amd64.zip -d /usr/local/bin/

export VAULT_ADDR=https://vault.platform.mnscorp.ne
export VAULT_AUTH_GITHUB_TOKEN=

vault auth -method=github token=

sed -i "s/HIGH_AVAILABILITY_ENABLED\=false/HIGH_AVAILABILITY_ENABLED\=true/" /opt/twistlock/twistlock.cfg
sed -i 's/MANAGEMENT_PORT_HTTP/#MANAGEMENT_PORT_HTTP/' /opt/twistlock/twistlock.cfg && sed -i 's/#MANAGEMENT_PORT_HTTPS/MANAGEMENT_PORT_HTTPS/' /opt/twistlock/twistlock.cfg
sed -i 's/CONSOLE_SAN=/CONSOLE_SAN=localhost/' /opt/twistlock/twistlock.cfg
cd /opt/twistlock/
/bin/sh /twistlock.sh -s console

sleep 45
