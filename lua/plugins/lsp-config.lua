return {
  {
    "mason-org/mason.nvim",
    opts = {}
  },
  {
      "mason-org/mason-lspconfig.nvim",
      opts = {
        ensure_installed =  { "lua_ls", "pyright" }
      },
      dependencies = {
          { "mason-org/mason.nvim", opts = {} },
          "neovim/nvim-lspconfig",
      },
  },
  {
    "neovim/nvim-lspconfig"
  }
}
