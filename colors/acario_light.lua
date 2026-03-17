---@class Palette
local palette = {
    bg = "#F5F5F9",
    fg = "#0F1019",
    selection = "#DEEAF8",
    comment = "#4E4E4E",
    orange = "#D75F00",

    -- ANSI
    black = "#1E1E33",
    red = "#D70000",
    green = "#005F00",
    yellow = "#AF8700",
    purple = "#1F55A0",
    pink = "#AF005F",
    cyan = "#007687",
    white = "#D0D0E3",

    -- Bright variants
    bright_red = "#D70000",
    bright_green = "#005F00",
    bright_yellow = "#AF8700",
    bright_blue = "#1F55A0",
    bright_magenta = "#8700AF",
    bright_cyan = "#007687",
    bright_white = "#0D0E16",

    menu = "#E9E9F2",
    visual = "#C0CCD0",
    gutter_fg = "#585C6C",
    nontext = "#D0D0E3",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.background = "light"
vim.g.colors_name = "acario_light"

local h = {
    Normal = { fg = palette.fg, bg = palette.bg },
    LineNr = { fg = palette.gutter_fg },
    CursorLineNr = { fg = palette.orange, bold = true },
    Comment = { fg = palette.comment, italic = true },
    Constant = { fg = palette.pink },
    String = { fg = palette.green },
    Function = { fg = palette.yellow },
    Statement = { fg = palette.red },
    Type = { fg = palette.purple },
    Identifier = { fg = palette.cyan },
    Visual = { bg = palette.visual },
    NonText = { fg = palette.nontext },
    Pmenu = { fg = palette.fg, bg = palette.menu },

    -- Treesitter
    ["@variable"] = { fg = palette.cyan },
    ["@keyword"] = { link = "Statement" },
}

for group, settings in pairs(h) do
    vim.api.nvim_set_hl(0, group, settings)
end
