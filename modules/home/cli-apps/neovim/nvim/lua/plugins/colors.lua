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
      require("base16-colorscheme").setup(base)

      local highlights = {
        -- TODO: switch to blink.cmp
        -- nvim-cmp
        -- CmpItemKindSnippet = { fg = base.base01, bg = base.base0E },
        -- CmpItemKindKeyword = { fg = base.base01, bg = base.base08 },
        -- CmpItemKindText = { fg = base.base01, bg = base.base0C },
        -- CmpItemKindMethod = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindConstructor = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindFunction = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindFolder = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindModule = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindConstant = { fg = base.base01, bg = base.base0A },
        -- CmpItemKindField = { fg = base.base01, bg = base.base0B },
        -- CmpItemKindProperty = { fg = base.base01, bg = base.base0B },
        -- CmpItemKindEnum = { fg = base.base01, bg = base.base0B },
        -- CmpItemKindUnit = { fg = base.base01, bg = base.base0B },
        -- CmpItemKindClass = { fg = base.base01, bg = base.base09 },
        -- CmpItemKindVariable = { fg = base.base01, bg = base.base0F },
        -- CmpItemKindFile = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindInterface = { fg = base.base01, bg = base.base09 },
        -- CmpItemKindColor = { fg = base.base01, bg = base.base08 },
        -- CmpItemKindReference = { fg = base.base01, bg = base.base08 },
        -- CmpItemKindEnumMember = { fg = base.base01, bg = base.base08 },
        -- CmpItemKindStruct = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindValue = { fg = base.base01, bg = base.base0A },
        -- CmpItemKindEvent = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindOperator = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindTypeParameter = { fg = base.base01, bg = base.base0D },
        -- CmpItemKindCopilot = { fg = base.base01, bg = base.base0C },

        -- Telescope
        TelescopeMatching = { fg = base.base0E },
        TelescopeSelection = { fg = base.base05, bg = base.base01, bold = true },
        TelescopePromptPrefix = { fg = base.base08 },
        TelescopePromptNormal = { bg = base.base01 },
        TelescopeResultsNormal = { bg = base.base00 },
        TelescopePreviewNormal = { bg = base.base00 },
        TelescopePromptBorder = { bg = base.base01, fg = base.base01 },
        TelescopeResultsBorder = { bg = base.base00, fg = base.base00 },
        TelescopePreviewBorder = { bg = base.base00, fg = base.base00 },
        TelescopePromptTitle = { bg = base.base08, fg = base.base00 },
        TelescopeResultsTitle = { fg = base.base00 },
        TelescopePreviewTitle = { bg = base.base0B, fg = base.base00 },

        -- Transparent background
        Normal = { bg = "none" },
        NormalFloat = { bg = "none" },
      }

      -- Apply highlights
      for group, colors in pairs(highlights) do
        vim.api.nvim_set_hl(0, group, colors)
      end
    end,
  },
}
