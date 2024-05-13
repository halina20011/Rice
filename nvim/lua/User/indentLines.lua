-- help ibl.config
local highlight = {
    "CursorColumn",
    "Whitespace",
}
require("ibl").setup {
    indent = { 
        -- char = "║",
        char = "┃" 
    },
    -- whitespace = {
    --     highlight = highlight,
    --     remove_blankline_trail = false,
    -- },
    scope = { enabled = false },
}
