---@alias Highlight vim.api.keyset.highlight
---@alias HighlightGroups table<string, Highlight>

local M = {}

--- Mix `fg` into `bg` by `alpha` (0..1). Used for tones that should look the
--- same on both variants: borders, guides, diff and inlay-hint colours.
---@param fg Color
---@param bg Color
---@param alpha number
---@return Color
local function blend(fg, bg, alpha)
    local function rgb(hex)
        hex = hex:gsub("#", "")
        return tonumber(hex:sub(1, 2), 16), tonumber(hex:sub(3, 4), 16), tonumber(hex:sub(5, 6), 16)
    end
    local fr, fgreen, fb = rgb(fg)
    local br, bgreen, bb = rgb(bg)
    local function mix(a, b)
        return math.floor(a * alpha + b * (1 - alpha) + 0.5)
    end
    return string.format("#%02X%02X%02X", mix(fr, br), mix(fgreen, bgreen), mix(fb, bb))
end

---@param colors Palette
---@return HighlightGroups
function M.load(colors)
    -- Derived tones
    local line = blend(colors.foreground, colors.background, 0.22) -- borders, separators, scope
    local faint = blend(colors.foreground, colors.background, 0.10) -- indent guides
    local dim = blend(colors.foreground, colors.background, 0.50) -- inlay hints, secondary text

    ---@type HighlightGroups
    local groups = {
        -- ---------------------------------------------------------------
        --                             EDITOR
        -- ---------------------------------------------------------------

        Normal = { fg = colors.foreground, bg = colors.background },
        NormalNC = { fg = colors.foreground, bg = colors.background },
        NormalFloat = { fg = colors.foreground, bg = colors.background },
        FloatBorder = { fg = line, bg = colors.background },
        FloatTitle = { fg = colors.cyan, bg = colors.background, bold = true },
        FloatFooter = { fg = dim, bg = colors.background },
        MsgArea = { fg = colors.foreground, bg = colors.background },

        Cursor = { fg = colors.background, bg = colors.primary },
        lCursor = { link = "Cursor" },
        CursorIM = { link = "Cursor" },
        TermCursor = { fg = colors.background, bg = colors.primary },
        CursorLine = { bg = colors.neutral },
        CursorColumn = { bg = colors.neutral },
        ColorColumn = { bg = colors.neutral },

        LineNr = { fg = colors.bright_black },
        CursorLineNr = { fg = colors.foreground, bold = true },
        SignColumn = { fg = colors.bright_black },
        FoldColumn = { fg = colors.bright_black },
        Folded = { fg = colors.muted, bg = colors.neutral },

        VertSplit = { fg = line, bg = colors.background },
        WinSeparator = { fg = line, bg = colors.background },
        EndOfBuffer = { fg = colors.background },
        NonText = { fg = line },
        Whitespace = { fg = line },
        SpecialKey = { fg = line },
        Conceal = { fg = dim },

        Visual = { bg = colors.secondary },
        VisualNOS = { link = "Visual" },
        Search = { fg = colors.foreground, bg = blend(colors.yellow, colors.background, 0.35) },
        CurSearch = { fg = colors.background, bg = colors.primary, bold = true },
        IncSearch = { link = "CurSearch" },
        Substitute = { fg = colors.background, bg = colors.red },
        MatchParen = { fg = colors.primary, bold = true },
        QuickFixLine = { bg = colors.secondary, bold = true },

        Title = { fg = colors.blue, bold = true },
        Directory = { fg = colors.blue },
        ErrorMsg = { fg = colors.red },
        WarningMsg = { fg = colors.yellow },
        ModeMsg = { fg = colors.foreground, bold = true },
        MoreMsg = { fg = colors.green },
        Question = { fg = colors.blue },
        MsgSeparator = { fg = line, bg = colors.background },

        StatusLine = { fg = colors.foreground, bg = colors.neutral },
        StatusLineNC = { fg = dim, bg = colors.neutral },
        WinBar = { fg = colors.foreground, bg = colors.background, bold = true },
        WinBarNC = { fg = dim, bg = colors.background },
        TabLine = { fg = dim, bg = colors.neutral },
        TabLineSel = { fg = colors.foreground, bg = colors.background, bold = true },
        TabLineFill = { bg = colors.neutral },

        Pmenu = { fg = colors.foreground, bg = colors.neutral },
        PmenuSel = { fg = colors.background, bg = colors.blue },
        PmenuKind = { fg = colors.cyan, bg = colors.neutral },
        PmenuKindSel = { link = "PmenuSel" },
        PmenuExtra = { fg = dim, bg = colors.neutral },
        PmenuExtraSel = { link = "PmenuSel" },
        PmenuMatch = { fg = colors.primary, bg = colors.neutral, bold = true },
        PmenuMatchSel = { fg = colors.background, bg = colors.blue, bold = true },
        PmenuSbar = { bg = colors.neutral },
        PmenuThumb = { bg = colors.grey },
        WildMenu = { link = "PmenuSel" },

        DiffAdd = { bg = blend(colors.green, colors.background, 0.15) },
        DiffChange = { bg = blend(colors.blue, colors.background, 0.12) },
        DiffDelete = { fg = colors.red, bg = blend(colors.red, colors.background, 0.15) },
        DiffText = { bg = blend(colors.blue, colors.background, 0.30) },
        Added = { fg = colors.green },
        Changed = { fg = colors.yellow },
        Removed = { fg = colors.red },

        SpellBad = { undercurl = true, sp = colors.red },
        SpellCap = { undercurl = true, sp = colors.yellow },
        SpellLocal = { undercurl = true, sp = colors.cyan },
        SpellRare = { undercurl = true, sp = colors.magenta },

        -- ---------------------------------------------------------------
        --                             SYNTAX
        -- ---------------------------------------------------------------

        Comment = { fg = colors.muted, italic = true },
        SpecialComment = { link = "Comment" },
        Todo = { fg = colors.blue, bold = true },

        Constant = { fg = colors.blue },
        String = { fg = colors.green },
        Character = { fg = colors.green },
        Number = { fg = colors.foreground },
        Float = { link = "Number" },
        Boolean = { fg = colors.magenta },

        Identifier = { fg = colors.foreground },
        Variable = { fg = colors.foreground },
        Function = { fg = colors.yellow },

        Statement = { fg = colors.red },
        Keyword = { fg = colors.red },
        Conditional = { link = "Keyword" },
        Repeat = { link = "Keyword" },
        Exception = { link = "Keyword" },
        StorageClass = { link = "Keyword" },
        Label = { fg = colors.yellow },
        Operator = { fg = colors.foreground },

        -- Anything "meta" (imports, preprocessor, attributes) is magenta.
        PreProc = { fg = colors.magenta },
        Include = { fg = colors.magenta },
        Define = { link = "PreProc" },
        PreCondit = { link = "PreProc" },
        Macro = { fg = colors.blue },

        Type = { fg = colors.blue },
        Structure = { link = "Type" },
        Typedef = { link = "Type" },

        Special = { fg = colors.white },
        SpecialChar = { fg = colors.green, bold = true },
        Quote = { fg = colors.white },
        Tag = { fg = colors.green },
        Delimiter = { fg = colors.foreground },
        Debug = { fg = colors.red },
        Underlined = { underline = true },
        Ignore = { fg = dim },
        Error = { fg = colors.red },

        -- ---------------------------------------------------------------
        --                           TREESITTER
        -- ---------------------------------------------------------------

        ["@variable"] = { link = "Variable" },
        ["@variable.builtin"] = { fg = colors.cyan },
        ["@variable.parameter"] = { fg = colors.foreground },
        ["@variable.parameter.builtin"] = { fg = colors.cyan },
        ["@variable.member"] = { fg = colors.cyan },
        ["@property"] = { fg = colors.cyan },

        ["@constant"] = { link = "Constant" },
        ["@constant.builtin"] = { link = "Constant" },
        ["@constant.macro"] = { link = "Constant" },

        ["@module"] = { fg = colors.magenta },
        ["@module.builtin"] = { fg = colors.magenta },
        ["@label"] = { link = "Label" },

        ["@string"] = { link = "String" },
        ["@string.documentation"] = { link = "String" },
        ["@string.escape"] = { fg = colors.green, bold = true },
        ["@string.regexp"] = { fg = colors.cyan },
        ["@string.special"] = { fg = colors.green, italic = true },
        ["@string.special.symbol"] = { fg = colors.blue },
        ["@string.special.url"] = { fg = colors.cyan, underline = true },
        ["@character"] = { link = "Character" },
        ["@character.special"] = { link = "SpecialChar" },

        ["@boolean"] = { link = "Boolean" },
        ["@number"] = { link = "Number" },
        ["@number.float"] = { link = "Number" },

        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { link = "Type" },
        ["@type.definition"] = { link = "Type" },
        ["@attribute"] = { link = "PreProc" },
        ["@attribute.builtin"] = { link = "PreProc" },

        ["@function"] = { link = "Function" },
        ["@function.builtin"] = { fg = colors.blue },
        ["@function.call"] = { fg = colors.foreground },
        ["@function.macro"] = { link = "Macro" },
        ["@function.method"] = { link = "Function" },
        ["@function.method.call"] = { fg = colors.foreground },
        ["@constructor"] = { link = "Type" },
        ["@operator"] = { link = "Operator" },

        ["@keyword"] = { link = "Keyword" },
        ["@keyword.import"] = { link = "Include" },
        ["@keyword.directive"] = { link = "PreProc" },
        ["@keyword.directive.define"] = { link = "Define" },

        ["@punctuation"] = { fg = colors.foreground },
        ["@punctuation.bracket"] = { fg = colors.foreground },
        ["@punctuation.delimiter"] = { fg = colors.foreground },

        ["@comment"] = { link = "Comment" },
        ["@comment.documentation"] = { link = "Comment" },
        ["@comment.error"] = { fg = colors.red, bold = true },
        ["@comment.warning"] = { fg = colors.yellow, bold = true },
        ["@comment.todo"] = { fg = colors.blue, bold = true },
        ["@comment.note"] = { fg = colors.cyan, bold = true },

        ["@tag"] = { fg = colors.green },
        ["@tag.builtin"] = { fg = colors.green },
        ["@tag.attribute"] = { fg = colors.cyan },
        ["@tag.delimiter"] = { fg = colors.white },

        ["@diff.plus"] = { link = "Added" },
        ["@diff.minus"] = { link = "Removed" },
        ["@diff.delta"] = { link = "Changed" },

        ["@markup.heading"] = { link = "Title" },
        ["@markup.strong"] = { fg = colors.foreground, bold = true },
        ["@markup.italic"] = { fg = colors.foreground, italic = true },
        ["@markup.strikethrough"] = { fg = colors.foreground, strikethrough = true },
        ["@markup.underline"] = { underline = true },
        ["@markup.quote"] = { fg = colors.green },
        ["@markup.math"] = { fg = colors.blue },
        ["@markup.link"] = { fg = colors.foreground, italic = true },
        ["@markup.link.label"] = { fg = colors.blue },
        ["@markup.link.url"] = { fg = colors.cyan, underline = true },
        ["@markup.raw"] = { fg = colors.foreground, italic = true },
        ["@markup.list"] = { fg = colors.red },
        ["@markup.list.checked"] = { fg = colors.green },
        ["@markup.list.unchecked"] = { fg = dim },

        ["@error"] = { fg = colors.bright_red },

        -- Names from older nvim-treesitter releases, still used by some
        -- queries and by the LSP links below.
        ["@namespace"] = { link = "@module" },
        ["@include"] = { link = "@keyword.import" },
        ["@method"] = { link = "@function.method" },
        ["@method.call"] = { link = "@function.method.call" },
        ["@class"] = { link = "Type" },
        ["@struct"] = { link = "Type" },
        ["@interface"] = { link = "Type" },
        ["@enum"] = { link = "Type" },
        ["@enumMember"] = { link = "Constant" },
        ["@decorator"] = { link = "@attribute" },

        -- ---------------------------------------------------------------
        --                       LSP & DIAGNOSTICS
        -- ---------------------------------------------------------------

        LspReferenceText = { bold = true },
        LspReferenceRead = { bold = true },
        LspReferenceWrite = { bold = true },
        LspInlayHint = { fg = dim, italic = true },
        LspCodeLens = { fg = dim, italic = true },
        LspCodeLensSeparator = { fg = line },
        LspSignatureActiveParameter = { fg = colors.primary, bold = true, underline = true },
        SnippetTabstop = { bg = colors.secondary },

        DiagnosticError = { fg = colors.red },
        DiagnosticWarn = { fg = colors.yellow },
        DiagnosticInfo = { fg = colors.blue },
        DiagnosticHint = { fg = colors.white },
        DiagnosticOk = { fg = colors.green },

        DiagnosticSignError = { link = "DiagnosticError" },
        DiagnosticSignWarn = { link = "DiagnosticWarn" },
        DiagnosticSignInfo = { link = "DiagnosticInfo" },
        DiagnosticSignHint = { link = "DiagnosticHint" },
        DiagnosticSignOk = { link = "DiagnosticOk" },

        DiagnosticFloatingError = { link = "DiagnosticError" },
        DiagnosticFloatingWarn = { link = "DiagnosticWarn" },
        DiagnosticFloatingInfo = { link = "DiagnosticInfo" },
        DiagnosticFloatingHint = { link = "DiagnosticHint" },
        DiagnosticFloatingOk = { link = "DiagnosticOk" },

        DiagnosticVirtualTextError = { link = "DiagnosticError" },
        DiagnosticVirtualTextWarn = { link = "DiagnosticWarn" },
        DiagnosticVirtualTextInfo = { link = "DiagnosticInfo" },
        DiagnosticVirtualTextHint = { link = "DiagnosticHint" },
        DiagnosticVirtualTextOk = { link = "DiagnosticOk" },

        DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
        DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
        DiagnosticUnderlineInfo = { undercurl = true, sp = colors.blue },
        DiagnosticUnderlineHint = { undercurl = true, sp = colors.white },
        DiagnosticUnderlineOk = { undercurl = true, sp = colors.green },

        DiagnosticUnnecessary = { fg = dim },
        DiagnosticDeprecated = { strikethrough = true, sp = dim },

        -- Semantic tokens
        ["@lsp.type.type"] = { link = "@type" },
        ["@lsp.type.class"] = { link = "@class" },
        ["@lsp.type.struct"] = { link = "@struct" },
        ["@lsp.type.interface"] = { link = "@interface" },
        ["@lsp.type.typeParameter"] = { link = "@type" },
        ["@lsp.type.builtinType"] = { link = "@type.builtin" },
        ["@lsp.type.decorator"] = { link = "@decorator" },
        ["@lsp.type.attributeBracket"] = { link = "@attribute" },

        ["@lsp.type.property"] = { link = "@property" },
        ["@lsp.type.namespace"] = { link = "@namespace" },

        ["@lsp.type.method"] = { link = "@method" },
        ["@lsp.type.function"] = { link = "@function" },
        ["@lsp.type.macro"] = { link = "@function.macro" },

        ["@lsp.type.enum"] = { link = "@enum" },
        ["@lsp.type.enumMember"] = { link = "@enumMember" },

        ["@lsp.type.variable"] = { link = "@variable" },
        ["@lsp.type.parameter"] = { link = "@variable.parameter" },
        ["@lsp.type.selfKeyword"] = { link = "@variable.builtin" },
        ["@lsp.type.selfTypeKeyword"] = { link = "@type" },
        ["@lsp.type.keyword"] = { link = "@keyword" },
        ["@lsp.type.formatSpecifier"] = { link = "@string.escape" },
        ["@lsp.type.unresolvedReference"] = { undercurl = true, sp = colors.red },

        ["@lsp.typemod.function.defaultLibrary"] = { link = "@function.builtin" },
        ["@lsp.typemod.variable.defaultLibrary"] = { link = "@variable.builtin" },
        ["@lsp.mod.deprecated"] = { strikethrough = true },

        -- ---------------------------------------------------------------
        --                            LANGUAGES
        -- ---------------------------------------------------------------

        -- Lua
        ["@property.lua"] = { fg = colors.foreground },
        ["@constructor.lua"] = { link = "@punctuation" },
        ["@lsp.type.property.lua"] = { link = "@property" },
        ["@lsp.type.parameter.lua"] = { link = "@variable.parameter" },

        -- Solidity
        ["@constructor.solidity"] = { link = "@keyword" },

        -- Markdown
        ["@markup.quote.markdown"] = { fg = colors.green },

        -- JSON
        jsonQuote = { link = "Quote" },
        jsonBraces = { link = "Special" },
        jsonKeyword = { link = "String" },
        jsonString = { link = "String" },
        jsonBoolean = { link = "Boolean" },
        jsonNumber = { link = "Number" },

        -- ---------------------------------------------------------------
        --                             MODULES
        -- ---------------------------------------------------------------

        -- Oil
        OilDir = { fg = colors.blue },
        OilFile = { fg = colors.foreground },
        OilLink = { fg = colors.cyan },
        OilSocket = { fg = colors.magenta },
        OilCreate = { fg = colors.green },
        OilDelete = { fg = colors.red },
        OilMove = { fg = colors.yellow },
        OilCopy = { fg = colors.cyan },
        OilChange = { fg = colors.yellow },

        -- SnacksDashboard
        SnacksDashboardHeader = { fg = colors.blue },
        SnacksDashboardIcon = { fg = colors.blue },
        SnacksDashboardKey = { fg = colors.blue },
        SnacksDashboardDir = { fg = colors.bright_black },
        SnacksDashboardFile = { fg = colors.foreground },
        SnacksDashboardSpecial = { fg = colors.foreground },
        SnacksDashboardFooter = { fg = colors.blue },

        -- SnacksPicker
        SnacksBackdrop = { link = "FloatShadow" },
        SnacksPickerBorder = { link = "FloatBorder" },
        SnacksPickerFile = { fg = colors.foreground },
        SnacksPickerDir = { fg = colors.bright_black },
        SnacksPickerDirectory = { link = "Directory" },
        SnacksPickerGitStatusIgnored = { fg = dim },
        SnacksPickerGitStatusModified = { fg = colors.yellow },
        SnacksPickerGitStatusRenamed = { fg = colors.yellow },
        SnacksPickerGitStatusStaged = { fg = colors.green },
        SnacksPickerGitStatusUnmerged = { fg = colors.red },
        SnacksPickerGitStatusUntracked = { fg = colors.bright_black },
        SnacksPickerInput = { link = "NormalFloat" },
        SnacksPickerInputBorder = { link = "SnacksPickerBorder" },
        SnacksPickerMatch = { fg = colors.green, italic = true },
        SnacksPickerPathHidden = { fg = dim },
        SnacksPickerPrompt = { fg = colors.blue },
        SnacksPickerTitle = { fg = colors.cyan, bold = true },
        SnacksPickerSelected = { fg = colors.primary },
        SnacksPickerListCursorLine = { link = "CursorLine" },
        SnacksPickerTree = { fg = faint },

        -- Snacks (other)
        SnacksIndent = { fg = faint },
        SnacksIndentScope = { fg = line },
        SnacksInputBorder = { link = "FloatBorder" },
        SnacksInputTitle = { link = "FloatTitle" },
        SnacksNotifierBorderInfo = { fg = colors.blue },
        SnacksNotifierBorderWarn = { fg = colors.yellow },
        SnacksNotifierBorderError = { fg = colors.red },
        SnacksNotifierTitleInfo = { fg = colors.blue, bold = true },
        SnacksNotifierTitleWarn = { fg = colors.yellow, bold = true },
        SnacksNotifierTitleError = { fg = colors.red, bold = true },
        SnacksNotifierIconInfo = { fg = colors.blue },
        SnacksNotifierIconWarn = { fg = colors.yellow },
        SnacksNotifierIconError = { fg = colors.red },

        -- MiniStatusLine
        MiniStatuslineModeNormal = { fg = colors.background, bg = colors.blue, bold = true },
        MiniStatuslineModeInsert = { fg = colors.background, bg = colors.green, bold = true },
        MiniStatuslineModeVisual = { fg = colors.background, bg = colors.yellow, bold = true },
        MiniStatuslineModeReplace = { fg = colors.background, bg = colors.red, bold = true },
        MiniStatuslineModeCommand = { fg = colors.background, bg = colors.cyan, bold = true },
        MiniStatuslineModeOthers = { fg = colors.background, bg = colors.magenta, bold = true },
        MiniStatuslineInactive = { fg = colors.foreground, bg = colors.neutral },
        MiniStatuslineDevinfo = { fg = colors.blue, bg = colors.neutral },
        MiniStatuslineFileinfo = { fg = colors.blue, bg = colors.neutral },
        MiniStatuslineFilename = { fg = colors.white, bg = colors.background },

        -- mini.icons
        MiniIconsAzure = { fg = colors.bright_blue },
        MiniIconsBlue = { fg = colors.blue },
        MiniIconsCyan = { fg = colors.cyan },
        MiniIconsGreen = { fg = colors.green },
        MiniIconsGrey = { fg = colors.bright_black },
        MiniIconsOrange = { fg = colors.bright_red },
        MiniIconsPurple = { fg = colors.bright_magenta },
        MiniIconsRed = { fg = colors.red },
        MiniIconsYellow = { fg = colors.yellow },

        -- mini.diff
        MiniDiffSignAdd = { fg = colors.green },
        MiniDiffSignDelete = { fg = colors.red },
        MiniDiffSignChange = { fg = colors.yellow },
        MiniDiffOverAdd = { fg = colors.background, bg = colors.green },
        MiniDiffOverDelete = { fg = colors.background, bg = colors.red },
        MiniDiffOverChange = { fg = colors.background, bg = colors.yellow },
        MiniDiffOverContext = { fg = colors.muted },
        MiniDiffOverContextBuf = { fg = colors.muted },

        -- mini.files / mini.pick / mini.notify / mini.clue
        MiniFilesBorder = { link = "FloatBorder" },
        MiniFilesBorderModified = { fg = colors.yellow },
        MiniFilesCursorLine = { link = "CursorLine" },
        MiniFilesDirectory = { link = "Directory" },
        MiniFilesTitle = { fg = dim },
        MiniFilesTitleFocused = { link = "FloatTitle" },
        MiniPickBorder = { link = "FloatBorder" },
        MiniPickBorderText = { link = "FloatTitle" },
        MiniPickMatchCurrent = { link = "CursorLine" },
        MiniPickMatchMarked = { fg = colors.primary },
        MiniPickMatchRanges = { fg = colors.primary, bold = true },
        MiniPickPrompt = { fg = colors.blue },
        MiniNotifyBorder = { link = "FloatBorder" },
        MiniNotifyTitle = { link = "FloatTitle" },
        MiniClueBorder = { link = "FloatBorder" },
        MiniClueTitle = { link = "FloatTitle" },
        MiniClueDescGroup = { fg = colors.magenta },
        MiniClueNextKey = { fg = colors.primary, bold = true },

        -- mini.indentscope / mini.cursorword / mini.hipatterns / mini.jump
        MiniIndentscopeSymbol = { fg = line },
        MiniCursorword = { underline = true },
        MiniCursorwordCurrent = { underline = true },
        MiniHipatternsFixme = { fg = colors.background, bg = colors.red, bold = true },
        MiniHipatternsHack = { fg = colors.background, bg = colors.yellow, bold = true },
        MiniHipatternsTodo = { fg = colors.background, bg = colors.blue, bold = true },
        MiniHipatternsNote = { fg = colors.background, bg = colors.cyan, bold = true },
        MiniJump = { fg = colors.background, bg = colors.primary },

        -- gitsigns
        GitSignsAdd = { link = "Added" },
        GitSignsChange = { link = "Changed" },
        GitSignsDelete = { link = "Removed" },
        GitSignsCurrentLineBlame = { fg = dim, italic = true },

        -- blink.cmp
        BlinkCmpMenu = { link = "Pmenu" },
        BlinkCmpMenuBorder = { fg = line, bg = colors.neutral },
        BlinkCmpMenuSelection = { link = "PmenuSel" },
        BlinkCmpScrollBarThumb = { link = "PmenuThumb" },
        BlinkCmpScrollBarGutter = { link = "PmenuSbar" },
        BlinkCmpLabel = { fg = colors.foreground },
        BlinkCmpLabelMatch = { fg = colors.primary, bold = true },
        BlinkCmpLabelDeprecated = { fg = dim, strikethrough = true },
        BlinkCmpLabelDetail = { fg = dim },
        BlinkCmpLabelDescription = { fg = dim },
        BlinkCmpSource = { fg = dim },
        BlinkCmpGhostText = { fg = dim, italic = true },
        BlinkCmpKind = { fg = colors.cyan },
        BlinkCmpDoc = { link = "NormalFloat" },
        BlinkCmpDocBorder = { link = "FloatBorder" },
        BlinkCmpDocSeparator = { fg = line },
        BlinkCmpSignatureHelp = { link = "NormalFloat" },
        BlinkCmpSignatureHelpBorder = { link = "FloatBorder" },
        BlinkCmpSignatureHelpActiveParameter = { link = "LspSignatureActiveParameter" },
    }

    -- Completion item kinds follow the syntax colours (blink.cmp and nvim-cmp).
    local kinds = {
        Text = "Special",
        Method = "Function",
        Function = "Function",
        Constructor = "Type",
        Field = "@property",
        Variable = "Identifier",
        Class = "Type",
        Interface = "Type",
        Module = "@module",
        Property = "@property",
        Unit = "Number",
        Value = "Number",
        Enum = "Type",
        Keyword = "Keyword",
        Snippet = "String",
        Color = "Special",
        File = "Identifier",
        Reference = "@property",
        Folder = "Directory",
        EnumMember = "Constant",
        Constant = "Constant",
        Struct = "Type",
        Event = "Label",
        Operator = "Operator",
        TypeParameter = "Type",
    }
    for kind, target in pairs(kinds) do
        groups["BlinkCmpKind" .. kind] = { link = target }
        groups["CmpItemKind" .. kind] = { link = target }
    end

    return groups
end

return M
