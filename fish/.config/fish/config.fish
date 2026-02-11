if status is-interactive
    # Commands to run in interactive sessions can go here
end

cat ~/.cache/wal/sequences

set -x EDITOR nvim
alias ...='cd ../..' # Go up two directories
alias vim='nvim' # Use nvim as vim
alias vi='nvim' # Use nvim as vi
alias v='nvim' # Use nvim as v

# List Directory
alias l='eza -lh  --icons=auto' # long list
alias ls='eza  --icons=auto' # short list
alias ll='eza -lha --icons=auto --sort=name --group-directories-first' # long list all
alias ld='eza -lhD --icons=auto' # long list dirs
alias lt='eza --icons=auto --tree' # list folder as tree
alias cat='bat'
