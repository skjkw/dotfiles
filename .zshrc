source ~/.zshrc.antigen
export PATH="/home/kajikawa/.cask/bin:$PATH"
export GOPATH=~/go
export PATH=$PATH:~/go/bin
export PATH=$PATH:~/bin
export LANG=C

alias ekill='emacsclient -e "(kill-emacs)"'
alias en='emacsclient -nw -a ""'
alias e='emacsclient -c -a ""'

man() {
    env LESS_TERMCAP_mb=$'\E[01;31m' \
        LESS_TERMCAP_md=$'\E[01;38;5;74m' \
        LESS_TERMCAP_me=$'\E[0m' \
        LESS_TERMCAP_se=$'\E[0m' \
        LESS_TERMCAP_so=$'\E[38;5;246m' \
        LESS_TERMCAP_ue=$'\E[0m' \
        LESS_TERMCAP_us=$'\E[04;38;5;146m' \
        man "$@"
}

alias c='pygmentize -O style=monokai -f console256 -g -O encoding=utf-8'
function cl() {
    c $1 | nl -n ln -b a
}
alias cl=cl
export LESS='-iMR'
export LESSOPEN='| lessfilter %s'

eval $(dircolors -b)
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

function insert-file-by-percol(){
    LBUFFER=$LBUFFER$(ls -A | peco | tr '\n' ' ' | \
    sed 's/[[:space:]]*$//') # delete trailing space
    zle -R -c
}
zle -N insert-file-by-percol
bindkey '^[c' insert-file-by-percol

function peco-gitbranch() {
        # commiterdate:relativeを commiterdate:localに変更すると普通の時刻表示
        local selected_line="$(git for-each-ref --format='%(refname:short) | %(committerdate:relative) | %(committername) | %(subject)' --sort=-committerdate refs/heads refs/remotes \
            | column -t -s '|' \
            | peco \
            | head -n 1 \
            | awk '{print $1}')"
        if [ -n "$selected_line" ]; then
            BUFFER="git checkout ${selected_line}"
            CURSOR=$#BUFFER
            # ↓そのまま実行の場合
            zle accept-line
        fi
        zle clear-screen
    }
zle -N peco-gitbranch
bindkey '^x^b' peco-gitbranch

function peco-select-gitadd() {
    local SELECTED_FILE_TO_ADD="$(git status --porcelain | \
                                  peco --query "$LBUFFER" | \
                                  awk -F ' ' '{print $NF}')"
    if [ -n "$SELECTED_FILE_TO_ADD" ]; then
      BUFFER="git add $(echo "$SELECTED_FILE_TO_ADD" | tr '\n' ' ')"
      CURSOR=$#BUFFER
    fi
    zle accept-line
    zle clear-screen
}
zle -N peco-select-gitadd
bindkey "^x^a" peco-select-gitadd

function peco-ghq-cd () {
    local selected_dir=$(ghq list -p | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-ghq-cd
bindkey '^x^g' peco-ghq-cd

function peco-git-merge(){
    local selected_branch="$(git branch --all | peco --query "$LBUFFER" | sed -e "s/^\*[ ]*//g")"
    if [ -n "${selected_branch}" ]; then
        BUFFER="git merge ${selected_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-merge
bindkey '^x^m' peco-git-merge

function peco-git-commit-message(){
    candidates="$(git log --format="%s")"
    message="$(echo "$candidates" | peco)"
    if [ -n "${message}" ]; then
        BUFFER="git commit --verbose --edit --message='${message}'"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-commit-message
bindkey '^x^o' peco-git-commit-message

function peco-git-stash-pop(){
    local selected_stash="$(git stash list | peco --query "$LBUFFER" | awk -F: '{print $1}')"
    if [ -n "${selected_stash}" ]; then
        BUFFER="git stash pop ${selected_stash}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-stash-pop
bindkey '^x^s' peco-git-stash-pop

function peco-git-push(){
    local selected_remote_branch="$(git branch | peco --query "$LBUFFER" | awk '{print $2}')"
    if [ -n "${selected_remote_branch}" ]; then
        BUFFER="git push origin ${selected_remote_branch}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-git-push
bindkey '^x^p' peco-git-push

function fzf-git-hash(){
    git log --color --pretty='format:%C(yellow)%h%Creset %C(magenta)%cd%Creset %s %Cgreen(%an)%Creset %Cred%d%Creset%C(black bold)%ar%Creset' --date=iso | fzf --ansi --multi | awk '{print $1}'
}
alias -g H='$(fzf-git-hash)'

function peco-snippets(){
    local target="$(cat ~/.pgpass | peco | awk -F: '{print "-h " $1 " -p " $2 " -U " $4 " -d " $3}')"
    local execute="$(cat ~/.snippets | peco)"
    if [ -n "${target}" -a -n "${execute}" ]; then
        eval "psql ${target} -x -c \"${execute}\""
    fi
}
zle -N peco-snippets
alias pes=peco-snippets

# if [ $DISPLAY ]; then
#     xset r rate 200 100
# fi

stty -ixon

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000
SAVEHIST=1000000

# 単語の区切り文字を指定する
autoload -Uz select-word-style
select-word-style default
# ここで指定した文字は単語区切りとみなされる
# / も区切りと扱うので、^W でディレクトリ１つ分を削除できる
zstyle ':zle:*' word-chars " /=;@:{},|"
zstyle ':zle:*' word-style unspecified

# show_buffer_stack() {
#     POSTDISPLAY="
# stack: $LBUFFER"
#     zle push-line-or-edit
# }
# zle -N show_buffer_stack
# setopt noflowcontrol
# bindkey '^Q' show_buffer_stack

local p_buffer_stack=""
local -a buffer_stack_arr

function make_p_buffer_stack()
{
    if [[ ! $#buffer_stack_arr > 0 ]]; then
        p_buffer_stack=""
        return
    fi
    p_buffer_stack="%F{cyan}<stack:$buffer_stack_arr>%f"
}

function show_buffer_stack()
{
    local cmd_str_len=$#LBUFFER
    [[ cmd_str_len > 10 ]] && cmd_str_len=10
    buffer_stack_arr=("[$LBUFFER[1,${cmd_str_len}]]" $buffer_stack_arr)
    make_p_buffer_stack
    zle push-line-or-edit
    zle reset-prompt
}

function check_buffer_stack()
{
    [[ $#buffer_stack_arr > 0 ]] && shift buffer_stack_arr
    make_p_buffer_stack
}

zle -N show_buffer_stack
bindkey "^Q" show_buffer_stack
add-zsh-hook precmd check_buffer_stack

RPROMPT='${p_buffer_stack}'RPROMPT

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# ../ の後は今いるディレクトリを補完しない
zstyle ':completion:*' ignore-parents parent pwd ..

# sudo の後ろでコマンド名を補完する
zstyle ':completion:*:sudo:*' command-path /usr/local/sbin /usr/local/bin \
                       /usr/sbin /usr/bin /sbin /bin /usr/X11R6/bin

# ps コマンドのプロセス名補完
zstyle ':completion:*:processes' command 'ps x -o pid,s,args'


########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg


########################################
# オプション
# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# beep を無効にする
setopt no_beep

# フローコントロールを無効にする
setopt no_flow_control

# Ctrl+Dでzshを終了しない
setopt ignore_eof

# '#' 以降をコメントとして扱う
setopt interactive_comments

# ディレクトリ名だけでcdする
setopt auto_cd

# cd したら自動的にpushdする
setopt auto_pushd

# 重複したディレクトリを追加しない
setopt pushd_ignore_dups

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks

# 高機能なワイルドカード展開を使用する
setopt extended_glob

# 古いコマンドと同じものは無視
setopt hist_save_no_dups

# 重複を記録しない
setopt hist_ignore_dups

# 開始と終了を記録
setopt EXTENDED_HISTORY

# historyコマンドは履歴に登録しない
setopt hist_no_store

# 補完時にヒストリを自動的に展開
setopt hist_expand

# 履歴をインクリメンタルに追加
setopt inc_append_history

########################################
# エイリアス

alias la='ls -a'
alias ll='ls -l'

alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

alias mkdir='mkdir -p'

alias -g J='|jq . L'

alias gd='git diff HEAD'

# sudo の後のコマンドでエイリアスを有効にする
alias sudo='sudo '

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        #Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        ;;
esac

########################################
function chpwd() { ls -GAF }

########################################
# [[ -s "$HOME/.qfc/bin/qfc.sh" ]] && source "$HOME/.qfc/bin/qfc.sh" ]]

alias jump='_jump'
alias look='less $(find . -type f -maxdepth 1 | peco)'

function _jump(){
    __path="$(ag $* | peco | awk -F: '{printf "-c "$2 " " $1}')"
    if [ -n "$__path" ]; then
        vim $__path
    fi
}

########################################
if [ -e ~/.zshrc.local ]; then
    source ~/.zshrc.local
fi

########################################
# ----------------------
# Git Aliases
# ----------------------
alias g='git'
alias ga='git add'
alias gaa='git add .'
alias gaaa='git add -A'
alias gb='git branch'
alias gbd='git branch -d '
alias gc='git commit -v'
alias gcm='git commit -m'
alias gco='git checkout'
alias gcob='git checkout -b'
alias gcom='git checkout master'
alias gd='git diff'
alias gda='git diff HEAD'
alias gi='git init'
alias gl='git logg'
alias gl1='git log1'
alias gl2='git log2'
alias gl3='git log3'
alias gl4='git log4'
alias glg='git log --graph --oneline --decorate --all'
alias gld='git log --pretty=format:"%h %ad %s" --date=short --all'
alias gm='git merge --no-ff'
alias gp='git pull'
alias gss='git status -s'
alias gst='git stash'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gstd='git stash drop'
alias gph='git push origin HEAD'

########################################
# ----------------------
# Git Function
# ----------------------
# Git log find by commit message
function glf() { git log --all --grep="$1"; }

# vim:set ft=zsh:
