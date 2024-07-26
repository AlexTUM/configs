function Basic_setup_pasta()
    vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mapping').p)
    vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mapping').P)
end

return {
    "hrsh7th/nvim-pasta",
    config = Basic_setup_pasta,
}
