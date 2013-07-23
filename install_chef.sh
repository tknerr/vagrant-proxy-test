#!/bin/bash
VERSION=$1
if [ -z "$VERSION" ]; then
  echo "Need to pass Chef Version as a parameter"
  exit 1
fi

# the omnibus install script
INSTALL_SH=https://www.opscode.com/chef/install.sh

# check if chef is already installed
if ! (command -v chef-solo &>/dev/null); then
  # install omnibus chef either via wget or curl
  if command -v wget &>/dev/null; then
    wget -qO- $INSTALL_SH | sudo -E bash -s -- -v $VERSION
  elif command -v curl &>/dev/null; then
    curl -L $INSTALL_SH -v $VERSION | sudo -E bash
  else
    echo "Neither wget nor curl found. Please install one." >&2
    exit 1
  fi
else
  # chef is already installed - do nothing
  echo "Chef is already installed (`chef-solo --v`)"
fi

