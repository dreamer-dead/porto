#!/bin/bash

# gcc-4.7
sudo add-apt-repository -y ppa:ubuntu-toolchain-r/test

sudo apt-get update -qq
sudo apt-get install -qq g++-4.7

# Configuration
: ${FORCE_SUBREAPER:="1"}
export FORCE_SUBREAPER

# Trevis build platform doesn't have those newer Linux flags.
CXXFLAGS="-DPR_SET_CHILD_SUBREAPER=36 -DPR_GET_CHILD_SUBREAPER=37"
if [[ "${FORCE_SUBREAPER}" -eq 1 ]]; then
  export CXXFLAGS
fi

export CXX="g++-4.7" CC="gcc-4.7"