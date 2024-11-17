return {
    'nvim-neo-tree/neo-tree.nvim',
    cmd = 'Neotree',
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    init = function()
        vim.api.nvim_create_autocmd('BufEnter', {
            -- make a group to be able to delete it later
            group = vim.api.nvim_create_augroup('NeoTreeInit', { clear = true }),
            callback = function()
                local f = vim.fn.expand('%:p')
                if vim.fn.isdirectory(f) ~= 0 then
                    vim.cmd('Neotree current dir=' .. f)
                    -- neo-tree is loaded now, delete the init autocmd
                    vim.api.nvim_clear_autocmds { group = 'NeoTreeInit' }
                end
            end
        })
        -- keymaps
    end,
    opts = {
        filesystem = {
            hijack_netrw_behavior = 'open_current'
        }
    }

}
