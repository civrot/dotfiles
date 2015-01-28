" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

""
"" Some of these borrowed from https://github.com/carlhuda/janus

""
"" Vundle
""

if filereadable(expand("~/.vimrc.bundles"))
  au BufWritePost .vimrc.bundles so ~/.vimrc.bundles
  so ~/.vimrc.bundles
endif

""
""  Basic
""

set nocompatible
set nonumber
set relativenumber
syntax enable
set encoding=utf-8
color detailed
set colorcolumn=80
set incsearch
"set clipboard=unnamed " Now all operations work OS clipboard

""
"" Whitespace
""

set nowrap
set tabstop=2
set shiftwidth=2
set expandtab
set backspace=indent,eol,start

""
"" List
"" borrowed from https://github.com/carlhuda/janus/blob/master/janus/vim/core/before/plugin/settings.vim
""
set list
set listchars=""                  " Reset the listchars
set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the left of the screen

""
"" Powerline
""

set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols= 'fancy'
let g:Powerline_stl_path_style = 'short'

""
"" Disable Arrow Keys
""

inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

"clear search hilights
noremap <silent><Leader>/ :nohls<CR>

" ESC
inoremap ii <Esc>

""
"" GitGutter
""
" dummy sign so that the sign col is always present
:sign define dummy
:execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" clean signColumn for https://github.com/airblade/vim-gitgutter
highlight clear SignColumn

""
"" Gist
""
let g:gist_post_private = 1
let g:gist_open_browser_after_post = 1 " open gist after it's created

"Open splits below and to the right
set splitbelow
set splitright

""
"" VRoom
""
let g:vroom_use_vimux = 1
let g:vroom_use_spring = 1

""
"" NERDTree
""
noremap <silent><Leader>n :NERDTreeToggle<CR>

""
"" Backup and swap files
""

set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.
