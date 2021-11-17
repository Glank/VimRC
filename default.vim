set tabstop=2        " numbers of spaces of tab character"
set expandtab
set scrolloff=3      " keep 3 lines when scrolling"
set title			 			 " show title in console title bar"
set ttyfast			     " smoother changes"
set pastetoggle=<F2>
set paste
set shiftwidth=2

" enable filetype detection:
filetype on
filetype plugin on
" filetype indent off " file type based indentation - I've found this to be unnecessary
autocmd FileType c,cpp,java set formatoptions+=ro expandtab

" in makefiles, don't expand tabs to spaces, since actual tab characters are
" needed, and have indentation at 8 chars to be sure that all indents are tabs
" (despite the mappings later):
autocmd FileType make set noexpandtab shiftwidth=8 softtabstop=0

autocmd FileType py,python set ts=2 sts=2 sw=2 et
autocmd FileType js,mjs,json set ts=2 sts=2 sw=2 et
autocmd FileType tex set ts=2 sts=2 sw=2 et

" don't store rm, cp, and mv commands in the call history (prevents accidentally overwriting files)
autocmd ShellCmdPost * :call histdel(':', '!rm')
autocmd ShellCmdPost * :call histdel(':', '!cp')
autocmd ShellCmdPost * :call histdel(':', '!mv')

" delete without yanking
vnoremap p "0p
vnoremap P "0P
vnoremap y "0y
vnoremap d "0d

syntax on
