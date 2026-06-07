return {
  {
    "stevearc/conform.nvim",
    config = function()
      require("conform").setup({
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
      })
      vim.keymap.set({ "n", "v" }, "<leader>f", function()
        require("conform").format({ async = true })
      end, { desc = "Format buffer" })
    end,
  },
}
