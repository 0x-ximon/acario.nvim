local M = {}

---@param colors Palette
local function set_terminal(colors)
    vim.g.terminal_color_background = colors.bg
    vim.g.terminal_color_foreground = colors.fg

    vim.g.terminal_color_0 = colors.black
    vim.g.terminal_color_1 = colors.red
    vim.g.terminal_color_2 = colors.green
    vim.g.terminal_color_3 = colors.yellow
    vim.g.terminal_color_4 = colors.blue
    vim.g.terminal_color_5 = colors.magenta
    vim.g.terminal_color_6 = colors.cyan
    vim.g.terminal_color_7 = colors.white
    vim.g.terminal_color_8 = colors.bright_black
    vim.g.terminal_color_9 = colors.bright_red
    vim.g.terminal_color_10 = colors.bright_green
    vim.g.terminal_color_11 = colors.bright_yellow
    vim.g.terminal_color_12 = colors.bright_blue
    vim.g.terminal_color_13 = colors.bright_magenta
    vim.g.terminal_color_14 = colors.bright_cyan
    vim.g.terminal_color_15 = colors.bright_white
end

---@param theme Theme
---@return Palette?
local function get_palette(theme)
    ---@type Palette?
    local palette = nil

    if theme == "dark" then
        palette = require("acario.palette_dark")
    end

    if theme == "light" then
        palette = require("acario.palette_light")
    end

    return palette
end

---@param theme Theme
function M.load(theme)
    local palette = get_palette(theme)
    assert(palette ~= nil, "palette undefined: invalid theme name")

    local h = vim.api.nvim_set_hl
    if vim.g.colors_name then
        vim.cmd("hi clear")
        vim.g.colors_name = nil
    end

    vim.o.termguicolors = true
    vim.o.background = palette.theme
    vim.g.colors_name = palette.name

    set_terminal(palette)

    local highlights = require("acario.groups").load(palette)
    for group, setting in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, setting)
    end

    vim.opt.guicursor = "n-c:block-Cursor,i-ci:ver25-Cursor,v-ve:block-Cursor,r-cr-o:hor20-Cursor"
end

return M
