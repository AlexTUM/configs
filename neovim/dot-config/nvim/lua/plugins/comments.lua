function Basic_setup_bc()
	local bc = require("better-comment")

	bc.Setup({
		tags = {
			{
				name = "TODO",
				fg = "white",
				bg = "#8c24ee",
				bold = true,
				virtual_text = "",
			},
			{
				name = "FIX",
				fg = "white",
				bg = "#f44747",
				bold = true,
				virtual_text = "Critical",
			},
			{
				name = "?",
				fg = "#24c3ee",
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
		config = true,
	},
    -- special formatting for comments with keywords
	{
		"Djancyp/better-comments.nvim",
		config = Basic_setup_bc,
	},
}
