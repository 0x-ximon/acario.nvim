---@class Palette
local palette = {
    bg = "#0D0E16",
    fg = "#CEDBE5",
    selection = "#0C213E",
    comment = "#767676",
    orange = "#D85F00",

    -- ANSI
    black = "#0F1019",
    red = "#D83441",
    green = "#79D836",
    yellow = "#D8B941",
    purple = "#3679D8",
    pink = "#8041D8",
    cyan = "#36D8BD",
    white = "#D0D0D0",

    -- Bright variants
    bright_red = "#D83441",
    bright_green = "#79D836",
    bright_yellow = "#D8B941",
    bright_blue = "#3679D8",
    bright_magenta = "#AB11D8",
    bright_cyan = "#36D8BD",
    bright_white = "#E5F4FF",

    menu = "#040408",
    visual = "#1E1E33",
    gutter_fg = "#585C6C",
    nontext = "#121212",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "acario_dark"

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
