-- Other utils: Lorem Ipsum for random text fillers

local function setup_ipsum()
	require("lorem").opts({
		sentenceLength = "medium",
		comma_chance = 0.2,
		max_commas_per_sentence = 2,
	})
end

return {
	{
		"derektata/lorem.nvim",
		config = setup_ipsum,
	},
}
