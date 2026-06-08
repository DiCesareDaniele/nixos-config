local function require_servers()
  local servers = {}
  local lsp_dir = vim.fn.stdpath("config") .. "/lua/plugins/lsp"
  local pattern = "%.lua$"
  for file, ft in vim.fs.dir(lsp_dir) do
    if (ft == "file" or ft == "link") and file:match(pattern) then
      local mod = "plugins.lsp." .. file:gsub(pattern, "")
      local ok, tbl = pcall(require, mod)
      if ok and type(tbl) == "table" then
        servers = vim.tbl_deep_extend("force", servers, tbl)
      end
    end
  end
  return servers
end

return {
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local servers = require_servers()
      for server, opts in pairs(servers) do
        vim.lsp.config(server, opts)
        vim.lsp.enable(server)
      end
    end,
  },
}
