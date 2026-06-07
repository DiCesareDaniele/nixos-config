return {
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    config = function()
      -- https://github.com/nvim-treesitter/nvim-treesitter/blob/main/SUPPORTED_LANGUAGES.md
      local parsers = {
        -- utils
        "vim",
        "vimdoc",
        "query",
        "gitignore",
        -- langs
        "lua",
        "rust",
        "go",
        "python",
        "javascript",
        "typescript",
        -- markup
        "html",
        "css",
        "tsx",
        -- config
        "json",
        "yaml",
        "toml",
      }

      local group = vim.api.nvim_create_augroup("treesitter-start", { clear = true })
      vim.api.nvim_create_autocmd({ "BufEnter", "FileType" }, {
        group = group,
        callback = function()
          if vim.bo.buftype ~= "" then
            return
          end

          pcall(vim.treesitter.start, 0)
        end,
      })

      vim.api.nvim_create_autocmd("User", {
        group = group,
        pattern = "VeryLazy",
        once = true,
        callback = function()
          require("nvim-treesitter").install(parsers)
        end,
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    lazy = false,
    config = function()
      require("nvim-treesitter-textobjects").setup({
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
          },
        },
      })
    end,
  },
}
