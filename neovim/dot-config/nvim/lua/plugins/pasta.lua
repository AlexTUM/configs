function Basic_setup_pasta()
    vim.keymap.set({ 'n', 'x' }, 'p', require('pasta.mapping').p, { desc = 'Pasta after' })
    vim.keymap.set({ 'n', 'x' }, 'P', require('pasta.mapping').P, { desc = 'Pasta before' })
end

return {
    "hrsh7th/nvim-pasta",
    config = Basic_setup_pasta,
}
