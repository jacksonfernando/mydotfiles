call plug#begin()
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'tpope/vim-fugitive'
	Plug 'vim-airline/vim-airline'
	Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

syntax on
set t_Co=256
set cursorline
colorscheme onehalfdark
let g:airline_theme='onehalfdark'

highlight Normal guibg=none

let mapleader = " "

fun! TrimWhitespace()
	let l:save = winsaveview()
	keeppatterns %s/\s\+$//e
	call winrestview(l:save)
endfun

augroup JACKSON
	autocmd!
	autocmd BufWritePre * :call TrimWhitespace()
augroup END

map <leader>pv :Vexplore<CR>
map <leader>h :wincmd h<CR>
map <leader>j :wincmd j<CR>
map <leader>l :wincmd l<CR>
nnoremap <leader>= :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

set clipboard+=unnamedplus
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy
nnoremap <leader>p "+p
nnoremap <leader>P "+P
