call plug#begin()
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'ryanoasis/vim-devicons'
Plug 'sheerun/vim-polyglot'

call plug#end()


set nocompatible               " No neovim ja vem como padrão deixei para config de plugins
syntax enable                  " Desativa destaque de sintaxe
set hidden                     " Esconde o buffer atual quando um novo arquivo é aberto
set number                     " Ativar números de linha
set relativenumber             " Cada linha em seu arquivo é numerada em relação à sua posição atual
set mouse=a                    " Ativar suporte a mouse
set fileencodings=utf-8        " Altera a codificação de saída do arquivo escrito
set encoding=utf-8             " Altera a codificação de saída mostrada no terminal.
set title                      " Exibe o titulo do arquivo no terminal
set autoindent                 " Auto indentação
set nobackup                   " Nenhum arquivo de backup
set hlsearch                   " Destaca correspondências de pesquisa
set incsearch                  " Pesquisa incremental
set showcmd                    " Mostrar os comandos que você digita no arquivo
set smarttab                   " Insere tabulações no início de uma linha de acordo com a largura do deslocamento
set cmdheight=1                " Da mais espaço para exibir mensagens
set laststatus=1
set scrolloff=10               " Número mínimo de linhas a manter acima e abaixo do cursor
set ignorecase                 " Ignora case de busca
filetype plugin indent on      " Carrega o arquivo de recuo para o tipo de arquivo, se houver
set tabstop=2                  " Mostra a guia existente com 2 espaços de largura
set shiftwidth=2               " Ao recuar com '>', usa 2 espaços de largura
set expandtab                  " Ao pressionar tab, insire 2 espaços
set ai                         " Auto indentação
set si                         " Recuo inteligente
set nowrap                     " Sem quebra de linhas
set backspace=start,eol,indent " Opções de retrocesso


" Functions and autocmds to run whenever changing colorschemes
function! TransparentBackground()
    highlight Normal guibg=NONE ctermbg=NONE
    highlight LineNr guibg=NONE ctermbg=NONE
    set fillchars+=vert:\│
    highlight VertSplit gui=NONE guibg=NONE guifg=#444444 cterm=NONE ctermbg=NONE ctermfg=gray
endfunction

function! DraculaPMenu()
    highlight Pmenu guibg=#363948
    highlight PmenuSbar guibg=#363948
endfunction

augroup MyColors
    autocmd!
    autocmd ColorScheme dracula call DraculaPMenu()
    autocmd ColorScheme * call TransparentBackground() 

syntax on
color dracula

set termguicolors




let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = ' %{strftime("%-I:%M %p")}'
let g:airline_section_warning = ''





""" Custom Functions

" Trim Whitespaces
function! TrimWhitespace()
    let l:save = winsaveview()
    %s/\\\@<!\s\+$//e
    call winrestview(l:save)
endfunction

" Dracula Mode (Dark)
function! ColorDracula()
    let g:airline_theme='dracula'
    color dracula
endfunction

" Seoul256 Mode (Dark & Light)
function! ColorSeoul256()
    let g:airline_theme='silver'
    color seoul256
endfunction

" Forgotten Mode (Light)
function! ColorForgotten()
    " Other light airline themes: tomorrow, silver, alduin
    let g:airline_theme='tomorrow'
    " Other light colors: forgotten-light, nemo-light
    color forgotten-light
endfunction

" Zazen Mode (Black & White)
function! ColorZazen()
    let g:airline_theme='minimalist'
    color zazen
endfunction
