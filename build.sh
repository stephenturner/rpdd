#!/bin/bash

## sed to get v number and pkg name
v=$(sed -n 's/Version: //p' DESCRIPTION)
pkg=$(sed -n 's/Package: //p' DESCRIPTION)

## build the R package
R CMD build .

## move the pkg tar to src dir with version-less name
mv ${pkg}_${v}.tar.gz docker/src/${pkg}.tar.gz

## build the image and tag with version *and* latest
docker build -t ${pkg}:${v} -t ${pkg}:latest docker
