require 'nvim-treesitter.configs'.setup {
    ensure_installed = 'all',
    ignore_install = { 'phpdoc' },
    highlight = { -- enable highlighting
        enable = true,
    },
    indent = {
        enable = true, -- default is disabled anyways
    }
}
