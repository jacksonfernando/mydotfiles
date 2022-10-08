local highlight_group = vim.api.nvim_create_augroup(
    "highlight_yank", { clear = true }
)

vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 500 })
    end,
    group = highlight_group
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "javascript",
    callback = function()
        vim.opt.shiftwidth = 2
        vim.opt.softtabstop = 0
        vim.opt.tabstop = 2
    end,
})
