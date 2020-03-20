#!/bin/bash

sudo useradd $NOMBRE
sudo echo "$NOMBRE:$PASS" | sudo chpasswd
