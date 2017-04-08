#!/bin/bash

echo
echo Installing R libraries
echo

apt-get install -y --no-install-recommends libxml2-dev

R CMD BATCH libraries.R
