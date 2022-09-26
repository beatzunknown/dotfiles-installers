lua <<END
require('lualine').setup({
    options = {
        icons_enabled = true,
        theme = 'material'
    }
})

require('material').setup({
    lualine_style = 'stealth'
})
END

let g:material_style = "darker"

colorscheme material

