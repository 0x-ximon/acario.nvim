local M = {}

---@param theme string
---@return Palette?
local function get_palette(theme)
    if theme == "acario_dark" then
        local colors = require("acario.palette_dark")
        return colors
    end

    if theme == "acario_light" then
        local colors = require("acario.palette_light")
        return colors
    end
end

---@param theme string
function M.load(theme)
    local palette = get_palette(theme)
    assert(palette ~= nil, "palette undefined: invalid theme name")

    local highlights = require("acario.groups").load(palette)
    for group, setting in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, setting)
    end
end

return M
