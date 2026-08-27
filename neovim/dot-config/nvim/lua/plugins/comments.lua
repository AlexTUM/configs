-- commenting shortcuts and coloring
-- comment.nvim comes with default keybinds

local function setup_bc()
	local bc = require("better-comment")
    local colors = require("catppuccin.palettes").get_palette("macchiato")

	bc.Setup({
		tags = {
			{
				name = "TODO",
				fg = colors.peach,
				bg = "",
				bold = true,
				virtual_text = "",
			},
			{
				name = "FIXME",
				fg = colors.red,
				bg = "",
				bold = true,
				virtual_text = "",
			},
			{
				name = "?",
				fg = colors.yellow,
				bg = "",
				bold = false,
				virtual_text = "(Check later)",
			},
		},
	})
end

return {
    -- toggle comments or insert comments at certain points
	{
		"numToStr/Comment.nvim",
        event = "VeryLazy",
		config = true,
	},
    -- special formatting for comments with keywords
	{
		"Djancyp/better-comments.nvim",
        event = "VeryLazy",
        dependencies = {
            "catppuccin/nvim",
        },
		config = setup_bc,
	},
}
