return {
    {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = { "mason.nvim", "mfussenegger/nvim-dap" },
        cmd = { "DapInstall", "DapUninstall" },
        ensure_installed = { "delve", "codelldb" }, -- Specify the debuggers to be installed by mason
        config = function()
            require("mason-nvim-dap").setup()
        end,
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "VeryLazy",
        dependencies = { "nvim-neotest/nvim-nio", "mfussenegger/nvim-dap" },
    },
    {
        "mfussenegger/nvim-dap",
        recommended = true,
        dependencies = {
            {
                "theHamsta/nvim-dap-virtual-text",
                opts = {},
            },
            { "leoluz/nvim-dap-go" }
        },
        config = function()
            local dap = require("dap")
            require('dap-go').setup({
                delve = {
                    build_flags = "-tags=unit,integration,e2e",
                },
            })
            require('dap.ext.vscode').load_launchjs(nil, {})


            dap.adapters.codelldb = {
                type = "server",
                port = 13000,
                executable = {
                    command = "codelldb", -- Path to codelldb executable
                    args = { "--port", "13000" },
                },
            }

            dap.configurations.cpp = {
                {
                    name = "Launch file",
                    type = "codelldb", -- This should match the adapter
                    request = "launch",
                    program = function()
                        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                    end,
                    cwd = "${workspaceFolder}",
                    stopAtEntry = false,
                    args = {}, -- You can pass any arguments to the executable here
                },
            }

            dap.configurations.c = dap.configurations.cpp
            local dapui = require("dapui")
            dapui.setup()
            dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open({})
            end
            dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close({})
            end
            dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close({})
            end
        end
    }
}
