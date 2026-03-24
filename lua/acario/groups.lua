---@alias Highlight vim.api.keyset.highlight
---@alias HighlightGroups table<string, Highlight>

local M = {}

---@param colors Palette
---@return HighlightGroups
function M.load(colors)
    return {
        -- ---------------------------------------------------------------
        --                             EDITOR
        -- ---------------------------------------------------------------

        Normal = { fg = colors.fg, bg = colors.bg },
        Visual = { bg = colors.visual },
        NormalNC = { fg = colors.fg, bg = colors.bg },
        VertSplit = { fg = colors.menu, bg = colors.bg },
        WinSeparator = { fg = colors.menu, bg = colors.bg },
        MsgArea = { fg = colors.fg, bg = colors.bg },
        Cursor = { fg = colors.bg, bg = colors.cursor },
        TermCursor = { fg = colors.bg, bg = colors.cursor },
        LineNr = { fg = colors.bright_black },
        EndOfBuffer = { fg = colors.bg },

        Pmenu = { fg = colors.fg, bg = colors.menu },
        PmenuSel = { fg = colors.bg, bg = colors.blue },
        PmenuSbar = { bg = colors.menu },
        PmenuThumb = { bg = colors.gutter_fg },

        -- ---------------------------------------------------------------
        --                             SYNTAX
        -- ---------------------------------------------------------------

        Statement = { fg = colors.red },
        Keyword = { fg = colors.red },
        Identifier = { fg = colors.fg },
        Include = { fg = colors.magenta },
        Function = { fg = colors.yellow },
        Variable = { fg = colors.fg },
        Constant = { fg = colors.blue },
        Type = { fg = colors.blue },
        String = { fg = colors.green },
        Number = { fg = colors.fg },
        NonText = { fg = colors.bg },
        Comment = { fg = colors.comment, italic = true },

        -- Treesitter
        ["@keyword"] = { link = "Keyword" },
        ["@namespace"] = { fg = colors.magenta },
        ["@module"] = { fg = colors.magenta },
        ["@property"] = { fg = colors.fg },
        ["@error"] = { fg = colors.bright_red },

        ["@type"] = { link = "Type" },
        ["@type.builtin"] = { fg = colors.blue },

        ["@function"] = { link = "Function" },
        ["@function.call"] = { fg = colors.fg },
        ["@function.macro"] = { fg = colors.blue },

        ["@method"] = { link = "Function" },
        ["@method.call"] = { fg = colors.fg },

        ["@constant"] = { link = "Constant" },
        ["@variable"] = { link = "Variable" },
        ["@variable.member"] = { fg = colors.cyan },
        ["@variable.builtin"] = { fg = colors.cyan },
        ["@variable.parameter"] = { fg = colors.fg },

        ["@string"] = { link = "String" },
        ["@string.escape"] = { fg = colors.green, bold = true },

        ["@punctuation.delimiter"] = { fg = colors.fg },
        ["@punctuation.bracket"] = { fg = colors.fg },

        -- LSP
        LspReferenceText = { bold = true },
        LspReferenceRead = { bold = true },
        LspReferenceWrite = { bold = true },

        -- ---------------------------------------------------------------
        --                             MODULES
        -- ---------------------------------------------------------------

        -- SnacksDashboard
        SnacksDashboardHeader = { fg = colors.blue },
        SnacksDashboardIcon = { fg = colors.blue },
        SnacksDashboardKey = { fg = colors.blue },
        SnacksDashboardDir = { fg = colors.bright_black },
        SnacksDashboardFile = { fg = colors.fg },
        SnacksDashboardSpecial = { fg = colors.fg },
        SnacksDashboardFooter = { fg = colors.blue },

        -- MiniStatusLine
        MiniStatuslineModeNormal = { fg = colors.bg, bg = colors.blue, bold = true },
        MiniStatuslineModeInsert = { fg = colors.bg, bg = colors.green, bold = true },
        MiniStatuslineModeVisual = { fg = colors.bg, bg = colors.bright_red, bold = true },
        MiniStatuslineModeReplace = { fg = colors.bg, bg = colors.red, bold = true },
        MiniStatuslineModeCommand = { fg = colors.bg, bg = colors.cyan, bold = true },
        MiniStatuslineModeOthers = { fg = colors.bg, bg = colors.yellow, bold = true },
        MiniStatuslineInactive = { fg = colors.fg, bg = colors.menu },
        MiniStatuslineDevinfo = { fg = colors.blue, bg = colors.visual },
        MiniStatuslineFileinfo = { fg = colors.blue, bg = colors.visual },
        MiniStatuslineFilename = { fg = colors.white, bg = colors.bg },

        -- ---------------------------------------------------------------
        --                             TESTING
        -- ---------------------------------------------------------------
    }
end

return M

-- local function setup(configs)
--     return {
--         -- Normal = { fg = colors.fg, bg = colors.bg },
--         -- NormalFloat = { fg = colors.fg, bg = colors.bg },
--         -- Comment = { fg = colors.comment, italic = configs.italic_comment },
--         -- Constant = { fg = colors.magenta },
--         -- String = { fg = colors.green },
--         -- Character = { fg = colors.green },
--         -- Number = { fg = colors.orange },
--         -- Boolean = { fg = colors.cyan },
--         -- Float = { fg = colors.orange },
--         -- FloatBorder = { fg = colors.white },
--         -- Operator = { fg = colors.blue },
--         -- Keyword = { fg = colors.cyan },
--         -- Keywords = { fg = colors.cyan },
--         -- Identifier = { fg = colors.cyan },
--         -- Function = { fg = colors.yellow },
--         -- Statement = { fg = colors.red },
--         -- Conditional = { fg = colors.magenta },
--         -- Repeat = { fg = colors.magenta },
--         -- Label = { fg = colors.cyan },
--         -- Exception = { fg = colors.blue },
--         -- PreProc = { fg = colors.yellow },
--         -- Include = { fg = colors.blue },
--         -- Define = { fg = colors.blue },
--         -- Title = { fg = colors.cyan },
--         -- Macro = { fg = colors.blue },
--         -- PreCondit = { fg = colors.cyan },
--         -- Type = { fg = colors.blue },
--         -- StorageClass = { fg = colors.magenta },
--         -- Structure = { fg = colors.yellow },
--         -- TypeDef = { fg = colors.yellow },
--         -- Special = { fg = colors.green, italic = true },
--         -- SpecialComment = { fg = colors.comment, italic = true },
--         -- Error = { fg = colors.bright_red },
--         -- Todo = { fg = colors.blue, bold = true, italic = true },
--         -- Underlined = { fg = colors.cyan, underline = true },
--
--         -- CursorLineNr = { fg = colors.orange, bold = true },
--
--         -- SignColumn = { bg = colors.bg },
--
--         -- Conceal = { fg = colors.comment },
--         -- CursorColumn = { bg = colors.black },
--         -- CursorLine = { bg = colors.selection },
--         -- ColorColumn = { bg = colors.selection },
--
--         -- StatusLine = { fg = colors.white, bg = colors.selection },
--         -- StatusLineNC = { fg = colors.comment },
--         -- StatusLineTerm = { fg = colors.white, bg = colors.black },
--         -- StatusLineTermNC = { fg = colors.comment },
--
--         -- Directory = { fg = colors.cyan },
--         -- DiffAdd = { fg = colors.bg, bg = colors.green },
--         -- DiffChange = { fg = colors.orange },
--         -- DiffDelete = { fg = colors.red },
--         -- DiffText = { fg = colors.comment },
--
--         -- ErrorMsg = { fg = colors.bright_red },
--         -- VertSplit = { fg = colors.black },
--         -- WinSeparator = { fg = colors.black },
--         -- Folded = { fg = colors.comment },
--         -- FoldColumn = {},
--         -- Search = { fg = colors.black, bg = colors.orange },
--         -- IncSearch = { fg = colors.orange, bg = colors.comment },
--         -- LineNr = { fg = colors.gutter_fg },
--         -- MatchParen = { fg = colors.fg, underline = true },
--         -- NonText = { fg = colors.nontext },
--         -- Pmenu = { fg = colors.fg, bg = colors.menu },
--         -- PmenuSel = { fg = colors.white, bg = colors.selection },
--         -- PmenuSbar = { bg = colors.bg },
--         -- PmenuThumb = { bg = colors.selection },
--
--         -- Question = { fg = colors.blue },
--         -- QuickFixLine = { fg = colors.black, bg = colors.yellow },
--         -- SpecialKey = { fg = colors.nontext },
--
--         -- SpellBad = { fg = colors.bright_red, underline = true },
--         -- SpellCap = { fg = colors.yellow },
--         -- SpellLocal = { fg = colors.yellow },
--         -- SpellRare = { fg = colors.yellow },
--
--         -- TabLine = { fg = colors.comment },
--         -- TabLineSel = { fg = colors.white },
--         -- TabLineFill = { bg = colors.bg },
--         -- Terminal = { fg = colors.white, bg = colors.black },
--         -- Visual = { bg = colors.visual },
--         -- VisualNOS = { fg = colors.visual },
--         -- WarningMsg = { fg = colors.yellow },
--         -- WildMenu = { fg = colors.black, bg = colors.white },
--
--         -- EndOfBuffer = endOfBuffer,

--         -- -- TreeSitter
--         -- ["@error"] = { fg = colors.bright_red },
--         -- ["@punctuation.delimiter"] = { fg = colors.fg },
--         -- ["@punctuation.bracket"] = { fg = colors.fg },
--         -- ["@markup.list"] = { fg = colors.cyan },
--
--         -- ["@constant"] = { fg = colors.blue },
--         -- ["@constant.builtin"] = { fg = colors.blue },
--         -- ["@markup.link.label.symbol"] = { fg = colors.blue },
--
--         -- ["@constant.macro"] = { fg = colors.cyan },
--         -- ["@string.regexp"] = { fg = colors.red },
--         -- ["@string"] = { fg = colors.yellow },
--         -- ["@string.escape"] = { fg = colors.cyan },
--         -- ["@string.special.symbol"] = { fg = colors.blue },
--         -- ["@character"] = { fg = colors.green },
--         -- ["@number"] = { fg = colors.blue },
--         -- ["@boolean"] = { fg = colors.blue },
--         -- ["@number.float"] = { fg = colors.green },
--         -- ["@annotation"] = { fg = colors.yellow },
--         -- ["@attribute"] = { fg = colors.cyan },
--         -- ["@module"] = { fg = colors.orange },
--
--         -- ["@variable.parameter"] = { fg = colors.orange },
--         -- ["@variable.parameter.reference"] = { fg = colors.orange },
--         -- ["@function.method"] = { fg = colors.green },
--         -- ["@variable.member"] = { fg = colors.orange },
--         -- ["@property"] = { fg = colors.blue },
--         -- ["@constructor"] = { fg = colors.cyan },
--
--         -- ["@keyword.conditional"] = { fg = colors.magenta },
--         -- ["@keyword.repeat"] = { fg = colors.magenta },
--         -- ["@label"] = { fg = colors.cyan },
--
--         -- ["@keyword"] = { fg = colors.magenta },
--         -- ["@keyword.function"] = { fg = colors.cyan },
--         -- ["@keyword.function.ruby"] = { fg = colors.magenta },
--         -- ["@keyword.operator"] = { fg = colors.magenta },
--         -- ["@operator"] = { fg = colors.magenta },
--         -- ["@keyword.exception"] = { fg = colors.blue },
--         -- ["@type"] = { fg = colors.bright_cyan },
--         -- ["@type.builtin"] = { fg = colors.cyan, italic = true },
--         -- ["@type.qualifier"] = { fg = colors.magenta },
--         -- ["@structure"] = { fg = colors.blue },
--         -- ["@keyword.include"] = { fg = colors.magenta },
--
--         -- ["@variable"] = { fg = colors.fg },
--         -- ["@variable.builtin"] = { fg = colors.blue },
--
--         -- ["@markup"] = { fg = colors.orange },
--         -- ["@markup.strong"] = { fg = colors.orange, bold = true }, -- bold
--         -- ["@markup.emphasis"] = { fg = colors.yellow, italic = true }, -- italic
--         -- ["@markup.underline"] = { fg = colors.orange },
--         -- ["@markup.heading"] = { fg = colors.magenta, bold = true }, -- title
--         -- ["@markup.raw"] = { fg = colors.yellow }, -- inline code
--         -- ["@markup.link.url"] = { fg = colors.yellow, italic = true }, -- urls
--         -- ["@markup.link"] = { fg = colors.orange, bold = true },
--
--         -- ["@tag"] = { fg = colors.cyan },
--         -- ["@tag.attribute"] = { fg = colors.green },
--         -- ["@tag.delimiter"] = { fg = colors.cyan },

--         -- -- Semantic
--         -- ["@class"] = { fg = colors.cyan },
--         -- ["@struct"] = { fg = colors.cyan },
--         -- ["@enum"] = { fg = colors.cyan },
--         -- ["@enumMember"] = { fg = colors.blue },
--         -- ["@event"] = { fg = colors.cyan },
--         -- ["@interface"] = { fg = colors.cyan },
--         -- ["@modifier"] = { fg = colors.cyan },
--         -- ["@regexp"] = { fg = colors.yellow },
--         -- ["@typeParameter"] = { fg = colors.cyan },
--         -- ["@decorator"] = { fg = colors.cyan },

--         -- -- LSP Semantic (0.9+)
--         -- ["@lsp.type.class"] = { fg = colors.cyan },
--         -- ["@lsp.type.enum"] = { fg = colors.cyan },
--         -- ["@lsp.type.decorator"] = { fg = colors.green },
--         -- ["@lsp.type.enumMember"] = { fg = colors.blue },
--         -- ["@lsp.type.function"] = { fg = colors.green },
--         -- ["@lsp.type.interface"] = { fg = colors.cyan },
--         -- ["@lsp.type.macro"] = { fg = colors.cyan },
--         -- ["@lsp.type.method"] = { fg = colors.green },
--         -- ["@lsp.type.namespace"] = { fg = colors.orange },
--         -- ["@lsp.type.parameter"] = { fg = colors.orange },
--         -- ["@lsp.type.property"] = { fg = colors.blue },
--         -- ["@lsp.type.struct"] = { fg = colors.cyan },
--         -- ["@lsp.type.type"] = { fg = colors.bright_cyan },
--         -- ["@lsp.type.variable"] = { fg = colors.fg },

--         -- -- HTML
--         -- htmlArg = { fg = colors.green },
--         -- htmlBold = { fg = colors.yellow, bold = true },
--         -- htmlEndTag = { fg = colors.cyan },
--         -- htmlH1 = { fg = colors.magenta },
--         -- htmlH2 = { fg = colors.magenta },
--         -- htmlH3 = { fg = colors.magenta },
--         -- htmlH4 = { fg = colors.magenta },
--         -- htmlH5 = { fg = colors.magenta },
--         -- htmlH6 = { fg = colors.magenta },
--         -- htmlItalic = { fg = colors.blue, italic = true },
--         -- htmlLink = { fg = colors.blue, underline = true },
--         -- htmlSpecialChar = { fg = colors.yellow },
--         -- htmlSpecialTagName = { fg = colors.cyan },
--         -- htmlTag = { fg = colors.cyan },
--         -- htmlTagN = { fg = colors.cyan },
--         -- htmlTagName = { fg = colors.cyan },
--         -- htmlTitle = { fg = colors.white },

--         -- -- Markdown
--         -- markdownBlockquote = { fg = colors.yellow, italic = true },
--         -- markdownBold = { fg = colors.orange, bold = true },
--         -- markdownCode = { fg = colors.green },
--         -- markdownCodeBlock = { fg = colors.orange },
--         -- markdownCodeDelimiter = { fg = colors.red },
--         -- markdownH2 = { link = "rainbow2" },
--         -- markdownH1 = { link = "rainbow1" },
--         -- markdownH3 = { link = "rainbow3" },
--         -- markdownH4 = { link = "rainbow4" },
--         -- markdownH5 = { link = "rainbow5" },
--         -- markdownH6 = { link = "rainbow6" },
--         -- markdownHeadingDelimiter = { fg = colors.red },
--         -- markdownHeadingRule = { fg = colors.comment },
--         -- markdownId = { fg = colors.blue },
--         -- markdownIdDeclaration = { fg = colors.cyan },
--         -- markdownIdDelimiter = { fg = colors.blue },
--         -- markdownItalic = { fg = colors.yellow, italic = true },
--         -- markdownLinkDelimiter = { fg = colors.blue },
--         -- markdownLinkText = { fg = colors.magenta },
--         -- markdownListMarker = { fg = colors.cyan },
--         -- markdownOrderedListMarker = { fg = colors.red },
--         -- markdownRule = { fg = colors.comment },
--         -- ["@markup.heading.1.markdown"] = { link = "rainbowcol1" },
--         -- ["@markup.heading.2.markdown"] = { link = "rainbowcol2" },
--         -- ["@markup.heading.3.markdown"] = { link = "rainbowcol3" },
--         -- ["@markup.heading.4.markdown"] = { link = "rainbowcol4" },
--         -- ["@markup.heading.5.markdown"] = { link = "rainbowcol5" },
--         -- ["@markup.heading.6.markdown"] = { link = "rainbowcol6" },

--         -- --  Diff
--         -- diffAdded = { fg = colors.green },
--         -- diffRemoved = { fg = colors.red },
--         -- diffFileId = { fg = colors.yellow, bold = true, reverse = true },
--         -- diffFile = { fg = colors.nontext },
--         -- diffNewFile = { fg = colors.green },
--         -- diffOldFile = { fg = colors.red },
--
--         -- debugPc = { bg = colors.menu },
--         -- debugBreakpoint = { fg = colors.red, reverse = true },

--         -- -- Git Signs
--         -- GitSignsAdd = { fg = colors.bright_green },
--         -- GitSignsChange = { fg = colors.cyan },
--         -- GitSignsDelete = { fg = colors.bright_red },
--         -- GitSignsAddLn = { fg = colors.black, bg = colors.bright_green },
--         -- GitSignsChangeLn = { fg = colors.black, bg = colors.cyan },
--         -- GitSignsDeleteLn = { fg = colors.black, bg = colors.bright_red },
--         -- GitSignsCurrentLineBlame = { fg = colors.white },

--         -- -- Telescope
--         -- TelescopePromptBorder = { fg = colors.comment },
--         -- TelescopeResultsBorder = { fg = colors.comment },
--         -- TelescopePreviewBorder = { fg = colors.comment },
--         -- TelescopeSelection = { fg = colors.white, bg = colors.selection },
--         -- TelescopeMultiSelection = { fg = colors.blue, bg = colors.selection },
--         -- TelescopeNormal = { fg = colors.fg, bg = colors.bg },
--         -- TelescopeMatching = { fg = colors.green },
--         -- TelescopePromptPrefix = { fg = colors.blue },
--         -- TelescopeResultsDiffDelete = { fg = colors.red },
--         -- TelescopeResultsDiffChange = { fg = colors.cyan },
--         -- TelescopeResultsDiffAdd = { fg = colors.green },

--         -- -- Flash
--         -- FlashLabel = { bg = colors.red, fg = colors.bright_white },

--         -- -- NvimTree
--         -- NvimTreeNormal = { fg = colors.fg, bg = colors.menu },
--         -- NvimTreeVertSplit = { fg = colors.bg, bg = colors.bg },
--         -- NvimTreeRootFolder = { fg = colors.fg, bold = true },
--         -- NvimTreeGitDirty = { fg = colors.yellow },
--         -- NvimTreeGitNew = { fg = colors.bright_green },
--         -- NvimTreeImageFile = { fg = colors.magenta },
--         -- NvimTreeFolderIcon = { fg = colors.blue },
--         -- NvimTreeIndentMarker = { fg = colors.nontext },
--         -- NvimTreeEmptyFolderName = { fg = colors.comment },
--         -- NvimTreeFolderName = { fg = colors.fg },
--         -- NvimTreeSpecialFile = { fg = colors.magenta, underline = true },
--         -- NvimTreeOpenedFolderName = { fg = colors.fg },
--         -- NvimTreeCursorLine = { bg = colors.selection },
--         -- NvimTreeIn = { bg = colors.selection },
--
--         -- NvimTreeEndOfBuffer = endOfBuffer,

--         -- -- NeoTree
--         -- NeoTreeNormal = { fg = colors.fg, bg = colors.menu },
--         -- NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu },
--         -- NeoTreeDirectoryName = { fg = colors.fg },
--         -- NeoTreeGitUnstaged = { fg = colors.bright_magenta },
--         -- NeoTreeGitModified = { fg = colors.bright_magenta },
--         -- NeoTreeGitUntracked = { fg = colors.bright_green },
--         -- NeoTreeDirectoryIcon = { fg = colors.blue },
--         -- NeoTreeIndentMarker = { fg = colors.nontext },
--         -- NeoTreeDotfile = { fg = colors.comment },

--         -- -- Bufferline
--         -- BufferLineIndicatorSelected = { fg = colors.blue },
--         -- BufferLineFill = { bg = colors.black },
--         -- BufferLineBufferSelected = { bg = colors.bg },
--         -- BufferLineSeparator = { fg = colors.black },

--         -- -- LSP
--         -- DiagnosticError = { fg = colors.red },
--         -- DiagnosticWarn = { fg = colors.yellow },
--         -- DiagnosticInfo = { fg = colors.cyan },
--         -- DiagnosticHint = { fg = colors.cyan },
--         -- DiagnosticUnderlineError = { undercurl = true, sp = colors.red },
--         -- DiagnosticUnderlineWarn = { undercurl = true, sp = colors.yellow },
--         -- DiagnosticUnderlineInfo = { undercurl = true, sp = colors.cyan },
--         -- DiagnosticUnderlineHint = { undercurl = true, sp = colors.cyan },
--         -- DiagnosticSignError = { fg = colors.red },
--         -- DiagnosticSignWarn = { fg = colors.yellow },
--         -- DiagnosticSignInfo = { fg = colors.cyan },
--         -- DiagnosticSignHint = { fg = colors.cyan },
--         -- DiagnosticFloatingError = { fg = colors.red },
--         -- DiagnosticFloatingWarn = { fg = colors.yellow },
--         -- DiagnosticFloatingInfo = { fg = colors.cyan },
--         -- DiagnosticFloatingHint = { fg = colors.cyan },
--         -- DiagnosticVirtualTextError = { fg = colors.red },
--         -- DiagnosticVirtualTextWarn = { fg = colors.yellow },
--         -- DiagnosticVirtualTextInfo = { fg = colors.cyan },
--         -- DiagnosticVirtualTextHint = { fg = colors.cyan },
--
--         -- LspDiagnosticsDefaultError = { fg = colors.red },
--         -- LspDiagnosticsDefaultWarning = { fg = colors.yellow },
--         -- LspDiagnosticsDefaultInformation = { fg = colors.cyan },
--         -- LspDiagnosticsDefaultHint = { fg = colors.cyan },
--         -- LspDiagnosticsUnderlineError = { fg = colors.red, undercurl = true },
--         -- LspDiagnosticsUnderlineWarning = { fg = colors.yellow, undercurl = true },
--         -- LspDiagnosticsUnderlineInformation = { fg = colors.cyan, undercurl = true },
--         -- LspDiagnosticsUnderlineHint = { fg = colors.cyan, undercurl = true },
--         -- LspReferenceText = { fg = colors.orange },
--         -- LspReferenceRead = { fg = colors.orange },
--         -- LspReferenceWrite = { fg = colors.orange },
--         -- LspCodeLens = { fg = colors.cyan },
--         -- LspInlayHint = { fg = "#969696", bg = "#2f3146" },

--         -- --LSP Saga
--         -- LspFloatWinNormal = { fg = colors.fg },
--         -- LspFloatWinBorder = { fg = colors.comment },
--         -- LspSagaHoverBorder = { fg = colors.comment },
--         -- LspSagaSignatureHelpBorder = { fg = colors.comment },
--         -- LspSagaCodeActionBorder = { fg = colors.comment },
--         -- LspSagaDefPreviewBorder = { fg = colors.comment },
--         -- LspLinesDiagBorder = { fg = colors.comment },
--         -- LspSagaRenameBorder = { fg = colors.comment },
--         -- LspSagaBorderTitle = { fg = colors.menu },
--         -- LSPSagaDiagnosticTruncateLine = { fg = colors.comment },
--         -- LspSagaDiagnosticBorder = { fg = colors.comment },
--         -- LspSagaShTruncateLine = { fg = colors.comment },
--         -- LspSagaDocTruncateLine = { fg = colors.comment },
--         -- LspSagaLspFinderBorder = { fg = colors.comment },
--         -- CodeActionNumber = { bg = "NONE", fg = colors.cyan },

--         -- -- IndentBlankLine
--         -- IndentBlanklineContextChar = { fg = colors.bright_red, nocombine = true },

--         -- -- Nvim compe
--         -- CmpItemAbbrDeprecated = { fg = colors.white, bg = colors.bg },
--         -- CmpItemAbbrMatch = { fg = colors.cyan, bg = colors.bg },

--         -- -- barbar
--         -- BufferVisibleTarget = { fg = colors.red },
--         -- BufferTabpages = { fg = colors.nontext, bg = colors.black, bold = true },
--         -- BufferTabpageFill = { fg = colors.nontext, bg = colors.black },
--         -- BufferCurrentSign = { fg = colors.blue },
--         -- BufferCurrentTarget = { fg = colors.red },
--         -- BufferInactive = { fg = colors.comment, bg = colors.black, italic = true },
--         -- BufferInactiveIndex = { fg = colors.nontext, bg = colors.black, italic = true },
--         -- BufferInactiveMod = { fg = colors.yellow, bg = colors.black, italic = true },
--         -- BufferInactiveSign = { fg = colors.nontext, bg = colors.black, italic = true },
--         -- BufferInactiveTarget = { fg = colors.red, bg = colors.black, bold = true },

--         -- -- Compe
--         -- CompeDocumentation = { link = "Pmenu" },
--         -- CompeDocumentationBorder = { link = "Pmenu" },

--         -- -- Cmp
--         -- CmpItemAbbr = { fg = colors.white, bg = colors.bg },
--         -- CmpItemKind = { fg = colors.white, bg = colors.bg },
--         -- CmpItemKindMethod = { link = "@function.method" },
--         -- CmpItemKindText = { link = "@markup" },
--         -- CmpItemKindFunction = { link = "@function" },
--         -- CmpItemKindConstructor = { link = "@type" },
--         -- CmpItemKindVariable = { link = "@variable" },
--         -- CmpItemKindClass = { link = "@type" },
--         -- CmpItemKindInterface = { link = "@type" },
--         -- CmpItemKindModule = { link = "@module" },
--         -- CmpItemKindProperty = { link = "@property" },
--         -- CmpItemKindOperator = { link = "@operator" },
--         -- CmpItemKindReference = { link = "@variable.parameter.reference" },
--         -- CmpItemKindUnit = { link = "@variable.member" },
--         -- CmpItemKindValue = { link = "@variable.member" },
--         -- CmpItemKindField = { link = "@variable.member" },
--         -- CmpItemKindEnum = { link = "@variable.member" },
--         -- CmpItemKindKeyword = { link = "@keyword" },
--         -- CmpItemKindSnippet = { link = "@markup" },
--         -- CmpItemKindColor = { link = "DevIconCss" },
--         -- CmpItemKindFile = { link = "TSURI" },
--         -- CmpItemKindFolder = { link = "TSURI" },
--         -- CmpItemKindEvent = { link = "@constant" },
--         -- CmpItemKindEnumMember = { link = "@variable.member" },
--         -- CmpItemKindConstant = { link = "@constant" },
--         -- CmpItemKindStruct = { link = "@structure" },
--         -- CmpItemKindTypeParameter = { link = "@variable.parameter" },

--         -- -- Blink
--         -- BlinkCmpLabel = { fg = colors.white, bg = colors.menu },
--         -- BlinkCmpLabelDeprecated = { fg = colors.white, bg = colors.menu },
--         -- BlinkCmpLabelMatch = { fg = colors.cyan, bg = colors.menu },
--         -- BlinkCmpKind = { fg = colors.white, bg = colors.menu },
--         -- BlinkCmpScrollBarThumb = { bg = colors.fg },
--         -- BlinkCmpScrollBarGutter = { bg = colors.menu },
--         -- BlinkCmpKindFunction = { link = "@function" },
--         -- BlinkCmpKindConstructor = { link = "@type" },
--         -- BlinkCmpKindVariable = { link = "@variable" },
--         -- BlinkCmpKindClass = { link = "@type" },
--         -- BlinkCmpKindInterface = { link = "@type" },
--         -- BlinkCmpKindModule = { link = "@module" },
--         -- BlinkCmpKindProperty = { link = "@property" },
--         -- BlinkCmpKindOperator = { link = "@operator" },
--         -- BlinkCmpKindReference = { link = "@variable.parameter.reference" },
--         -- BlinkCmpKindUnit = { link = "@variable.member" },
--         -- BlinkCmpKindValue = { link = "@variable.member" },
--         -- BlinkCmpKindField = { link = "@variable.member" },
--         -- BlinkCmpKindEnum = { link = "@variable.member" },
--         -- BlinkCmpKindKeyword = { link = "@keyword" },
--         -- BlinkCmpKindSnippet = { link = "@markup" },
--         -- BlinkCmpKindColor = { link = "DevIconCss" },
--         -- BlinkCmpKindFile = { link = "TSURI" },
--         -- BlinkCmpKindFolder = { link = "TSURI" },
--         -- BlinkCmpKindEvent = { link = "@constant" },
--         -- BlinkCmpKindEnumMember = { link = "@variable.member" },
--         -- BlinkCmpKindConstant = { link = "@constant" },
--         -- BlinkCmpKindStruct = { link = "@structure" },
--         -- BlinkCmpKindTypeParameter = { link = "@variable.parameter" },

--         -- -- navic
--         -- NavicIconsFile = { link = "CmpItemKindFile" },
--         -- NavicIconsModule = { link = "CmpItemKindModule" },
--         -- NavicIconsNamespace = { link = "CmpItemKindModule" },
--         -- NavicIconsPackage = { link = "CmpItemKindModule" },
--         -- NavicIconsClass = { link = "CmpItemKindClass" },
--         -- NavicIconsMethod = { link = "CmpItemKindMethod" },
--         -- NavicIconsProperty = { link = "CmpItemKindProperty" },
--         -- NavicIconsField = { link = "CmpItemKindField" },
--         -- NavicIconsConstructor = { link = "CmpItemKindConstructor" },
--         -- NavicIconsEnum = { link = "CmpItemKindEnum" },
--         -- NavicIconsInterface = { link = "CmpItemKindInterface" },
--         -- NavicIconsFunction = { link = "CmpItemKindFunction" },
--         -- NavicIconsVariable = { link = "CmpItemKindVariable" },
--         -- NavicIconsConstant = { link = "CmpItemKindConstant" },
--         -- NavicIconsString = { link = "String" },
--         -- NavicIconsNumber = { link = "Number" },
--         -- NavicIconsBoolean = { link = "Boolean" },
--         -- NavicIconsArray = { link = "CmpItemKindClass" },
--         -- NavicIconsObject = { link = "CmpItemKindClass" },
--         -- NavicIconsKey = { link = "CmpItemKindKeyword" },
--         -- NavicIconsKeyword = { link = "CmpItemKindKeyword" },
--         -- NavicIconsNull = { fg = "blue" },
--         -- NavicIconsEnumMember = { link = "CmpItemKindEnumMember" },
--         -- NavicIconsStruct = { link = "CmpItemKindStruct" },
--         -- NavicIconsEvent = { link = "CmpItemKindEvent" },
--         -- NavicIconsOperator = { link = "CmpItemKindOperator" },
--         -- NavicIconsTypeParameter = { link = "CmpItemKindTypeParameter" },
--         -- NavicText = { fg = "gray" },
--         -- NavicSeparator = { fg = "gray" },

--         -- -- TS rainbow colors
--         -- rainbowcol1 = { fg = colors.fg },
--         -- rainbowcol2 = { fg = colors.magenta },
--         -- rainbowcol3 = { fg = colors.cyan },
--         -- rainbowcol4 = { fg = colors.green },
--         -- rainbowcol5 = { fg = colors.blue },
--         -- rainbowcol6 = { fg = colors.orange },
--         -- rainbowcol7 = { fg = colors.fg },

--         -- -- Rainbow delimiter
--         -- RainbowDelimiterRed = { fg = colors.fg },
--         -- RainbowDelimiterYellow = { fg = colors.magenta },
--         -- RainbowDelimiterBlue = { fg = colors.cyan },
--         -- RainbowDelimiterOrange = { fg = colors.green },
--         -- RainbowDelimiterGreen = { fg = colors.blue },
--         -- RainbowDelimiterViolet = { fg = colors.orange },
--         -- RainbowDelimiterCyan = { fg = colors.fg },

--         -- -- mini.indentscope
--         -- MiniIndentscopeSymbol = { fg = "#B5629B" },
--         -- MiniIndentscopeSymbolOff = { fg = "#B5629B" },

--         -- -- mini.icons
--         -- MiniIconsAzure = { fg = colors.bright_cyan },
--         -- MiniIconsBlue = { fg = colors.bright_blue },
--         -- MiniIconsCyan = { fg = colors.cyan },
--         -- MiniIconsGrey = { fg = colors.white },
--         -- MiniIconsOrange = { fg = colors.orange },
--         -- MiniIconsblue = { fg = colors.blue },
--         -- MiniIconsRed = { fg = colors.red },
--         -- MiniIconsYellow = { fg = colors.yellow },

--         -- -- mini.files
--         -- MiniFilesNormal = { fg = colors.fg, bg = colors.menu },
--         -- MiniFilesBorder = { fg = colors.blue, bg = colors.menu },
--         -- MiniFilesBorderModified = {},
--         -- MiniFilesCursorLine = { bg = colors.selection },
--         -- MiniFilesDirectory = { fg = colors.fg },
--         -- MiniFilesFile = { fg = colors.fg },
--         -- MiniFilesTitle = { fg = colors.fg },
--         -- MiniFilesTitleFocused = { fg = colors.yellow },

--         -- -- goolord/alpha-nvim
--         -- AlphaHeader = { fg = colors.blue },
--         -- AlphaButtons = { fg = colors.cyan },
--         -- AlphaShortcut = { fg = colors.orange },
--         -- AlphaFooter = { fg = colors.blue, italic = true },

--         -- -- nvimdev/dashboard-nvim
--         -- DashboardShortCut = { fg = colors.cyan },
--         -- DashboardHeader = { fg = colors.blue },
--         -- DashboardCenter = { fg = colors.fg },
--         -- DashboardFooter = { fg = colors.blue, italic = true },
--         -- DashboardKey = { fg = colors.orange },
--         -- DashboardDesc = { fg = colors.cyan },
--         -- DashboardIcon = { fg = colors.cyan, bold = true },

--         -- -- dap UI
--         -- DapUIPlayPause = { fg = colors.bright_green },
--         -- DapUIRestart = { fg = colors.green },
--         -- DapUIStop = { fg = colors.red },
--         -- DapUIStepOver = { fg = colors.cyan },
--         -- DapUIStepInto = { fg = colors.cyan },
--         -- DapUIStepOut = { fg = colors.cyan },
--         -- DapUIStepBack = { fg = colors.cyan },
--         -- DapUIType = { fg = colors.bright_blue },
--         -- DapUIScope = { fg = colors.bright_cyan },
--         -- DapUIModifiedValue = { fg = colors.bright_cyan, bold = true },
--         -- DapUIDecoration = { fg = colors.bright_cyan },
--         -- DapUIThread = { fg = colors.bright_green },
--         -- DapUIStoppedThread = { fg = colors.bright_cyan },
--         -- DapUISource = { fg = colors.bright_blue },
--         -- DapUILineNumber = { fg = colors.bright_cyan },
--         -- DapUIFloatBorder = { fg = colors.bright_cyan },
--         -- DapUIWatchesEmpty = { fg = colors.magenta },
--         -- DapUIWatchesValue = { fg = colors.bright_green },
--         -- DapUIWatchesError = { fg = colors.magenta },
--         -- DapUIBreakpointsPath = { fg = colors.bright_cyan },
--         -- DapUIBreakpointsInfo = { fg = colors.bright_green },
--         -- DapUIBreakpointsCurrentLine = { fg = colors.bright_green, bold = true },
--         -- DapStoppedLine = { default = true, link = "Visual" },
--         -- DapUIWinSelect = { fg = colors.bright_cyan, bold = true },

--         -- -- Notify
--         -- NotifyInfoIcon = { fg = colors.green },
--         -- NotifyInfoTitle = { fg = colors.green },
--         -- NotifyInfoBorder = { fg = "#2C453F" },
--         -- NotifyErrorIcon = { fg = colors.red },
--         -- NotifyErrorTitle = { fg = colors.red },
--         -- NotifyErrorBorder = { fg = "#DD6E6B" },
--         -- NotifyWarnIcon = { fg = colors.orange },
--         -- NotifyWarnTitle = { fg = colors.orange },
--         -- NotifyWarnBorder = { fg = "#785637" },

--         -- -- SnacksPicker
--         -- SnacksBackdrop = { link = "FloatShadow" },
--         -- SnacksPickerBorder = { fg = colors.comment },
--         -- SnacksPickerDir = { fg = colors.fg },
--         -- SnacksPickerDirectory = { fg = colors.fg },
--         -- SnacksPickerFile = { fg = colors.fg },
--         -- SnacksPickerGitStatusIgnored = { fg = colors.comment },
--         -- SnacksPickerGitStatusModified = { fg = colors.yellow },
--         -- SnacksPickerGitStatusRenamed = { fg = colors.yellow },
--         -- SnacksPickerGitStatusStaged = { fg = colors.bright_green },
--         -- SnacksPickerGitStatusUnmerged = { fg = colors.orange },
--         -- SnacksPickerGitStatusUntracked = { fg = colors.green },
--         -- SnacksPickerInput = { link = "NormalFloat" },
--         -- SnacksPickerInputBorder = { link = "SnacksPickerBorder" },
--         -- SnacksPickerMatch = { fg = colors.green, italic = true },
--         -- SnacksPickerPathHidden = { fg = colors.comment },
--         -- SnacksPickerPrompt = { fg = colors.blue },
--         -- SnacksPickerTitle = { fg = colors.cyan, bold = true },
--
--         -- -- Neogit
--         -- NeogitDiffAdd = { fg = colors.bright_green, bg = colors.menu },
--         -- NeogitDiffDelete = { fg = colors.bright_red, bg = colors.menu },
--         -- NeogitDiffContext = { fg = colors.comment, bg = colors.visual },
--         -- NeogitDiffAddHighlight = { fg = colors.green, bg = colors.bg },
--         -- NeogitDiffDeleteHighlight = { fg = colors.red, bg = colors.bg },
--         -- NeogitDiffContextHighlight = { fg = colors.comment, bg = colors.visual },
--         -- NeogitDiffAddCursor = { fg = colors.green, bg = colors.selection },
--         -- NeogitDiffDeleteCursor = { fg = colors.red, bg = colors.selection },
--         -- NeogitDiffContextCursor = { fg = colors.comment, bg = colors.selection },
--     }
-- end
--
-- return {
--     setup = setup,
-- }
