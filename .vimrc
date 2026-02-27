
set number
set relativenumber
set signcolumn=yes
"set cursorline
set scrolloff=5
set nowrap

"identacion
set tabstop=4       " Un TAB se ve como 4 espacios
set shiftwidth=4    " Indentación al usar >> << =
set softtabstop=4   " Backspace borra de a 4
set expandtab       " Usa espacios en vez de tabs
"identacion

syntax on
filetype plugin indent on


let mapleader = " "

nnoremap <leader>w :w<CR>
nnoremap <leader>q :q!<CR>
nnoremap <leader>s :wq<CR>
nnoremap <leader>e :w<CR>:Ex<CR>


" Ctrl+Backspace borra la palabra anterior en Insert Mode
inoremap <C-Backspace> <C-W>

" Abrir terminal en el directorio del archivo actual
nnoremap <leader>t :term<CR>


"ctrl z
nnoremap <C-z> u
inoremap <C-z> <Esc>ui
"ctrl z

let &t_SI = "\e[6 q"   
let &t_EI = "\e[2 q"  

inoremap jk <Esc>
set clipboard=unnamedplus



" Usar vim-plug
call plug#begin('~/.vim/plugged')

" Syntax C/C++
Plug 'bfrg/vim-c-cpp-modern'
" Autocompletion potente
Plug 'ycm-core/YouCompleteMe'

" Themes
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'rafi/awesome-vim-colorschemes'
"ESTO DE ARRIBA NO LOS USOXD

"Pairs
Plug 'jiangmiao/auto-pairs'

call plug#end()

" Opciones útiles
syntax on
filetype plugin indent on
set termguicolors

" YouCompleteMe settings
let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_key_list_select_completion = ['<Tab>']
let g:ycm_key_list_previous_completion = ['<S-Tab>']
let g:ycm_confirm_extra_conf = 0
let g:ycm_max_num_candidates_displayed = 4

let g:ycm_semantic_triggers = {
  \ 'c,cpp': ['re!\w{2}']
  \ }

let g:ycm_key_list_stop_completion = ['<C-y>', '<CR>']
let g:ycm_auto_trigger = 1
"enter
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"


"QUITAR DIAGNOSTICOS DE COMPLETEME
"QUITAR DIAGNOSTICOS DE COMPLETEME
"
"let g:ycm_always_populate_location_list = 1
"let g:ycm_show_diagnostics_ui = 0

"QUITAR DIAGNOSTICOS DE COMPLETEME
"QUITAR DIAGNOSTICOS DE COMPLETEME


set completeopt=menu,menuone,noinsert,noselect
set pumheight=4

"auto-pairsconfig
let g:AutoPairsMapBS = 1
let g:AutoPairsMapCR = 1

colorscheme torte




" Guardar y restaurar posición del cursor al abrir un archivo
if has("autocmd")
  au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   exe "normal! g`\"" |
        \ endif
endif



"EXPLORER
"EXPLORER
"EXPLORER
"(new file con nf y new directory con nd)
"(new file con nf y new directory con nd)
" Mapear nf para crear un nuevo archivo en netrw
" Mapear nf y nd en netrw
autocmd FileType netrw nnoremap <buffer> nf :call NetrwCreateFile()<CR>
autocmd FileType netrw nnoremap <buffer> nd :call NetrwCreateDirectory()<CR>

" Crear archivo en el directorio actual de netrw
function! NetrwCreateFile()
    let l:dir = expand('%:p:h')   " directorio actual del netrw
    let l:file = input('New file: ')
    if !empty(l:file)
        execute 'edit' fnameescape(l:dir . '/' . l:file)
    endif
endfunction

" Crear directorio en el directorio actual de netrw
function! NetrwCreateDirectory()
    let l:dir = expand('%:p:h')   " directorio actual del netrw
    let l:newdir = input('New directory: ')
    if !empty(l:newdir)
        call mkdir(l:dir . '/' . l:newdir, 'p')
        execute 'Explore'
    endif
endfunction
"EXPLORER
"EXPLORER
"EXPLORER
