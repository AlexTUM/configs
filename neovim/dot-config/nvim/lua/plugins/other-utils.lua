function Basic_setup_ipsum()
	require("lorem").opts({
		sentenceLength = "medium",
		comma_chance = 0.2,
		max_commas_per_sentence = 2,
	})
end

return {
	{
		"derektata/lorem.nvim",
		config = Basic_setup_ipsum,
	},
    {
        "nvimdev/indentmini.nvim",
        config = true,
    }
}
