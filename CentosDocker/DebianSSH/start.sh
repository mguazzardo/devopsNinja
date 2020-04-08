#!/bin/bash

__create_user() {
# Create a user to SSH into as.
useradd devops

echo "root:master" | chpasswd
echo "devops:master" | chpasswd

}

# Call all functions
__create_user

