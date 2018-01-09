wget https://cdn.twistlock.com/releases/4f7a5540/twistlock_2_2_100.tar.gz -P /tmp
mkdir /opt/twistlock
tar xzf /tmp/twistlock_2_2_100.tar.gz -C /opt/twistlock
echo "$1" > /opt/check
