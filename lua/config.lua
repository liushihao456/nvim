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
