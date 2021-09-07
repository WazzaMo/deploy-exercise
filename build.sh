# /usr/bin/bash

# (c) Copyright Warwick Molloy 2021.

# If debugging or updating Dockerfile, use DEBUG, otherwise comment out

# DEBUG="--no-cache"

docker build . $DEBUG -t lokel/deploy:1.0