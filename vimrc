" automatically reload vimrc when it's saved
au BufWritePost .vimrc so ~/.vimrc

""
"" Plugins
""
if filereadable(expand("~/.vimrc.plugins"))
  au BufWritePost .vimrc.plugins so ~/.vimrc.plugins
  so ~/.vimrc.plugins
endif

""
""  Basic
""
set nocompatible
set relativenumber
set noswapfile
syntax enable
set encoding=utf-8
set background=dark
set colorcolumn=80
set incsearch
"set clipboard=unnamed " Now all operations work OS clipboard
set laststatus=2

color solarized

" disable Press Enter
set shortmess=a

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
"" File Extensions
""
au BufNewFile,BufRead *.md set filetype=markdown

""
"" Airline
""
let g:airline_powerline_fonts=1
" let g:airline_theme='powerlineish'
let g:airline_theme='bubblegum'
let g:airline#extensions#branch#displayed_head_limit = 12
let g:airline#extensions#ale#enabled = 1

"" ""
"" TmuxLine
"" ""
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_preset = ({
        \ 'a': '#S',
        \ 'win': '#I #W',
        \ 'cwin': '#I #W',
        \ 'z': ['%a', '%b %d', '%R'],
        \ 'options': {
        \'status-justify': 'centre'}
        \})

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

""
"" Searching
""
set hlsearch
"clear search hilights
nnoremap <silent> <Space> :nohlsearch<Bar>:echo<CR>

""
"" GitGutter
""
" dummy sign so that the sign col is always present
:sign define dummy
:execute 'sign place 9999 line=1 name=dummy buffer=' . bufnr('')
" clean signColumn for https://github.com/airblade/vim-gitgutter
highlight clear SignColumn


""
"" Merginal
""
let g:merginal_remoteVisible = 0 " don't show remote branchs
let g:merginal_splitType = '' " horizontal split

""
"" Pane splitting
""
"Open splits below and to the right
set splitbelow
set splitright

""
"" VRoom
""
let g:vroom_use_vimux = 1
" let g:vroom_use_dispatch = 1
" let g:vroom_use_spring = 1
let g:vroom_use_binstubs = 1

""
"" NERDTree
""
noremap <silent><Leader>n :NERDTreeToggle<CR>

""
"" Spelling
""
" Spell-check Git messages
autocmd FileType gitcommit setlocal spell

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

""
"" ALE
""
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
" let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_hover_cursor = 1

" let g:ale_fixers = {'javascript': ['eslint']}
" let g:ale_completion_enabled = 1
" Fix files automatically on save
" let g:ale_fix_on_save = 1

""
"" fzf
""
nnoremap <C-p> :Files<CR>
nnoremap <C-b> :Buffers<CR>
nnoremap <Leader>h :History<CR>
nnoremap <C-f> :Rg<CR>
set grepprg=rg\ --vimgrep\ --smart-case\ --hidden\ --follow
" let g:rg_derive_root='true'

""
"" Ruby
""
" enable matchit to match ruby pairst
runtime macros/matchit.vi

"" Backup and swap files
""
set backupdir^=~/.vim/_backup//    " where to put backup files.
set directory^=~/.vim/_temp//      " where to put swap files.

if has('nvim')
  let g:python3_host_prog = '/Library/Frameworks/Python.framework/Versions/3.8/bin/python3'
  set nowb
endif
