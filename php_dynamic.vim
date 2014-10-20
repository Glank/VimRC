set nocompatible     " use vim defaults" My name is WUT!
set ls=2             " allways show status line"
set tabstop=4        " numbers of spaces of tab character"
set shiftwidth=4
set expandtab
set scrolloff=3      " keep 3 lines when scrolling"
set showcmd          " display incomplete commands"
set hlsearch         " highlight searches"
set incsearch        " do incremental searching"
set ignorecase       " ignore case when searching"
set title            " show title in console title bar"
set ttyfast          " smoother changes"

set hls is
set autoindent
set showcmd
set showmode
set pastetoggle=<F2>
set paste

syntax on
autocmd BufWinEnter *.tpl   :setf php

" Create Compile Functions"
function! RunPython()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !clear && echo "% is running..." && python %
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
function! RunJava()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !clear && javac *.java && java Main
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
function! GitCommit()
    let curline = getline('.')
    call inputsave()
    let comment = input('Comment: ')
    call inputrestore()
    execute "!git add --all && git commit -m \"".comment."\""
endfunction
noremap <silent><F5> :call RunPython()<CR>
noremap <silent><F6> :call RunJava()<CR>
noremap <silent><F7> :call GitCommit()<CR>
