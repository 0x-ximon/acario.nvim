local colors = {
    bg = "#0D0E16",
    bg_alt = "#040408",
    base0 = "#0F1019",
    base1 = "#121212",
    base2 = "#1E1E33",
    base3 = "#464A56",
    base4 = "#585C6C",
    base5 = "#767676",
    base6 = "#959EA5",
    base7 = "#B2B2B2",
    base8 = "#D0D0D0",
    fg = "#CEDBE5",
    fg_alt = "#E5F4FF",
    red = "#D83441",
    green = "#79D836",
    yellow = "#D8B941",
    blue = "#3679D8",
    magenta = "#8041D8",
    cyan = "#36D8BD",
    orange = "#D85F00",
    teal = "#2D9574",
    violet = "#AB11D8",
}

vim.cmd("hi clear")
if vim.fn.exists("syntax_on") then
    vim.cmd("syntax reset")
end
vim.o.background = "dark"
vim.g.colors_name = "acario_dark"

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

    -- Dashboard Highlights
    AlphaHeader = { fg = colors.blue },
    DashboardHeader = { fg = colors.blue },

    -- Treesitter
    ["@variable"] = { fg = colors.cyan },
    ["@keyword"] = { link = "Statement" },
}

for group, settings in pairs(highlights) do
    vim.api.nvim_set_hl(0, group, settings)
end
