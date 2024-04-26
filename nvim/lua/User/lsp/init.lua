local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#volar
lspconfig.volar.setup{
    -- root_dir = root_pattern(".git", "package.json", "tsconfig.json", "jsconfig.json"),
    filetypes = {"vue"},
    init_options = {
        typescript = {
            tsdk = '/usr/local/lib/nodejs/node-v20.11.0-linux-x64/lib/node_modules/typescript/lib'
        },
        vue = {
            hybridMode = false,
        },
    }
}

-- https://github.com/typescript-language-server/typescript-language-server/blob/master/docs/configuration.md
lspconfig.tsserver.setup{
    javascript = {
        format = {
            semicolons = "insert"
        }
    }
}

require "User.lsp.mason"
require ("User.lsp.handlers").setup();
-- require "User.lsp.handlers";

require "User.lsp.nullLs"
