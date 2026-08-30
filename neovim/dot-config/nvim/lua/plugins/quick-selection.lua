-- auto select treesitter nodes and expand/shrink selection by nodes
-- keybinds: <CR> to start selecting/exapnding, <BS> to shrink selection

return {
    "sustech-data/wildfire.nvim",
    event = "VeryLazy",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    opts = {
        filetype_exclude = {
        "qf",
        "help",
        "terminal",
      },
    },
}
