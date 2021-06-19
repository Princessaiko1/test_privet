#!/bin/bash

gstatus=`git status --porcelain`

if [ ${#gstatus} -ne 0 ]
then

    git add --all
    git commit -m "Automated sync: $gstatus"
    git pull --rebase
    git push

fi