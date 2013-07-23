#!/bin/bash
PROXY=$1
if [ -z "$PROXY" ]; then
  echo "Need to pass the Proxy URL as a parameter"
  exit 1
fi

# set proxy in /etc/profile.d
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
