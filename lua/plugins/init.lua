return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  -- mason 配置：自动安装 lsp 服务
  {
    "williamboman/mason.nvim",
    opts = function()
      return require "configs.mason"
    end,
  },
  -- lsp 配置
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  -- rust.vim 自动格式化
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end,
  },
  -- rust工具箱
  {
    "mrcjkb/rustaceanvim",
    version = "^4",
    ft = "rust",
    config = function(_, _)
      vim.g.rustaceanvim = {
        server = {
          on_attach = require("nvchad.configs.lspconfig").on_attach,
        }
      }
    end
  },
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function()
      require("crates").setup()
    end,
  },
  -- debug工具
  {
    "mfussenegger/nvim-dap",
  },
}
