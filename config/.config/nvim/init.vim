call plug#begin()
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
Plug 'mhinz/vim-startify' 
Plug 'vimwiki/vimwiki'
Plug 'RRethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'ghifarit53/tokyonight-vim'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-surround'
Plug 'vwxyutarooo/nerdtree-devicons-syntax'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'scrooloose/nerdtree'
Plug 'vim-airline/vim-airline'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'

Plug 'vwxyutarooo/nerdtree-devicons-syntax'
call plug#end()

let g:airline_powerline_fonts = 1

set nocompatible
set ttyfast

" Support 24-bit color
execute "set t_8f=\e[38;2;%lu;%lu;%lum"
execute "set t_8b=\e[48;2;%lu;%lu;%lum"
if (has("termguicolors"))
	set termguicolors
endif

let g:NERDCompactSexyComs = 1
let g:NERDTreeShowHidden=1

let g:tokyonight_style = 'night' " available: night, storm

let g:vimwiki_list = [{'path': '~/Documents/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

let g:Hexokinase_highlighters = ['virtual']
set number
set relativenumber

colorscheme tokyonight
                           


" open new split panes to right and below
set splitright
set splitbelow

let mapleader = ","

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

let s:startify_ascii_header = [
 \ '		       ___       ___       ___       ___       ___       ___   ',
 \ '	        /\__\     /\  \     /\  \     /\__\     /\  \     /\__\  ',
 \ '         /:| _|_   /::\  \   /::\  \   /:/ _/_   _\:\  \   /::L_L_ ',
 \ '        /::|/\__\ /::\:\__\ /:/\:\__\ |::L/\__\ /\/::\__\ /:/L:\__\',
 \ '        \/|::/  / \:\:\/  / \:\/:/  / |::::/  / \::/\/__/ \/_/:/  /',
 \ ' 	        |:/  /   \:\/  /   \::/  /   L;;/__/   \:\__\     /:/  / ',
 \ '          \/__/     \/__/     \/__/               \/__/     \/__/  ',
 \ '',
\]
let g:startify_custom_header = s:startify_ascii_header
      

let base16colorspace=256
