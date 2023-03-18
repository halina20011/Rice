-- yay -S okular
-- pip install neovim-remote

-- local status_ok, comment = pcall(require, "vimtex")
-- if not status_ok then
--     return
-- end

-- function config.vimtex()
--     vim.g.vimtex_view_general_viewer = 'okular'
--     vim.g.vimtex_view_general_options = [[--unique file:@pdf\#src:@line@tex]]
--     -- vim.g.vimtex_view_method = 'zathura'
--     vim.g.vimtex_compiler_latexmk_engines = {
--         _ = '-latexmk'
--     }
--     vim.g.tex_comment_nospell = 1
--     -- vim.g.vimtex_compiler_progname = 'nvr'
--     -- vim.g.vimtex_view_general_options_latexmk = '--unique'
-- end
