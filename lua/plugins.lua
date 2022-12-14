local packer = require('packer')
packer.startup({
    function(use)
        -- Packer 可以管理自己本身
        use('wbthomason/packer.nvim')

        -------------------------- plugins -------------------------------------------
        -- nvim-tree
        use({ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' })
        -- bufferline
        use({ 'akinsho/bufferline.nvim', requires = { 'kyazdani42/nvim-web-devicons', 'moll/vim-bbye' } })
        -- lualine
        use({ 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons' } })
        use('arkav/lualine-lsp-progress')
        -- telescope
        use({ 'nvim-telescope/telescope.nvim', requires = { 'nvim-lua/plenary.nvim' } })
        -- telescope extensions
        use('LinArcX/telescope-env.nvim')
        -- dashboard-nvim
        use('glepnir/dashboard-nvim')
        -- project
        use('ahmedkhalf/project.nvim')
        -- treesitter
        use({ 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' })
        -- comment
        use('numToStr/Comment.nvim')
        -- surround
        use('ur4ltz/surround.nvim')
        -- git
        use({ 'lewis6991/gitsigns.nvim' })
        -- nvim-autopairs
        use('windwp/nvim-autopairs')
        --------------------- LSP --------------------
        use('williamboman/nvim-lsp-installer')
        -- Lspconfig
        use({ 'neovim/nvim-lspconfig' })
        ------------------------------------------------------------------------------
        -- 补全引擎
        use('hrsh7th/nvim-cmp')
        -- snippet 引擎
        use('hrsh7th/vim-vsnip')
        -- 补全源
        use('hrsh7th/cmp-vsnip')
        use('hrsh7th/cmp-nvim-lsp') -- { name = nvim_lsp }
        use('hrsh7th/cmp-buffer') -- { name = 'buffer' },
        use('hrsh7th/cmp-path') -- { name = 'path' }
        use('hrsh7th/cmp-cmdline') -- { name = 'cmdline' }
        -- 常见编程语言代码段
        use('rafamadriz/friendly-snippets')
        -- ui
        use('onsails/lspkind-nvim')
        use('tami5/lspsaga.nvim')
        -- indent-blankline
        use('lukas-reineke/indent-blankline.nvim')
        -- 代码格式化
        -- use("mhartington/formatter.nvim")
        use({ 'jose-elias-alvarez/null-ls.nvim', requires = 'nvim-lua/plenary.nvim' })
        -- json增强
        use('b0o/schemastore.nvim')
        -- typescript增强插件
        use({ 'jose-elias-alvarez/nvim-lsp-ts-utils', requires = 'nvim-lua/plenary.nvim' })

        --------------------- colorschemes --------------------
        -- tokyonight
        use('folke/tokyonight.nvim')
        -- OceanicNext
        use('mhartington/oceanic-next')
        -- gruvbox
        use({ 'ellisonleao/gruvbox.nvim', requires = { 'rktjmp/lush.nvim' } })
        -- zephyr 暂时不推荐，详见上边解释
        -- use("glepnir/zephyr-nvim")
        -- nord
        use('shaunsingh/nord.nvim')
        -- onedark
        use('ful1e5/onedark.nvim')
        -- nightfox
        use('EdenEast/nightfox.nvim')
        -------------------------------------------------------
    end,
    config = {
        display = {
            open_fn = function()
                return require('packer.util').float({ border = 'single' })
            end,
        },
    },
})

-- 每次保存 plugins.lua 自动安装插件
pcall(
    vim.cmd,
    [[
    augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
    augroup end
  ]]
)
