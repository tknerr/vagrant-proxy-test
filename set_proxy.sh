#!/bin/bash
PROXY=$1
if [ -z "$PROXY" ]; then
  echo "Need to pass the Proxy URL as a parameter"
  exit 1
fi

# set proxy in /etc/profile.d
echo "setting proxy to inside the Vagrant VM to '$PROXY'"
cat <<EOF | sudo tee /etc/profile.d/proxy.sh
export HTTP_PROXY=$PROXY
export HTTPS_PROXY=$PROXY
export NO_PROXY=localhost,127.0.0.1
EOF

# set apt proxy
cat <<EOF | sudo tee /etc/apt/apt.conf
Acquire { Retries "0"; HTTP { Proxy "$PROXY"; }; };
Acquire { Retries "0"; HTTPS { Proxy "$PROXY"; }; };
EOF

# source proxy settings and print them
source /etc/profile.d/proxy.sh
echo "HTTP_PROXY is $HTTP_PROXY"
echo "HTTPS_PROXY is $HTTPS_PROXY"
echo "NO_PROXY is $NO_PROXY"


