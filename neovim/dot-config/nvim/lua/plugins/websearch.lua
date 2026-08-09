-- search web in visual mode: highlighted section as query
function Basic_setup_web()
    local web = require("websearch")

    web.setup({
        search_key = "<leader>w",
        search_url = "https://duckduckgo.com/?q=",
        browser = "firefox",
    })
end

return {
    "ulf-westermann/websearch.nvim",
    config = Basic_setup_web,
    lazy = false,
}
