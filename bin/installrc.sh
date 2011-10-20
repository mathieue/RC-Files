#!/bin/bash
grep '^. ~/.bashrc$' ~/.bash_profile &> /dev/null || echo '. ~/.bashrc' >> ~/.bash_profile
cat >> ~/.bashrc <<EOF
if [ -e ~/.mybashrc ]; then
       . ~/.mybashrc
fi
EOF
