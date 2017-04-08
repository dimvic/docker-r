#!/bin/bash

echo
echo Installing texlive
echo

wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz
tar -zxvf install-tl-unx.tar.gz
./install-tl-*/install-tl -profile texlive.profile \
    || ./install-tl-*/install-tl -profile texlive.profile \
    || ./install-tl-*/install-tl -profile texlive.profile \
    || ./install-tl-*/install-tl -profile texlive.profile \
    || ./install-tl-*/install-tl -profile texlive.profile

PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"
tlmgr install texinfo \
    framed \
    background \
    everypage \
    datetime \
    fmtcount

apt-get install -y texinfo

cp /etc/bash.bashrc tmp.bashrc \
    && echo PATH=\"/usr/local/texlive/2016/bin/x86_64-linux:\$PATH\" > /etc/bash.bashrc \
    && cat tmp.bashrc >> /etc/bash.bashrc
echo PATH="/usr/local/texlive/2016/bin/x86_64-linux:$PATH"
