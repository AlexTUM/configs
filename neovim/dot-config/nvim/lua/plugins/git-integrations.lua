-- plugins for integrating

return {
    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        opts = {
            -- Signs shown in the sign column
            signs = {
                add = {
                    text = "│",
                },
                change = {
                    text = "│",
                },
                delete = {
                    text = "_",
                },
                topdelete = {
                    text = "‾",
                },
                changedelete = {
                    text = "~",
                },
                untracked = {
                    text = "┆",
                },
            },

            -- Show signs for untracked files
            attach_to_untracked = false,

            -- Highlight changed lines in the sign column
            signcolumn = true,

            -- Highlight added, changed, and deleted lines directly
            linehl = false,

            -- Highlight added, changed, and deleted line numbers
            numhl = false,

            -- Show changes word-by-word rather than only line-by-line
            word_diff = false,

            -- How frequently Git changes are checked, in milliseconds
            update_debounce = 100,

            -- How frequently the current line blame is updated
            current_line_blame = true,

            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol", -- "eol", "overlay", or "right_align"
                delay = 1000,
                ignore_whitespace = false,
            },

            -- Key mappings are installed only for buffers attached to Git
            on_attach = function(bufnr)
                local gitsigns = require("gitsigns")

                local function map(mode, lhs, rhs, desc)
                    vim.keymap.set(mode, lhs, rhs, {
                        buffer = bufnr,
                        silent = true,
                        desc = "GitSigns: " .. desc,
                    })
                end

                -- Navigation
                map("n", "hn", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "hn", bang = true })
                    else
                        gitsigns.nav_hunk("next")
                    end
                end, "Next hunk")

                map("n", "hp", function()
                    if vim.wo.diff then
                        vim.cmd.normal({ "hp", bang = true })
                    else
                        gitsigns.nav_hunk("prev")
                    end
                end, "Previous hunk")

                -- Hunk actions
                map("n", "<leader>hs", gitsigns.stage_hunk, "Stage hunk")
                map("n", "<leader>hr", gitsigns.reset_hunk, "Reset hunk")
                map("v", "<leader>hs", function()
                    gitsigns.stage_hunk({
                        vim.fn.line("."),
                        vim.fn.line("v"),
                    })
                end, "Stage selected hunk")
                map("v", "<leader>hr", function()
                    gitsigns.reset_hunk({
                        vim.fn.line("."),
                        vim.fn.line("v"),
                    })
                end, "Reset selected hunk")

                -- Buffer/file actions
                map("n", "<leader>hS", gitsigns.stage_buffer, "Stage buffer")
                map("n", "<leader>hu", gitsigns.undo_stage_hunk, "Undo stage hunk")
                map("n", "<leader>hR", gitsigns.reset_buffer, "Reset buffer")

                -- Inspect changes
                map("n", "<leader>hp", gitsigns.preview_hunk, "Preview hunk")
                map("n", "<leader>hb", function()
                    gitsigns.blame_line({ full = true })
                end, "Blame line")
                map("n", "<leader>hd", gitsigns.diffthis, "Diff buffer")
                map("n", "<leader>hD", function()
                    gitsigns.diffthis("~")
                end, "Diff against parent")

                -- Toggle features
                -- map("n", "<leader>tb", gitsigns.toggle_current_line_blame, "Toggle line blame")
                map("n", "<leader>td", gitsigns.toggle_word_diff, "Toggle word diff")
                map("n", "<leader>tn", gitsigns.toggle_numhl, "Toggle number highlights")
                map("n", "<leader>tl", gitsigns.toggle_linehl, "Toggle line highlights")
                map("n", "<leader>ts", gitsigns.toggle_signs, "Toggle signs")
            end,
        },
    },
}
