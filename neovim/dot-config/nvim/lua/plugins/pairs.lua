return {
    -- Standard config of surround is sensible
    -- pairs around motions
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = true,
	},
    -- Standard config
    -- create closing pairs
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
}
