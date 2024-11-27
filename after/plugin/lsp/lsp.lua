local lsp = require("lsp-zero")
lsp.extend_lspconfig()

lsp.preset({
    float_border = 'rounded',
    configure_diagnostics = true,
    setup_servers_on_start = true,
    set_lsp_keymaps = false,
    manage_nvim_cmp = true,
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "I", vim.lsp.buf.hover, opts)
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
    vim.keymap.set("n", "ge", vim.diagnostic.open_float, opts)
end)

lsp.setup()
