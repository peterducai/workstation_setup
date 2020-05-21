#!/bin/bash



wget https://github.com/operator-framework/operator-sdk/releases/download/v0.17.1/operator-sdk-v0.17.1-x86_64-linux-gnu
sudo mkdir -p /usr/local/bin/operator-sdk
sudo mv operator-sdk-v0.17.1-x86_64-linux-gnu /usr/local/bin/operator-sdk
sudo chmod +x /usr/local/bin/operator-sdk/operator-sdk-v0.17.1-x86_64-linux-gnu 