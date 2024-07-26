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
	{
		"numToStr/Comment.nvim",
		config = true,
	},
	{
		"Djancyp/better-comments.nvim",
		config = Basic_setup_bc,
	},
}
