#!/bin/bash
PROXY=$1

# set proxy in /etc/profile.d
echo "setting proxy to inside the Vagrant VM to '$PROXY'"
cat <<EOF | sudo tee /etc/profile.d/proxy.sh
export HTTP_PROXY=$PROXY
export HTTPS_PROXY=$PROXY
EOF

# source proxy settings
source /etc/profile.d/proxy.sh
echo "HTTP_PROXY is $HTTP_PROXY"
echo "HTTPS_PROXY is $HTTPS_PROXY"

# TODO: set apt / yum proxy
echo "TODO: set apt/yum proxy"

# just for testing 
echo 'echo "foo says HTTPS_PROXY is $HTTPS_PROXY and $0 was called with param $1"' | sudo tee /tmp/foo.sh
sudo chmod +x /tmp/foo.sh
echo 'calling foo.sh directly'
/tmp/foo.sh 'directly'
echo 'calling foo.sh via bash'
cat /tmp/foo.sh | sudo -E bash -s -- 'via_bash'

