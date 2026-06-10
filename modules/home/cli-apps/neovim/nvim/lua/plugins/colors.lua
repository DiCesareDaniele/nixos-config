return {
  {
    "RRethy/base16-nvim",
    lazy = false,
    priority = 1000,
    config = function()
      local base = {
        base00 = "#000000",
        base01 = "#121212",
        base02 = "#222222",
        base03 = "#333333",
        base04 = "#999999",
        base05 = "#c1c1c1",
        base06 = "#999999",
        base07 = "#c1c1c1",
        base08 = "#5f8787",
        base09 = "#aaaaaa",
        base0A = "#79241f",
        base0B = "#f8f7f2",
        base0C = "#aaaaaa",
        base0D = "#888888",
        base0E = "#999999",
        base0F = "#444444",
      }

      local base16 = require("base16-colorscheme")
      base16.setup(base, {
        telescope = true,
        telescope_borders = true,
      })

      --  waiting for https://github.com/RRethy/base16-nvim/pull/115 to be approved
      local hi = base16.highlight
      hi.BlinkCmpMenu = {
        guifg = base.base05,
        guibg = base.base01,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm01,
      }
      hi.BlinkCmpMenuBorder = {
        guifg = base.base05,
        guibg = base.base00,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm00,
      }
      hi.BlinkCmpMenuSelection = {
        guifg = base.base05,
        guibg = base.base02,
        gui = "bold",
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm02,
      }
      hi.BlinkCmpScrollBarThumb = {
        guifg = nil,
        guibg = base.base03,
        gui = nil,
        guisp = nil,
        ctermfg = nil,
        ctermbg = base.cterm03,
      }
      hi.BlinkCmpScrollBarGutter = {
        guifg = nil,
        guibg = base.base01,
        gui = nil,
        guisp = nil,
        ctermfg = nil,
        ctermbg = base.cterm01,
      }
      hi.BlinkCmpLabel = {
        guifg = base.base05,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = nil,
      }
      hi.BlinkCmpLabelDeprecated = {
        guifg = base.base03,
        guibg = nil,
        gui = "strikethrough",
        guisp = nil,
        ctermfg = base.cterm03,
        ctermbg = nil,
      }
      hi.BlinkCmpLabelMatch = {
        guifg = base.base0D,
        guibg = nil,
        gui = "bold",
        guisp = nil,
        ctermfg = base.cterm0D,
        ctermbg = nil,
      }
      hi.BlinkCmpLabelMatch = {
        guifg = base.base04,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm04,
        ctermbg = nil,
      }
      hi.BlinkCmpLabelDescription = {
        guifg = base.base04,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm04,
        ctermbg = nil,
      }
      hi.BlinkCmpKind = {
        guifg = base.base05,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = nil,
      }
      hi.BlinkCmpKindKeyword = {
        guifg = base.base0E,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0E,
        ctermbg = nil,
      }
      hi.BlinkCmpKindVariable = {
        guifg = base.base08,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm08,
        ctermbg = nil,
      }
      hi.BlinkCmpKindConstant = {
        guifg = base.base09,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm09,
        ctermbg = nil,
      }
      hi.BlinkCmpKindReference = {
        guifg = base.base08,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm08,
        ctermbg = nil,
      }
      hi.BlinkCmpKindValue = {
        guifg = base.base09,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm09,
        ctermbg = nil,
      }
      hi.BlinkCmpKindFunction = {
        guifg = base.base0D,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0D,
        ctermbg = nil,
      }
      hi.BlinkCmpKindMethod = {
        guifg = base.base0D,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0D,
        ctermbg = nil,
      }
      hi.BlinkCmpKindConstructor = {
        guifg = base.base0D,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0D,
        ctermbg = nil,
      }
      hi.BlinkCmpKindClass = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindInterface = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindStruct = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindEvent = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindEnum = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindUnit = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindModule = {
        guifg = base.base05,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = nil,
      }
      hi.BlinkCmpKindProperty = {
        guifg = base.base08,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm08,
        ctermbg = nil,
      }
      hi.BlinkCmpKindField = {
        guifg = base.base08,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm08,
        ctermbg = nil,
      }
      hi.BlinkCmpKindTypeParameter = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindEnumMember = {
        guifg = base.base0A,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0A,
        ctermbg = nil,
      }
      hi.BlinkCmpKindOperator = {
        guifg = base.base05,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = nil,
      }
      hi.BlinkCmpKindSnippet = {
        guifg = base.base04,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm04,
        ctermbg = nil,
      }
      hi.BlinkCmpSource = {
        guifg = base.base04,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm04,
        ctermbg = nil,
      }
      hi.BlinkCmpGhostText = {
        guifg = base.base03,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm03,
        ctermbg = nil,
      }
      hi.BlinkCmpDoc = {
        guifg = base.base05,
        guibg = base.base00,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm00,
      }
      hi.BlinkCmpDocBorder = {
        guifg = base.base05,
        guibg = base.base00,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm00,
      }
      hi.BlinkCmpDocSeparator = {
        guifg = base.base03,
        guibg = nil,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm03,
        ctermbg = nil,
      }
      hi.BlinkCmpDocCursorLine = {
        guifg = nil,
        guibg = base.base02,
        gui = nil,
        guisp = nil,
        ctermfg = nil,
        ctermbg = base.cterm02,
      }
      hi.BlinkCmpSignatureHelp = {
        guifg = base.base05,
        guibg = base.base00,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm00,
      }
      hi.BlinkCmpSignatureHelpBorder = {
        guifg = base.base05,
        guibg = base.base00,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm05,
        ctermbg = base.cterm00,
      }
      hi.BlinkCmpSignatureHelpActiveParameter = {
        guifg = base.base0D,
        guibg = base.base02,
        gui = nil,
        guisp = nil,
        ctermfg = base.cterm0D,
        ctermbg = base.cterm02,
      }

      local hilights = {
        -- Transparent background
        Normal = { bg = "none" },
        NormalNC = { bg = "none" },
        -- NormalFloat = { bg = "none" },
      }

      -- Apply hlights
      for group, colors in pairs(hilights) do
        vim.api.nvim_set_hl(0, group, colors)
      end
    end,
  },
}
