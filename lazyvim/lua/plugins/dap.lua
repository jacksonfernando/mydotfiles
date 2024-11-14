return {
  "mfussenegger/nvim-dap",
  recommended = true,
  desc = "Debugging support. Requires language specific adapters to be configured. (see lang extras)",

  dependencies = {
    "leoluz/nvim-dap-go",
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "nvim-neotest/nvim-nio",
  },

  -- stylua: ignore
  keys = {
    { "<leader>d", "", desc = "+debug", mode = {"n", "v"} },
    { "<leader>dB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>db", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>dc", function() require("dap").continue() end, desc = "Run/Continue" },
    { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>dC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>dg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>di", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>dj", function() require("dap").down() end, desc = "Down" },
    { "<leader>dk", function() require("dap").up() end, desc = "Up" },
    { "<leader>dl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>do", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>dO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>dp", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>dr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>ds", function() require("dap").session() end, desc = "Session" },
    { "<leader>dt", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>dw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    local dap = require("dap")
    local ui = require("dapui")
    require("dapui").setup()
    require("dap-go").setup()

    local myenv = {
      SERVICE_CONF = vim.fn.getcwd() .. "/config_files/service-conf.json", -- current path + relative path
      SECRET_CONF = vim.fn.getcwd() .. "/vault/secrets/",
      SERVICE_NAME = "pl-api",
      ALL_DEPRECATED_INITS_MIGRATED = "true",
      MYSQL_HOST = "localhost",
      MYSQL_USER = "root",
      DB_NAME = "pl_api",
      MYSQL_PASSWORD = "",
      REDIS_URL = "127.0.0.1:7001",
      REDIS_PASSWORD = "",
      URL_MONOLITHIC_ENDPOINT_SERVICE = "http://10.163.78.39:8206",
      URL_FINTRUST_GATEWAY_SERVICE = "https://backend-apps.dev.idbank-int.net/fintrust-gateway",
      USERNAME_MONOLITHIC_ENDPOINT_SERVICE = "sysadmin",
      PASSWORD_MONOLITHIC_ENDPOINT_SERVICE = "Superuser2",
    }

    dap.configurations.go = {
      {
        type = "go",
        name = "Debug (Launch)",
        request = "launch",
        program = "${workspaceFolder}/cmd/pl-api/main.go", -- Adjust the path to point to your main.go file
        env = myenv,
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      ui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      ui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      ui.close()
    end

    -- setup dap config by VsCode launch.json file
    local vscode = require("dap.ext.vscode")
    local json = require("plenary.json")
    vscode.json_decode = function(str)
      return vim.json.decode(json.json_strip_comments(str))
    end
  end,
}
