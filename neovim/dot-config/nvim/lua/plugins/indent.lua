-- Indents are marked with vertical bars

local function setup_indentmini()
    require("indentmini").setup()
    local palette = require("catppuccin.palettes").get_palette("macchiato")

    vim.api.nvim_set_hl(0, "IndentLine", {
      fg = palette.surface1,
    })
end

return {
    {
        "nvimdev/indentmini.nvim",
        dependencies = {
            "catppuccin/nvim",
            name = "catppuccin",
        },
        config = setup_indentmini,
    }
}
