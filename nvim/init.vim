call plug#begin()
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'gruvbox-community/gruvbox'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

colorscheme gruvbox
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
