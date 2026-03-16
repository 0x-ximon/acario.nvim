local colors = {
    bg = "#F5F5F9",
    bg_alt = "#E9E9F2",
    base0 = "#D0D0E3",
    base1 = "#D0D0E3",
    base2 = "#C0CCD0",
    base3 = "#9EA6B0",
    base4 = "#585C6C",
    base5 = "#4E4E4E",
    base6 = "#3A3A3A",
    base7 = "#303030",
    base8 = "#1E1E33",
    fg = "#0F1019",
    fg_alt = "#0D0E16",
    red = "#D70000",
    green = "#005F00",
    yellow = "#AF8700",
    blue = "#1F55A0",
    magenta = "#AF005F",
    cyan = "#007687",
    orange = "#D75F00",
    teal = "#009B7C",
    violet = "#8700AF",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.background = "light"
vim.g.colors_name = "acario_light"

local highlights = {
    Normal = { fg = colors.fg, bg = colors.bg },
    LineNr = { fg = colors.base4 },
    CursorLineNr = { fg = colors.orange, bold = true },
    Comment = { fg = colors.base5, italic = true },
    Constant = { fg = colors.magenta },
    String = { fg = colors.green },
    Function = { fg = colors.yellow },
    Statement = { fg = colors.red },
    Type = { fg = colors.blue },
    Identifier = { fg = colors.cyan },
    Visual = { bg = colors.base2 },
    -- Treesitter
    ["@variable"] = { fg = colors.cyan },
    ["@keyword"] = { link = "Statement" },
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
end
