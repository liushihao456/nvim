-- treesitter
require('nvim-treesitter.configs').setup {
    highlight = { enable = true }
}

-- lualine
require('lualine').setup {
    options = { 
        theme = 'gruvbox',
        component_separators = { left = '|', right = '|'},
        section_separators = { left = '', right = ''}
    },
    sections = {
        lualine_c = { { 'filename', path = 1 } },
        lualine_b = {'branch', 'diagnostics'},
        lualine_x = {'encoding'}
    }
}

-- telescope
require('telescope').setup {
    defaults = {
        layout_strategy = 'center'
    }
}

-- project.nvim
require('telescope').load_extension('projects')
require("project_nvim").setup {
    patterns = { ".git", ".svn" }
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
}
-- vim.api.nvim_set_keymap('n', '<Leader>pp', [[<cmd>lua require('telescope').extensions.projects.projects()<cr>]], { noremap = true, silent = true })
--
require("telescope").load_extension("file_browser")
