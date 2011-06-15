(cd ~ ; ln -s ~/.vim/.vimrc )
git submodule init
git submodule update

find bundle/ -name *.vim -exec dos2unix '{}' \;
mkdir ~/.vim-tmp
