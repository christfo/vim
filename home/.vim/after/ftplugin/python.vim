setlocal omnifunc=pythoncomplete#Complete
setlocal tabstop=3 softtabstop=0 expandtab shiftwidth=3 smarttab
setlocal makeprg=~/bin/pre_commit.py\ %
setlocal formatprg=yapf
setlocal efm=\%A\ %#File\ \"%f\"\\,\ line\ %l\\,\ %m,%C\ %m,%Z

