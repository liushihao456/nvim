-- treesitter
require('nvim-treesitter.configs').setup {
    ensure_installed = "maintained",
    highlight = { enable = true }
}

-- neogen
require('neogen').setup {

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
        layout_strategy = 'center',
        layout_config = { width = 0.9 }
    },
    extensions = {
        file_browser = { hidden = true }
    }
}

-- project.nvim
require('telescope').load_extension('projects')
require("project_nvim").setup {
    patterns = { ".git", ".svn" }
}

-- telescope file browser
require("telescope").load_extension("file_browser")

-- neo-tree
require('neo-tree').setup({
    close_if_last_window = true,
    enable_diagnostics = false,
    enable_git_status = false,
    filesystem = {
        follow_current_file = true,
    },
    window = {
        width = 25,
        mappings = {
            ["<tab>"] = "open"
        }
    }
})
