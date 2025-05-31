return {
    {
        'mfussenegger/nvim-jdtls',
        ft = { 'java' },
        dependencies = {
            'williamboman/mason.nvim',
            'mfussenegger/nvim-dap'
        },
        ft = { 'java' }, -- Ensures it only loads for Java files
        config = function()
            local jdtls = require('jdtls')

            local root_markers = { 'gradlew', '.git', 'mvnw' }
            local root_dir = vim.fs.dirname(vim.fs.find(root_markers, { upward = true })[1])

            if root_dir == nil then
                print("nvim-jdtls: Could not find project root.")
                return
            end

            local config = {
                cmd = { vim.fn.stdpath("data") .. "/mason/bin/jdtls" },
                root_dir = root_dir,
            }

            jdtls.start_or_attach(config)
        end,
    }
}
