#!/bin/bash
grep '^. ~/.bashrc$' ~/.bash_profile &> /dev/null || echo '. ~/.bashrc' >> ~/.bash_profile
