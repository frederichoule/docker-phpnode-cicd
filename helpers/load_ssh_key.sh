#!/bin/bash

eval `ssh-agent -s`
chmod 0600 $1
ssh-add $1