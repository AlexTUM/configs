function Basic_setup_sessions()

    -- load the session for the current directory
    vim.keymap.set("n", "<leader>qs", function() require("persistence").load() end, { desc="Load session for cwd" })

    -- select a session to load
    vim.keymap.set("n", "<leader>qS", function() require("persistence").select() end, { desc="Select a session to load" })

    -- load the last session
    vim.keymap.set("n", "<leader>ql", function() require("persistence").load({ last = true }) end, { desc="Load last session" })

    -- stop Persistence => session won't be saved on exit
    vim.keymap.set("n", "<leader>qd", function() require("persistence").stop() end, { desc="Stop auto save for sessions" })

end

return {
   "folke/persistence.nvim",
    event = "BufReadPre",
    config = Basic_setup_sessions,
}
