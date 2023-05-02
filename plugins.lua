local plugins = {
  -- 安装平时使用语言的treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- default
        "vim", "lua",

        -- 其他
        "awk", "bash", "comment", "dockerfile", "git_config", "gitignore",
        "ini", "latex", "markdown", "regex", "sql",

        -- 配置格式
        "json", "yaml", "toml",

        -- 前端
        "html", "css", "javascript", "typescript", "tsx", "vue",

        -- python
        "python",

        -- go语言
        "go", "gomod", "gosum",

        -- rust
        "rust",
      },
    },
  },
  -- 覆盖默认的lspconfig
  {
    "neovim/nvim-lspconfig",

    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  -- 使用mason来管理安装lsp文件
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "rust-analyzer",
        "lua-language-server",
        "stylua",
        "gopls",
        "nginx-language-server",
      }
    }
  },
  -- rust自动格式化
  {
    "rust-lang/rust.vim",
    ft = "rust",
    init = function()
      vim.g.rustfmt_autosave = 1
    end
  },
  -- rust-tools
  {
    "simrat39/rust-tools.nvim",
    ft = "rust",
    dependencies = "neovim/nvim-lspconfig",
    opts = function()
      return require "custom.configs.rust-tools"
    end,
    config = function(_, opts)
      require("rust-tools").setup(opts)
    end
  },
  -- rust 调试工具，需要安装lldb
  {
    "mfussenegger/nvim-dap",
  },
  -- rust crates版本管理
  {
    "saecki/crates.nvim",
    ft = { "rust", "toml" },
    config = function(_, opts)
      local crates = require("crates")
      crates.setup(opts)
      crates.show()
    end
  },
  {
    "hrsh7th/nvim-cmp",
    opts = function()
      local M = require "plugins.configs.cmp"
      table.insert(M.sources, { name = "crates" })
      return M
    end,
  }
}

return plugins
