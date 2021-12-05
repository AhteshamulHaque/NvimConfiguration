local M = {}
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
end

local packer = require("packer")

function M.update()
  vim.cmd([[ PackerCompile ]])
  vim.cmd([[ PackerSync ]])
end

packer.startup({
  config = {
    compile_path = fn.stdpath("config") .. "/lua/my_packer.lua",
    display = {
      open_fn = function()
        return require("packer.util").float({ border = vim.g.border_chars })
      end,
    },
    profile = { enable = 1 },
  },
  function(use)
    use({ "lukas-reineke/indent-blankline.nvim", config = "require('config.indentline').post()" })
    use({ "nvim-neorg/neorg", config = "require('config.org').post()" })
    use({ "Vimjas/vim-python-pep8-indent" })
    use({ "lewis6991/impatient.nvim" })
    use({ "jose-elias-alvarez/null-ls.nvim" })
    use({ "rcarriga/nvim-notify", config = "require('config.notify').post()" })
    use({
      "folke/twilight.nvim",
      requires = { "folke/zen-mode.nvim", config = "require('config.zen').post()" },
    })
    use({
      "sindrets/diffview.nvim",
      requires = { "lewis6991/gitsigns.nvim" },
      config = "require('config.git').post()",
    })
    use({ "iamcco/markdown-preview.nvim", run = "cd app && yarn install" })
    use({ "MTDL9/vim-log-highlighting" })
    use({ "NTBBloodbath/galaxyline.nvim", config = "require('config.galaxyline').post()" })
    use({ "godlygeek/tabular", cmd = "Tabularize" })
    use({ "kkoomen/vim-doge", cmd = "DogeGenerate", run = ":call doge#install()" })
    use({ "kyazdani42/nvim-tree.lua", config = "require('config.filetree').post()" })
    use({ "machakann/vim-sandwich" })
    use({
      "neovim/nvim-lspconfig",
      config = "require('config.lsp').post()",
      requires = {
        "williamboman/nvim-lsp-installer",
        "nvim-lua/lsp-status.nvim",
        "folke/lua-dev.nvim",
        "ray-x/lsp_signature.nvim",
      },
    })
    use({ "neovimhaskell/haskell-vim" })
    use({
      "rcarriga/vim-ultest",
      config = "require('config.ultest').post()",
      keys = {
        "<Plug>(ultest-run-nearest)",
        "<Plug>(ultest-run-file)",
      },
      cmd = { "UltestSummary" },
      requires = { "janko/vim-test", cmd = { "TestNearest", "TestFile" } },
    })
    use({ "rhysd/git-messenger.vim", keys = "<leader>gm" })
    use({ "romgrk/barbar.nvim", config = "require('config.barbar').post()" })
    use({ "rrethy/vim-hexokinase", run = "make hexokinase", cmd = "HexokinaseTurnOn" })
    use({ "simnalamburt/vim-mundo", cmd = "MundoToggle" })
    use({ "svermeulen/vim-subversive" })
    use({ "JoosepAlviste/nvim-ts-context-commentstring", requires = { "tpope/vim-commentary" } })
    use({ "tpope/vim-abolish", cmd = "S" })
    use({ "tpope/vim-eunuch", cmd = { "Rename", "Delete", "Remove", "Chmod" } })
    use({
      "tpope/vim-fugitive",
      requires = { { "tpope/vim-rhubarb" }, { "shumphrey/fugitive-gitlab.vim" } },
    })
    use({ "tpope/vim-unimpaired" })
    use({ "voldikss/vim-floaterm", cmd = "FloatermNew" })
    use({ "wbthomason/packer.nvim" })
    use({ "wellle/targets.vim", requires = { "wellle/line-targets.vim" } })
    use({
      "nvim-telescope/telescope.nvim",
      config = "require('config.telescope').post()",
      requires = {
        { "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
        { "nvim-lua/popup.nvim" },
        { "nvim-lua/plenary.nvim" },
        {'yamatsum/nvim-nonicons',},
        { "kyazdani42/nvim-web-devicons" },
      },
    })
    use({
      "mfussenegger/nvim-dap",
      config = "require('config.dap').post()",
      requires = {
        { "mfussenegger/nvim-dap-python" },
        { "rcarriga/nvim-dap-ui" },
      },
    })
    use({
      "nvim-treesitter/nvim-treesitter",
      config = "require('config.treesitter').post()",
      requires = {
        { "nvim-treesitter/playground" },
        { "nvim-treesitter/nvim-treesitter-textobjects" },
        { "nvim-treesitter/nvim-treesitter-refactor" },
        { "mfussenegger/nvim-ts-hint-textobject" },
      },
    })
    use({
      "hrsh7th/nvim-cmp",
      config = "require('config.completion').post()",
      requires = {
        "onsails/lspkind-nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip",
        "lukas-reineke/cmp-rg",
      },
    })
  end,
})
return M