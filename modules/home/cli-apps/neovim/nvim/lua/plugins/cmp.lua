return {
  {
    "saghen/blink.cmp",
    -- TODO: upgrade to version 2
    version = "1.*",
    dependencies = {
      "rafamadriz/friendly-snippets",
    },
    opts = {
      completion = {
        keyword = { range = "full" },

        accept = { auto_brackets = { enabled = false } },

        list = { selection = { preselect = false, auto_insert = true } },

        menu = {
          auto_show = true,

          draw = {
            columns = {
              { "label", "label_description", gap = 1 },
              { "kind_icon", "kind" },
            },
          },
        },

        documentation = { auto_show = true, auto_show_delay_ms = 500 },

        ghost_text = { enabled = true },
      },

      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
