return {
  {
    "nvim-telescope/telescope.nvim",
    version = "*",
    dependencies = {
      "nvim-lua/plenary.nvim",
      { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    },
    config = function()
      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
      vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("telescope-lsp-attach", { clear = true }),
        callback = function(event)
          local buf = event.buf

          vim.keymap.set("n", "gr", builtin.lsp_references, { buffer = buf, desc = "Goto References" })
          vim.keymap.set("n", "gi", builtin.lsp_implementations, { buffer = buf, desc = "Goto Implementation" })
          vim.keymap.set("n", "gd", builtin.lsp_definitions, { buffer = buf, desc = "Goto Definition" })
          vim.keymap.set("n", "gs", builtin.lsp_document_symbols, { buffer = buf, desc = "Open Document Symbols" })
          vim.keymap.set(
            "n",
            "gw",
            builtin.lsp_dynamic_workspace_symbols,
            { buffer = buf, desc = "Open Workspace Symbols" }
          )
          vim.keymap.set("n", "gt", builtin.lsp_type_definitions, { buffer = buf, desc = "Goto Type Definition" })
        end,
      })
    end,
  },
}
