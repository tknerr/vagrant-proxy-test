#!/bin/bash
PROXY=$1

export HTTP_PROXY=$PROXY
export HTTPS_PROXY=$PROXY

echo "setting proxy to inside the Vagrant VM to '$PROXY'"

# just for testing 
export FOO=BAR
echo 'echo "FOO is $FOO and $0 was called with param $1"' | sudo tee /tmp/foo.sh
sudo chmod +x /tmp/foo.sh
echo 'calling foo.sh directly'
/tmp/foo.sh 'directly'
echo 'calling foo.sh via bash'
cat /tmp/foo.sh | sudo -E bash -s -- 'via_bash'
