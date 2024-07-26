function Basic_setup_web()
    local web = require("websearch")

    web.setup({
        search_key = "<leader>ws",
        search_url = "https://duckduckgo.com/?q=",
    })
end

return {
    "ulf-westermann/websearch.nvim",
    config = Basic_setup_web,
}
