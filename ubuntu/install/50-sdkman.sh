#!/bin/bash
set -e
echo "SDKMAN installation and JDK/SDK setup"
curl -s "https://get.sdkman.io" | bash
source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk install java 11.0.12-open
sdk install maven 3.6.3
