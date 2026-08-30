-- better pasting: cycle through last yanks, auto indent
-- keymaps for next and previous yank and for changing indentation

local function setup_pasta()
    local pasta = require("pasta")
    local mapping = require("pasta.mapping")
    vim.keymap.set({ 'n', 'x' }, 'p', mapping.p, { desc = 'Pasta after' })
    vim.keymap.set({ 'n', 'x' }, 'P', mapping.P, { desc = 'Pasta before' })

    pasta.config.next_key = vim.keycode("<C-o>")
    pasta.config.prev_key = vim.keycode("<C-p>")
    pasta.config.indent_key = vim.keycode(",")
    pasta.config.indent_fix = true
end

return {
    "hrsh7th/nvim-pasta",
    config = setup_pasta,
}
