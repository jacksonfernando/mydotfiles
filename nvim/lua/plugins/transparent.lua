return {
    "xiyaowong/transparent.nvim",
    config = function()
        require("transparent").setup({
            extra_groups = {
                "BufferLineTabClose",
                "BufferlineBufferSelected",
                "BufferLineFill",
                "BufferLineBackground",
                "BufferLineSeparator",
                "BufferLineIndicatorSelected",
            },
            exclude_groups = {},
        })
        require('transparent').clear_prefix('BufferLine')
        require('transparent').clear_prefix('NeoTree')
    end

}
