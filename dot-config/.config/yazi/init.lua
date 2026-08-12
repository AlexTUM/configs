require("full-border"):setup()

require("git"):setup {
    order = 1500,
}

require("yafg"):setup({
    editor = "nvim",
})

if os.getenv("NVIM") then
    require("toggle-pane"):entry("min-preview")
end
