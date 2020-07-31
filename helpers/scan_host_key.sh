#!/bin/bash

ssh-keyscan $1 > ~/.ssh/known_hosts
chmod 644 ~/.ssh/known_hosts