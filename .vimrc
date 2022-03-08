"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                     _                                               """""
"""""                    (_)                                              """""
"""""              __   ___ _ __ ___  _ __ ___                            """""
"""""              \ \ / / | '_ ` _ \| '__/ __|                           """""
"""""               \ V /| | | | | | | | | (__                            """""
"""""              (_)_/ |_|_| |_| |_|_|  \___|                           """""
"""""                                                                     """""
"""""               ____  ____  ____  _  __ _ _____ _____                 """""
"""""              /   _\/  _ \/  _ \/ |/ // \\__  \\__  \                """""
"""""              |  /  | / \|| / \||   / | |  /  |  /  |                """""
"""""              |  \__| \_/|| \_/||   \ | | _\  | _\  |                """""
"""""              \____/\____/\____/\_|\_\\_//____//____/                """""
"""""                                                                     """""
"""""                                                                     """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                                 Vundle                              """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" YouCompleteMe
"Plugin 'Valloric/YouCompleteMe'

" NERDTree
Plugin 'scrooloose/nerdtree'

" Plugin for Git integration to NERDTree
Plugin 'Xuyuanp/nerdtree-git-plugin'

" vim-flake8 - PEP8 for python files
Plugin 'nvie/vim-flake8'


" Plugin for Pug
Plugin 'digitaltoad/vim-pug'

" Plugin for LaTeX support
Plugin 'lervag/vimtex'

" Plugin for Javascript
Plugin 'pangloss/vim-javascript'

" Plugin for surround.vim
Plugin 'tpope/vim-surround'

" Plugin for .editorconfig files
Plugin 'editorconfig/editorconfig-vim'

" Plugin for DOT graphing
Plugin 'wannesm/wmgraphviz.vim'

" Plugin for ALE
Plugin 'dense-analysis/ale'

" Plugin for Deoplete + deps
Plugin 'shougo/deoplete.nvim'
Plugin 'roxma/nvim-yarp'
Plugin 'roxma/vim-hug-neovim-rpc'

" Plugin for enabling Jedi with Deoplete
Plugin 'deoplete-plugins/deoplete-jedi'

" Plugin for indentLine, puts bars on indentation
Plugin 'Yggdroot/indentLine'

" Plugin for Jenkinsfile syntax highlighting
Plugin 'martinda/Jenkinsfile-vim-syntax'

" Plugin TypeScript syntax highlighting
Plugin 'leafgarland/typescript-vim'

" Plugin TSX syntax highlighting
"Plugin 'peitalin/vim-jsx-typescript'  " Did not work as intended
Plugin 'maxmellon/vim-jsx-pretty'

" Plugin syntax highlighting for GraphQL
Plugin 'jparise/vim-graphql'

" Plugin git wrapper - fugitive
Plugin 'tpope/vim-fugitive.git'

" Plugin for color highlighting in Vim
Plugin 'ap/vim-css-color'

" Plugin for Vim Airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" Plugin for fzf integration with vim
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Plugin for todo.txt
Plugin 'freitass/todo.txt-vim'

"" Plugin for vim-multiple-cursors --- multiple cursors in one edit
"Plugin 'terryma/vim-multiple-cursors'

" Plugin for ansible files
Plugin 'pearofducks/ansible-vim'
" Plugin for Kotlin syntax highlighting
Plugin 'udalov/kotlin-vim'

" Plugin for HashiCorp Terraform
Plugin 'hashivim/vim-terraform'

" Plugin for OpenWRT Unified Configuration Interface (uci) files
Plugin 'cmcaine/vim-uci'

" Plugin for nix syntax highlighting
Plugin 'LnL7/vim-nix'

" Plugin for TOML syntax highlighting
Plugin 'cespare/vim-toml'

" Plugin for seamless interop with Tmux
Plugin 'christoomey/vim-tmux-navigator'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                                Settings                             """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Enables syntax and 256 colors in vim
syntax enable
set t_Co=256

""" Set encoding
set encoding=utf-8

""" Save folds and reload them after use
"au BufWinLeave * mview
"au BufWinEnter * silent loadview

""" Make tabs 4 spaces
set expandtab 
set tabstop=4
set shiftwidth=4

""" In Makefiles we need to use tab characters per syntax
autocmd FileType make set noexpandtab

""" Indentation
set autoindent
set smartindent

""" Set line numbers
set number

""" (Cannot recall)
set backspace=2

""" Display row and column numbers
set ruler

""" Set Vim PATH to working directory (enables finding files)
set path=$PWD/**

""" Enable window split movement with mouse
set mouse=a

""" Highlight search text
set hlsearch


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                          Visual customization                       """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Minimize vertical split bar
highlight VertSplit cterm=none


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                             Custom commands                         """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! W write


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                            Custom functions                         """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" https://gist.github.com/juanpabloaj/1239808
function! ToggleNumberDisplay()
    if &nu == &rnu
        setl nornu
    else
        setl rnu
    endif
endfunction

function! ToggleVirtualEdit()
    if &ve == 'all'
        setl virtualedit=
    else
        setl virtualedit=all
    endif
endfunction

function! ToggleWrap()
    if &wrap == 1
        setl nowrap
    else
        setl wrap
    endif
endfunction

" https://vim.fandom.com/wiki/Highlight_all_search_pattern_matches
let g:highlighting = 0
function! Highlighting()
  if g:highlighting == 1 && @/ =~ '^\\<'.expand('<cword>').'\\>$'
    let g:highlighting = 0
    return ":silent nohlsearch\<CR>"
  endif
  let @/ = '\<'.expand('<cword>').'\>'
  let g:highlighting = 1
  return ":silent set hlsearch\<CR>"
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                             Custom mappings                         """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Global custom mappings
imap jj <Esc>

nmap Ö (
nmap ö {
nmap Ä )
nmap ä }

vmap Ö (
vmap ö {
vmap Ä )
vmap ä }

" Leader mappings
let mapleader = ' '
let maplocalleader = ' '

nmap <leader>ag :ALEGoToDefinition<CR>
nmap <leader>ar :ALEFindReferences<CR>
nmap <leader>at :ALEToggle<CR>
nmap <leader>ah :ALEHover<CR>
nmap <leader>ad :ALEDetail<CR>
nmap <leader>gd :Gdiffsplit<CR>
nmap <leader>ghd :Ghdiffsplit<CR>
nmap <leader>gvd :Gvdiffsplit<CR>
nmap <leader>gb :Gblame<CR>
nmap <leader>af :ALEFix<CR>
nmap <silent> <leader>s :split<CR>
nmap <silent> <leader>v :vsplit<CR>
nmap <silent> <leader>q :q<CR>
nmap <silent> <leader>Q :qa<CR>
nmap <silent> <leader>w :w<CR>
nmap <silent> <leader>x :x<CR>
nmap <silent> <leader>c :noh<CR>
nmap <leader>f :GFiles<CR>
nmap <leader>F :Files<CR>
nmap <leader>B :Buffers<CR>
nmap <leader>G :GGrep<CR>
nmap <leader>k <Plug>(ale_previous_wrap)
nmap <leader>j <Plug>(ale_next_wrap)
nmap <silent> <leader>n :bn<CR>
nmap <silent> <leader>b :bp<CR>
nmap <leader>t 1<C-W>w
nnoremap <silent> <expr> <leader>h Highlighting()

" Function mappings
nnoremap <expr> <leader>0 ToggleNumberDisplay()
nnoremap <expr> <leader>e ToggleVirtualEdit()
nnoremap <expr> <leader>9 ToggleWrap()

" Plugin mappings
" https://stackoverflow.com/a/52615863
inoremap <silent><expr> <Tab>
    \ pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <silent><expr> <S-Tab>
    \ pumvisible() ? "\<C-p>" : "\<S-TAB>"


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                              Configuration                          """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""" Vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='mupdf'
let g:vimtex_quickfix_mode=0
"set conceallevel=1
"let g:tex_conceal='abdmg'

""" Configure NERDTree
" Set NERDTree to open when vim is opened
"autocmd vimenter * NERDTree
" Toggle NERDTree open or close with Ctrl+n
map <C-n> :NERDTreeToggle<CR>
" Close vim if NERDTree is the only window open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


""" NOT ACTIVELY IN USE
""" YouCompleteMe
"let g:ycm_global_ycm_extra_conf = '/home/cookie/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
" Close YouCompleteMe preview after insertion
"let g:ycm_autoclose_preview_window_after_completion=1

""" WM Graphviz
let g:WMGraphviz_viewer='mupdf'

""" ALE
let g:ale_fix_on_save = 0
let g:ale_set_highlights = 0
let g:ale_completion_enabled = 1
let g:ale_lint_on_enter = 0
" Use ALE and also some plugin 'foobar' as completion sources for all code.
call deoplete#custom#option('sources', {
\ '_': ['ale', 'jedi'],
\})

""" Deoplete
" Set Python3 paths for Deoplete (+ jedi)
let g:python3_host_prog = '/usr/bin/python3'
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
" Enable Deoplete on startup
let g:deoplete#enable_at_startup = 1
" Enable <TAB> completion
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Exists preview automatically on completion
"autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

""" IndentLine
" Enables custom colorscheme color
"let g:indentLine_setColors = 0
" Indent character
let g:indentLine_char = '¦'
" Puts each bar on level of indentation
"let g:indentLine_char_list = ['|', '¦', '┆', '┊']
" Concealment
let g:indentLine_concealcursor = 'inc'
let g:indentLine_conceallevel = 2
"let g:indentLine_setConceal = 0

""" Airline
let g:airline_theme='base16'
let g:airline_powerline_fonts = 1
"let g:airline#extensions#branch#displayed_head_limit = 10
let g:airline#extensions#branch#format = 1
let g:airline#extensions#nerdtree_status = 0
let g:airline#extensions#default#section_truncate_width = {
\ 'b': 120,
\ }

""" FZF
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
"command! -bang -nargs=* GGrep
"  \ call fzf#vim#grep(
"  \   'git grep --line-number '.shellescape(<q-args>), 0,
"  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number -- '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

""" Vim Multiple Cursors
let g:multi_cursor_use_default_mapping=0

"" Default mapping
"let g:multi_cursor_start_word_key      = '<C-m>'
"let g:multi_cursor_select_all_word_key = '<A-n>'
"let g:multi_cursor_start_key           = 'g<C-n>'
"let g:multi_cursor_select_all_key      = 'g<A-n>'
"let g:multi_cursor_next_key            = '<C-m>'
"let g:multi_cursor_prev_key            = '<C-p>'
"let g:multi_cursor_skip_key            = '<C-x>'
""let g:multi_cursor_quit_key            = '<Esc>'
"let g:multi_cursor_quit_key            = 'jj'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""                              MUST BE LAST                           """""
"""""             Rules for having custom .vimrc files in folders         """""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure
