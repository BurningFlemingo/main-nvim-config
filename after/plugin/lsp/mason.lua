local lsp = require("lsp-zero")
local lspconfig = require('lspconfig')

local lsp_servers = {
    "clangd",
    "ltex"
}

local clangdSettings = {
    cmd = { "clangd", "--suggest-missing-includes", "--header-insertion=iwyu", "--clang-tidy", "--std=c++23" },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    init_options = {
        clangdFileStatus = true,
        usePlaceholderReferences = true,
        completeUnimported = true,
        semanticHighlighting = true,
        fallbackFlags = { "-std=c++23" }
    }
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = lsp_servers,
    automatic_installation = true,
})

lsp.preset("recommended")

lsp.configure('clangd', {
    settings = clangdSettings
})

lsp.setup()

vim.keymap.set('n', '<leader>m', vim.cmd.mason, {})
