local packer = require("packer")
local use = packer.use

return packer.startup(
  function()
    --update packer manager
    use { "wbthomason/packer.nvim"}

    -- misc
    use { "tpope/vim-commentary" }
    use { "tpope/vim-surround" }
    use { "tpope/vim-fugitive" }
    --use { "jiangmiao/auto-pairs" }

    -- colorscheme
    use { "rktjmp/lush.nvim" }
    --use { "elissonleao/gruvbox.nvim" }
    use {
      "norcalli/nvim-base16.lua",
      requires = {"norcalli/nvim.lua"}
    }

    -- treesitter
    use { 
      "nvim-treesitter/nvim-treesitter",
      requires = {
        "nvim-treesitter/nvim-treesitter-textobjects",
        "windwp/nvim-ts-autotag",
        "windwp/nvim-autopairs",
      },
      run = "TSUpdate",
      config = function()
        require "plugins.configs.treesitter"
      end
    }

    -- lsp
    use { 
      "neovim/nvim-lspconfig",
      config = function()
        require "plugins.configs.lspconfig"
      end
    }

    use {
      "ray-x/lsp_signature.nvim",
      config = function()
        require "lsp_signature".setup()
      end
    }

    use { 
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "onsails/lspkind-nvim",
        "SirVer/ultisnips",
        "quangnguyen30192/cmp-nvim-ultisnips"
      },
      config = function()
        require "plugins.configs.cmp"
      end
    }

    -- go
    -- use { "fatih/vim-go" }
    use {
      "ray-x/go.nvim" ,
      config = function()
        require "plugins.configs.go"
      end
    }

    -- terraform
    use { "hashivim/vim-terraform" }

    -- fuzzy finder
    --use { "nvim-lua/popup.nvim" }
    --use { "nvim-lua/plenary.nvim" }
    use {
      "nvim-telescope/telescope.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-lua/popup.nvim",
      },
      config = function()
        require "plugins.configs.telescope"
      end
    }

    -- tree file
    -- use { "kyazdani42/nvim-web-devicons" }
    use {
      "kyazdani42/nvim-tree.lua",
      requires= { "kyazdani42/nvim-web-devicons" },
      config = function()
        require'nvim-tree'.setup {}
      end
    }

    -- bufferline
    use { "akinsho/nvim-bufferline.lua" }

    use {
      "lukas-reineke/indent-blankline.nvim",
      config = function()
        require "plugins.configs.blankline"
      end
    }

    -- status line
    use {
      "glepnir/galaxyline.nvim",
      config = function()
        require "plugins.configs.statusline"
      end
    }
  end
)
