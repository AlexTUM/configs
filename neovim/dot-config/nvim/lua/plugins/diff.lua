return {
    {
        "dlyongemallo/diffview-plus.nvim",
        cmd = {
            "DiffviewOpen",
            "DiffviewToggle",
            "DiffviewClose",
            "DiffviewFileHistory",
            "DiffviewDiffFiles",
            "DiffviewLog",
        },
        dependencies = {
            "nvim-tree/nvim-web-devicons",
        },
        keys = {
            {
                "<leader>ut",
                "<cmd>DiffviewToggle<cr>",
                mode = "n",
                desc = "Toggle Diffview",
            },
            {
                "<leader>uo",
                "<cmd>DiffviewOpen<cr>",
                mode = "n",
                desc = "Open Diffview",
            },
            {
                "<leader>uh",
                "<cmd>DiffviewFileHistory %<cr>",
                mode = "n",
                desc = "File history",
            },
            {
                "<leader>uc",
                "<cmd>DiffviewClose<cr>",
                mode = "n",
                desc = "Close Diffview",
            },
        },
        opts = {
            enhanced_diff_hl = true,
            use_icons = true,
            view = {
                default = {
                    layout = "diff2_horizontal",
                    winbar_info = true,
                },
                merge_tool = {
                    layout = "diff3_horizontal",
                    disable_diagnostics = true,
                },
            },
            file_panel = {
                listing_style = "tree",
                win_config = {
                    position = "left",
                    width = 35,
                },
                log_options = {
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                },
            },
            file_history_panel = {
                log_options = {
                    git = {
                        single_file = {
                            diff_merges = "combined",
                        },
                        multi_file = {
                            diff_merges = "first-parent",
                        },
                    },
                },
            },
            default_args = {
                DiffviewOpen = {},
                DiffviewFileHistory = {},
            },
            hooks = {},
        },
    },
}
