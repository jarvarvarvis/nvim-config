-- Configure custom color theme
local colors = {
    black = "#1d1f21",
    light = "#ffffff",
    white = "#e0e0e0",
    red = "#cc6666",
    green = "#b5bd68",
    blue = "#81a2be",
    yellow = "#f0c674",
    gray = "#2d2f31",
    darkgray = '#3d3f41',
    lightgray = "#4d4f51",
    inactivegray = '#2d2f31'
}

return {
    normal = {
        a = { bg = colors.white, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.light },
        c = { bg = colors.inactivegray, fg = colors.white }
    },
    insert = {
        a = { bg = colors.blue, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.light },
        c = { bg = colors.inactivegray, fg = colors.white }
    },
    visual = {
        a = { bg = colors.yellow, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.light },
        c = { bg = colors.inactivegray, fg = colors.white }
    },
    replace = {
        a = { bg = colors.red, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.light },
        c = { bg = colors.inactivegray, fg = colors.white }
    },
    command = {
        a = { bg = colors.green, fg = colors.black, gui = 'bold' },
        b = { bg = colors.lightgray, fg = colors.light },
        c = { bg = colors.inactivegray, fg = colors.white }
    },
    inactive = {
        a = { bg = colors.inactivegray, fg = colors.lightgray, gui = 'bold' },
        b = { bg = colors.inactivegray, fg = colors.lightgray },
        c = { bg = colors.inactivegray, fg = colors.lightgray }
    }
}
