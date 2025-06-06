local map = vim.api.nvim_set_keymap
local options = { noremap = true }
-- nvim tree
map('n', '<leader>te', ':ToggleTerm<cr>', options)
map('n', '<leader>ve', ':vertical sb<cr>', options)
map('n', '<leader>pv', ':Neotree<cr>', options)
map('n', '<leader>h', ':wincmd h<cr>', options)
map('n', '<leader>j', ':wincmd j<cr>', options)
map('n', '<leader>k', ':wincmd k<cr>', options)
map('n', '<leader>l', ':wincmd l<cr>', options)
map('n', '<leader>=', ':vertical resize +5<cr>', options)
map('n', '<leader>-', ':vertical resize -5<cr>', options)
map('n', '<leader>0', ':horizontal resize +5<cr>', options)
map('n', '<leader>9', ':horizontal resize -5<cr>', options)
-- telescope
map('n', '<leader>ff', ':Telescope find_files<cr>', options)
map('n', '<leader>fg', ':Telescope live_grep<cr>', options)
map('n', '<leader>fb', ':Telescope buffers<cr>', options)
map('n', '<leader>fh', ':Telescope help_tags<cr>', options)
--vim fugitive
map('n', '<leader>gs', ':G<cr>', options)
map('n', '<leader>gh', ':diffget //2<cr>', options)
map('n', '<leader>gl', ':diffget //3<cr>', options)
-- neotest
map('n', '<leader>tt', ':lua require("neotest").run.run()<cr>', options)
map('n', '<leader>to', ':lua require("neotest").output.open({ enter = true })<cr>', options)
map('n', '<leader>ta', ':lua require("neotest").run.run(vim.fn.expand("%"))<cr>', options)
map('n', '<leader>td', ':lua require("dap-go").debug_test()<cr>', options)
-- bufferline
map('n', '<leader>bc', ':BufferLinePickClose<cr>', options)
map('n', '<leader>bp', ':BufferLinePick<cr>', options)
map('n', '[[', ':BufferLineCycleNext<cr>', options)
map('n', ']]', ':BufferLineCyclePrev<cr>', options)
-- snippets
map('i', "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", options)
map('s', "<c-l>", "<cmd>lua require'luasnip'.jump(1)<CR>", options)
map('s', "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", options)
map('s', "<c-h>", "<cmd>lua require'luasnip'.jump(-1)<CR>", options)
-- dap
map("n", "<leader>dc", "<cmd>lua require'dap'.continue()<CR>", { noremap = true, silent = true })
map("n", "<leader>db", "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = true, silent = true })
map("n", "<leader>di", "<cmd>lua require'dap'.step_into()<CR>", { noremap = true, silent = true })
map("n", "<leader>do", "<cmd>lua require'dap'.step_out()<CR>", { noremap = true, silent = true })
map("n", "<leader>dl", "<cmd>lua require'dap'.step_over()<CR>", { noremap = true, silent = true })
map("n", "<leader>dcl", "<cmd>lua require'dap'.disconnect()<CR><cmd>lua require'dap'.close()<CR>",
    { noremap = true, silent = true })
-- dap ui
map("n", "<leader>du", "<cmd>lua require'dapui'.toggle({})<CR>", { noremap = true, silent = true })
map("n", "<leader>de", "<cmd>lua require'dapui'.eval({})<CR>", { noremap = true, silent = true })
-- diagnostics
map('n', '[[', ':BufferLineCycleNext<cr>', options)
map('n', '[d', "<cmd>lua vim.diagnostic.goto_prev()<CR>", options)
map('n', ']gd', "<cmd>lua vim.diagnostic.goto_next()<CR>", options)
-- grapple
map('n', "<leader>a", "<cmd>lua require'grapple'.toggle()<cr>", options)
map('n', "<C-e>", "<cmd>lua require'grapple'.toggle_tags()<cr>", options)
map('n', "<leader>1", "<cmd>Grapple select index=1<cr>", options)
map('n', "<leader>2", "<cmd>Grapple select index=2<cr>", options)
map('n', "<leader>3", "<cmd>Grapple select index=3<cr>", options)
map('n', "<leader>4", "<cmd>Grapple select index=4<cr>", options)
map('n', "<leader>5", "<cmd>Grapple select index=5<cr>", options)
map('n', "<leader>6", "<cmd>Grapple select index=6<cr>", options)
map('n', "<leader>7", "<cmd>Grapple select index=7<cr>", options)
map('n', "<leader>8", "<cmd>Grapple select index=8<cr>", options)
-- vim dadbob
map('n', "<leader>dbi", "<cmd>DBUIToggle<cr>", options)
