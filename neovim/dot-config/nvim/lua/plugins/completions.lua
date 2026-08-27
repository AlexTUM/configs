-- Completions and snippet engine. Responsible for the popup that suggests the completions
-- The completions themselves come from snippet engines or even lsp servers.
-- Requires: catppuccin defining colorschemes referenced here
-- Defines keybinds in plugin setup

local function setup_cmp()
    local cmp = require("cmp")
    local luasnip = require("luasnip")

    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
        snippet = {
            expand = function(args)
                luasnip.lsp_expand(args.body)
            end,
        },

        window = {
            completion = cmp.config.window.bordered({
                border = "rounded",
                winhighlight = table.concat({
                    "Normal:CmpPmenu",
                    "FloatBorder:CmpPmenuBorder",
                    "CursorLine:CmpSel",
                    "Search:None",
                }, ","),
            }),

            documentation = cmp.config.window.bordered({
                border = "rounded",
                winhighlight = table.concat({
                    "Normal:CmpPmenu",
                    "FloatBorder:CmpPmenuBorder",
                }, ","),
            }),
        },

        mapping = cmp.mapping.preset.insert({
            ["<C-b>"] = cmp.mapping.scroll_docs(-4, { desc = "Scroll up in completions doc", }),
            ["<C-f>"] = cmp.mapping.scroll_docs(4, { desc = "Scroll down in completions doc", }),
            ["<C-Space>"] = cmp.mapping.complete({ desc = "Trigger completions dialogue", }),
            ["<C-e>"] = cmp.mapping.abort({ desc = "Abort completion", }),
            ["<CR>"] = cmp.mapping.confirm({
                select = false,
                desc = "Confirm current selection of completions",
            }),
        }),

        sources = cmp.config.sources({
            { name = "nvim_lsp" },
            { name = "luasnip" },
        }, {
            { name = "buffer" },
        }),
    })

    local cmp_autopairs = require("nvim-autopairs.completion.cmp")

    cmp.event:on(
        "confirm_done",
        cmp_autopairs.on_confirm_done()
    )
end

return {
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "windwp/nvim-autopairs",
        },
        config = setup_cmp,
    },
}
