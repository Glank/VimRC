set nocompatible     " use vim defaults" My name is WUT!
set ls=2             " allways show status line"
set tabstop=4        " numbers of spaces of tab character"
set shiftwidth=4
set expandtab
set scrolloff=3      " keep 3 lines when scrolling"
set showcmd          " display incomplete commands"
set hlsearch         " highlight searches"
set incsearch        " do incremental searching"
set ignorecase		 " ignore case when searching"
set title			 " show title in console title bar"
set ttyfast			 " smoother changes"

set hls is
set autoindent
set showcmd
set showmode
set pastetoggle=<F2>
set paste

syntax on

" Create Compile Functions"
function! RunPython()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !clear && echo "% is running..." && python %
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
function! TestBlog()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !clear && python manage.py test blog
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
function! ResetDB()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !rm central && echo $'yes\nglank\nglank314@gmail.com' | python manage.py syncdb
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
function! GitCommit()
    let curline = getline('.')
    call inputsave()
    let comment = input('Comment: ')
    call inputrestore()
    execute "!git add --all && git commit -m \"".comment."\""
endfunction
function! StartDjango()
    let s:save_lz = &lazyredraw   " save 'lazyredraw' setting
    set lazyredraw
    wall
    !clear && python manage.py runserver
    let &lazyredraw = s:save_lz   " restore 'lazyredraw'
endfunction
noremap <silent><F5> :call RunPython()<CR>
noremap <silent><F6> :call TestBlog()<CR>
noremap <silent><F7> :call GitCommit()<CR>
noremap <silent><F8> :call ResetDB()<CR>
noremap <silent><F9> :call StartDjango()<CR>
nnoremap <silent><F4> :set expandtab!<CR>
