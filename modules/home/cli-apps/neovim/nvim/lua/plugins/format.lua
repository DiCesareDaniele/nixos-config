return {
  {
    "stevearc/conform.nvim",
    lazy = true,
    keys = {
      {
        "<leader>f",
        function()
          require("conform").format({ async = true })
        end,
        { desc = "Format buffer" },
      },
    },
    opts = {
      formatters_by_ft = {
        lua = { "stylua" },
        rust = { "rustfmt" },
        go = { "gofmt" },
        python = { "black" },
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
      },
      formatters = {
        stylua = {
          append_args = { "--indent-type", "Spaces", "--indent-width", "2" },
        },
      },
    },
  },
}
