-- search web in visual mode: highlighted section as query
-- keybind to search selected text in browser

return {
    "KaitoMuraoka/websearcher.nvim",

    keys = {
        {
            "<leader>w",
            function()
                require("websearcher").search_selected()
            end,
            mode = "v",
            desc = "Search selected text with DuckDuckGo",
        },
    },

    opts = {
        open_cmd = "firefox",
        search_engine = "DuckDuckGo",
    },
}

