local clip = '/mnt/c/Windows/System32/clip.exe'

local highlight_group = vim.api.nvim_create_augroup(
    "highlight_yank", { clear = true }
)

-- autocmd to highlight yank lines
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
        if vim.v.event.operator == 'y' then
            vim.fn.system(clip, vim.fn.getreg('"'))
        end
    end,
    group = highlight_group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = { "json", "javascript" },
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.tabstop = 2
    end,
})

-- autocmd to delete trailing whitespace
vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = { "*" },
    callback = function()
        vim.cmd([[%s/\s\+$//e]])
        vim.lsp.buf.format()
    end,
})
