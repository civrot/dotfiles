syntax on
color detailed
set colorcolumn=80

if filereadable(expand("~/.vimrc.bundles"))
    source ~/.vimrc.bundles
  endifn

" disable arrow keys
inoremap  <Up>     <NOP>
inoremap  <Down>   <NOP>
inoremap  <Left>   <NOP>
inoremap  <Right>  <NOP>
noremap   <Up>     <NOP>
noremap   <Down>   <NOP>
noremap   <Left>   <NOP>
noremap   <Right>  <NOP>

set clipboard=unnamed " Now all operations work OS clipboard

" powerline configs
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs

let g:Powerline_symbols= 'fancy'
let g:Powerline_stl_path_style = 'short'

"clear search hilights
noremap <silent><Leader>/ :nohls<CR>

" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

" ESC
inoremap ii <Esc

" dummy sign so that the sign col is always present
:sign define dummy
:execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" clean signColumn for https://github.com/airblade/vim-gitgutter
highlight clear SignColumn

"gist default setting
let g:gist_post_private = 1

"Open splits below and to the right
set splitbelow
set splitright

"vroom
let g:vroom_use_vimux = 1
