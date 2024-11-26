local map = vim.api.nvim_set_keymap
local options = { noremap = true, silent = true }

local last_size = {}

function ToggleMaximizeWindow()
    local current_win = vim.api.nvim_get_current_win()

    -- Check if the current window is already maximized
    if last_size[current_win] then
        -- Restore the previous size
        vim.api.nvim_win_set_height(current_win, last_size[current_win].height)
        vim.api.nvim_win_set_width(current_win, last_size[current_win].width)
        last_size[current_win] = nil
    else
        -- Save the current size before maximizing
        last_size[current_win] = {
            height = vim.api.nvim_win_get_height(current_win),
            width = vim.api.nvim_win_get_width(current_win)
        }
        -- Maximize the current window (full height and width)
        vim.api.nvim_win_set_height(current_win, vim.o.lines - 1) -- full height
        vim.api.nvim_win_set_width(current_win, vim.o.columns)    -- full width
    end
end

map('n', '<leader>m', ':lua ToggleMaximizeWindow()<CR>', options)
