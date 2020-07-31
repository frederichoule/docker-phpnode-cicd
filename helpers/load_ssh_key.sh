#!/bin/bash

eval $(ssh-agent -s)
chmod 0700 $1
ssh-add $1