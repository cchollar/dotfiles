set -g -x PATH /usr/local/bin $PATH
rvm default

if type rg &> /dev/null
  export FZF_DEFAULT_COMMAND='rg --files'
  export FZF_DEFAULT_OPTS='-m'
end
