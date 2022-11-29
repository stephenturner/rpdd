#!/bin/bash

R CMD build .
mv rpdd_*.tar.gz docker/assets
docker build -t rpdd docker
