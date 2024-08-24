local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

local setup = {
    plugins = {
        marks = true, -- shows a list of your marks on ' and `
        registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
        spelling = {
          enabled = false, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
          suggestions = 20, -- how many suggestions should be shown in the list?
        },
        -- the presets plugin, adds help for a bunch of default keybindings in Neovim
        -- No actual key bindings are created
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = true, -- default bindings on <c-w>
            nav = true, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },
    -- add operators that will trigger motion and text object completion
    -- to enable all native operators, set the preset / operators plugin above
    -- operators = { gc = "Comments" },
    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        separator = "➜", -- symbol used between a key and it's label
        group = "+", -- symbol prepended to a group
    },
    -- popup_mappings = {
    --     scroll_down = "<c-d>", -- binding to scroll down inside the popup
    --     scroll_up = "<c-u>", -- binding to scroll up inside the popup
    -- },
    -- window = {
    --     border = "single", -- none, single, double, shadow, rounded
    --     position = "bottom", -- bottom, top
    --     margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
    --     padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
    --     winblend = 0,
    -- },
    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 10, -- spacing between columns
        align = "left", -- align columns left, center or right
    },
    -- ignore_missing = true, -- enable this to hide mappings for which you didn't specify a label
    -- hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
    show_help = true, -- show help message on the command line when the popup is visible
    -- triggers = "auto", -- automatically setup triggers
    -- triggers = {"<leader>"} -- or specify a list manually
    -- triggers_blacklist = {
    --     -- list of mode / prefixes that should never be hooked by WhichKey
    --     -- this is mostly relevant for key maps that start with a native binding
    --     -- most people should not need to change this
    --     i = { "j", "k" },
    --     v = { "j", "k" },
    -- },
}

local opts = {
    mode = "n", -- NORMAL mode
    prefix = "<leader>",
    buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait = true, -- use `nowait` when creating keymaps
}

which_key.add({
    { "<leader>c", "<cmd>Bdelete!<CR>", desc = "Close Buffer", nowait = true, remap = false },
    { "<leader>g", group = "Git", nowait = true, remap = false },
    { "<leader>gR", "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", desc = "Reset Buffer", nowait = true, remap = false },
    { "<leader>gb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>gc", "<cmd>Telescope git_commits<cr>", desc = "Checkout commit", nowait = true, remap = false },
    { "<leader>gd", "<cmd>Gitsigns diffthis HEAD<cr>", desc = "Diff", nowait = true, remap = false },
    { "<leader>gg", "<cmd>lua _LAZYGIT_TOGGLE()<CR>", desc = "Lazygit", nowait = true, remap = false },
    { "<leader>gj", "<cmd>lua require 'gitsigns'.next_hunk()<cr>", desc = "Next Hunk", nowait = true, remap = false },
    { "<leader>gk", "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", desc = "Prev Hunk", nowait = true, remap = false },
    { "<leader>gl", "<cmd>lua require 'gitsigns'.blame_line()<cr>", desc = "Blame", nowait = true, remap = false },
    { "<leader>go", "<cmd>Telescope git_status<cr>", desc = "Open changed file", nowait = true, remap = false },
    { "<leader>gp", "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", desc = "Preview Hunk", nowait = true, remap = false },
    { "<leader>gr", "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", desc = "Reset Hunk", nowait = true, remap = false },
    { "<leader>gs", "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", desc = "Stage Hunk", nowait = true, remap = false },
    { "<leader>gu", "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>", desc = "Undo Stage Hunk", nowait = true, remap = false },
    { "<leader>h", "<cmd>nohlsearch<CR>", desc = "No Highlight", nowait = true, remap = false },


    -- lsp, LSP
    { "<leader>l", group = "LSP", nowait = true, remap = false },
        { "<leader>lc", "<cmd>lua vim.lsp.buf.declaration()<cr>", desc = "declaration", nowait = true, remap = false },
        { "<leader>ld", "<cmd>lua vim.lsp.buf.definition()<cr>", desc = "definition", nowait = true, remap = false },
        
        { "<leader>lf", "<cmd>lua _G.LspFixcurrent()<CR>", desc = "Fix current", nowait = true, remap = false },

        -- loop throw errors
        { "<leader>lj", "<cmd>:lua vim.diagnostic.goto_next({severity =  vim.diagnostic.severity.ERROR})<CR>", desc = "Next error", nowait = true, remap = false },
        { "<leader>lk", "<cmd>:lua vim.diagnostic.goto_prev({severity =  vim.diagnostic.severity.ERROR})<cr>", desc = "Prev error", nowait = true, remap = false },

        -- loop throw diagnostic
        { "<leader>lu", "<cmd>:lua vim.diagnostic.goto_next()<CR>", desc = "Next diagnostic", nowait = true, remap = false },
        { "<leader>li", "<cmd>:lua vim.diagnostic.goto_prev()<cr>", desc = "Prev diagnostic", nowait = true, remap = false },
        { "<leader>lt", "<cmd>lua vim.diagnostic.disable()<cr>", desc = "toggle diagnostic", nowait = true, remap = false },

    { "<leader>p", group = "Packer", nowait = true, remap = false },
    { "<leader>pS", "<cmd>PackerStatus<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>pc", "<cmd>PackerCompile<cr>", desc = "Compile", nowait = true, remap = false },
    { "<leader>pi", "<cmd>PackerInstall<cr>", desc = "Install", nowait = true, remap = false },
    { "<leader>ps", "<cmd>PackerSync<cr>", desc = "Sync", nowait = true, remap = false },
    { "<leader>pu", "<cmd>PackerUpdate<cr>", desc = "Update", nowait = true, remap = false },
    { "<leader>q", "<cmd>q!<CR>", desc = "Quit", nowait = true, remap = false },
    { "<leader>r", "<cmd>lua ReloadConfig()<CR>", desc = "ReloadConfig", nowait = true, remap = false },
    { "<leader>s", group = "Search", nowait = true, remap = false },
    { "<leader>sC", "<cmd>Telescope commands<cr>", desc = "Commands", nowait = true, remap = false },
    { "<leader>sM", "<cmd>Telescope man_pages<cr>", desc = "Man Pages", nowait = true, remap = false },
    { "<leader>sR", "<cmd>Telescope registers<cr>", desc = "Registers", nowait = true, remap = false },
    { "<leader>sb", "<cmd>Telescope git_branches<cr>", desc = "Checkout branch", nowait = true, remap = false },
    { "<leader>sc", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme", nowait = true, remap = false },
    { "<leader>sh", "<cmd>Telescope help_tags<cr>", desc = "Find Help", nowait = true, remap = false },
    { "<leader>sk", "<cmd>Telescope keymaps<cr>", desc = "Keymaps", nowait = true, remap = false },
    { "<leader>sr", "<cmd>Telescope oldfiles<cr>", desc = "Open Recent File", nowait = true, remap = false },
    { "<leader>t", group = "Tabpage", nowait = true, remap = false },
    { "<leader>th", "<cmd>-tabmove<cr>", desc = "Move left", nowait = true, remap = false },
    { "<leader>tl", "<cmd>+tabmove<cr>", desc = "Move rigth", nowait = true, remap = false },
    { "<leader>v", group = "VimTex", nowait = true, remap = false },
    { "<leader>vc", "<cmd>VimtexCompile<cr>", desc = "Toggle compile", nowait = true, remap = false },
    { "<leader>vr", "<cmd>VimtexReload<cr>", desc = "Reload", nowait = true, remap = false },
    { "<leader>vs", "<cmd>VimtexStatus<cr>", desc = "Status", nowait = true, remap = false },
    { "<leader>vv", "<cmd>VimtexView<cr>", desc = "View", nowait = true, remap = false },
    { "<leader>w", "<cmd>w!<CR>", desc = "Save", nowait = true, remap = false },
});
--

-- local mappings = {
--     ["r"] = { "<cmd>lua ReloadConfig()<CR>", "ReloadConfig" },
--     ["w"] = { "<cmd>w!<CR>", "Save" },
--     ["q"] = { "<cmd>q!<CR>", "Quit" },
--     ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },
--     ["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
--     
--     t = {
--         name = "Tabpage",
--         
--         h = {"<cmd>-tabmove<cr>", "Move left"},
--         l = {"<cmd>+tabmove<cr>", "Move rigth"},
--     },
--     v = {
--         name = "VimTex",
--         c = {"<cmd>VimtexCompile<cr>", "Toggle compile"},
--         r = {"<cmd>VimtexReload<cr>", "Reload"},
--         v = {"<cmd>VimtexView<cr>", "View"},
--         s = {"<cmd>VimtexStatus<cr>", "Status"},
--     },
--     p = {
--         name = "Packer",
--         c = { "<cmd>PackerCompile<cr>", "Compile" },
--         i = { "<cmd>PackerInstall<cr>", "Install" },
--         s = { "<cmd>PackerSync<cr>", "Sync" },
--         S = { "<cmd>PackerStatus<cr>", "Status" },
--         u = { "<cmd>PackerUpdate<cr>", "Update" },
--     },
--
--     g = {
--         name = "Git",
--         g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
--         j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
--         k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
--         l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
--         p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
--         r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
--         R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
--         s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
--         u = {
--           "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
--           "Undo Stage Hunk",
--         },
--         o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
--         d = {
--             "<cmd>Gitsigns diffthis HEAD<cr>",
--             "Diff",
--         },
--     },
--
--     l = {
--         name = "LSP",
--         d = {"<cmd>lua vim.lsp.buf.definition()<cr>", "definition"},
--         c = {"<cmd>lua vim.lsp.buf.declaration()<cr>", "declaration"},
--         t = {"<cmd>lua  vim.diagnostic.disable()<cr>", "toggle diagnostic"},
--         -- "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--         -- "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--         -- "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--         -- "gl", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--         -- "<leader>lf", "<cmd>lua vim.lsp.buf.format{ async = true }<cr>", opts)
--         -- "<leader>li", "<cmd>LspInfo<cr>", opts)
--         -- "<leader>lI", "<cmd>LspInstallInfo<cr>", opts)
--         -- "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", opts)
--         -- "<leader>lj", "<cmd>lua vim.diagnostic.goto_next({buffer=0})<cr>", opts)
--         -- "<leader>lk", "<cmd>lua vim.diagnostic.goto_prev({buffer=0})<cr>", opts)
--         -- "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<cr>", opts)
--         -- "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--         -- "<leader>lq", "<cmd>lua vim.diagnostic.setloclist()<CR>", opts)
--         -- "<leader>D", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)
--         -- a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },
--         -- d = {
--         --   "<cmd>Telescope lsp_document_diagnostics<cr>",
--         --   "Document Diagnostics",
--         -- },
--         -- w = {
--         --   "<cmd>Telescope lsp_workspace_diagnostics<cr>",
--         --   "Workspace Diagnostics",
--         -- },
--         -- f = { "<cmd>lua vim.lsp.buf.formatting()<cr>", "Format" },
--         -- i = { "<cmd>LspInfo<cr>", "Info" },
--         -- I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
--         j = {
--           "<cmd>:lua vim.diagnostic.goto_next()<CR>",
--           "Next Diagnostic",
--         },
--         k = {
--           "<cmd>:lua vim.diagnostic.goto_prev()<cr>",
--           "Prev Diagnostic",
--         },
--         -- l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
--         -- q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
--         -- r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
--         -- s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
--         -- S = {
--         --   "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
--         --   "Workspace Symbols",
--         -- },
--     },
--
--     s = {
--         name = "Search",
--         b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
--         c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
--         h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
--         M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
--         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
--         R = { "<cmd>Telescope registers<cr>", "Registers" },
--         k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
--         C = { "<cmd>Telescope commands<cr>", "Commands" },
--     }
-- }

-- local vopts = {
--     mode = "v", -- VISUAL mode
--     prefix = "<leader>",
--     buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
--     silent = true, -- use `silent` when creating keymaps
--     noremap = true, -- use `noremap` when creating keymaps
--     nowait = true, -- use `nowait` when creating keymaps
-- }

-- local vmappings = {
--     ["/"] = { "<cmd>gcc<CR>", "Comment" },
--     -- ["/"] = { "<ESC><CMD>lua require(\"Comment.api\").toggle_linewise_op(vim.fn.visualmode())<CR>", "Comment" },
-- }

which_key.setup(setup)
-- which_key.register(mappings, opts)
-- which_key.register(vmappings, vopts)
