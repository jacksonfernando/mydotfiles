local highlight_group = vim.api.nvim_create_augroup(
    "highlight_yank", { clear = true }
)

-- autocmd to highlight yank lines
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
    group = highlight_group
})

-- autocmd to make javasript file indent to 2 spaces
vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
})

-- autocmd for json files
-- TODO: refactor this with the javscript pattern
vim.api.nvim_create_autocmd("FileType", {
    pattern = "json",
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
})

-- autocmd to delete trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
        vim.lsp.buf.format()
    end,
})
