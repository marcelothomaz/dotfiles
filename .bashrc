# custom
eval `dircolors ~/.dotfiles/dircolors.256dark`
#source ~/.bash-powerline.sh
source ~/.bashstyler.sh


alias svim='sudo vim'

export N_PREFIX="$HOME/.n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# GoLang
export PATH=$PATH:/usr/local/go/bin
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

randpw() {
   if [ -z $1 ]; then
      echo "Usage: randpw <length>"
   fi
   </dev/urandom tr -dc '12345!@#$%qwertQWERTasdfgASDFGzxcvbZXCVB' | head -c$1; echo "";
}
