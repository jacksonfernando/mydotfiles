local lsp_installer = require("nvim-lsp-installer")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lsp_installer.on_server_ready(function(server)
  local opts = {settings = {capabilities = capabilities}}
  if server.name == "sumneko_lua" then
		opts = {
			settings = {
				Lua = {
					diagnostics = {
            globals = { 'vim', 'use' }
          },
        },
        capabilities = capabilities
      }
	}
  end
  server:setup(opts)
end)
