#!/bin/bash

work="work_rsa"
personal="personal_rsa"

tail -n 1 ~/.ssh/config | grep $personal >> /dev/null
is_personal=$?

if [[ $is_personal -eq 0 ]]; then
    echo "~/.ssh/config -> WORK"
    sed --in-place 9s/${personal}/${work}/ ~/.ssh/config
else 
    echo "~/.ssh/config -> PERSONAL"
    sed --in-place 9s/${work}/${personal}/ ~/.ssh/config
fi
