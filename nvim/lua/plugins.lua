require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use 'vim-test/vim-test'
  use 'nvim-lua/popup.nvim'
	use 'nvim-lua/plenary.nvim'
	use 'tpope/vim-fugitive'
	use 'vim-airline/vim-airline'
	use 'neovim/nvim-lspconfig'
  use 'dart-lang/dart-vim-plugin'
  use 'thosakwe/vim-flutter'
	use 'ful1e5/onedark.nvim'
	use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
	use {'nvim-telescope/telescope.nvim', config = function() require('configs/telescope') end}
	use {'nvim-treesitter/nvim-treesitter', config = function() require('configs/treesitter') end}
	use {'williamboman/nvim-lsp-installer', config = function() require('configs/lsp_installer') end}
  use {'kyazdani42/nvim-tree.lua', config = function() require('configs/filetree') end}
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			{"hrsh7th/cmp-nvim-lsp"}, {"hrsh7th/cmp-buffer"}, {"hrsh7th/cmp-path"},
			{"hrsh7th/cmp-cmdline"}, {"hrsh7th/cmp-vsnip"},
			{"f3fora/cmp-spell", {"hrsh7th/cmp-calc"}, {"hrsh7th/cmp-emoji"}, {'hrsh7th/vim-vsnip'}}
		},
		config = function() require('configs/cmp') end
	}
end)
