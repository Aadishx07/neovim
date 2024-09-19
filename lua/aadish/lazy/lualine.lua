return {
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons', 'joshdick/onedark.vim' },
        config = function()
            local devicons = require('nvim-web-devicons')

            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'onedark',
                    component_separators = { left = '|', right = '|' },
                    section_separators = { left = '', right = '' },
                    disabled_filetypes = {
                        statusline = {},
                        winbar = {},
                    },
                    ignore_focus = {},
                    always_divide_middle = true,
                    globalstatus = false,
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = { 'branch', 'diff', 'diagnostics' },
                    lualine_c = {
                        function()
                            local relpath = vim.fn.expand('%:.')
                            local icon, _ = devicons.get_icon(relpath, vim.fn.expand('%:e'))
                            return (icon or '') .. ' ' .. relpath
                        end,
                    },
                    lualine_x = { 'encoding', 'fileformat', 'filetype' },
                    lualine_y = { 'progress' },
                    lualine_z = { 'location' }
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    lualine_c = {
                        function()
                            local relpath = vim.fn.expand('%:.')
                            local icon, _ = devicons.get_icon(relpath, vim.fn.expand('%:e'))
                            return (icon or '') .. ' ' .. relpath
                        end,
                    },
                    lualine_x = { 'location' },
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                winbar = {},
                inactive_winbar = {},
                extensions = {}
            }
        end
    }
}
