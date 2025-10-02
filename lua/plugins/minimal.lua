return {
  -- Thème Catppuccin + couleurs LazyVim
  { "catppuccin/nvim", name = "catppuccin", priority = 1000, opts = { flavour = "mocha" } }, -- installe le thème [web:220]
  { "LazyVim/LazyVim", opts = { colorscheme = "catppuccin" } }, -- demande à LazyVim d’utiliser Catppuccin [web:169][web:172]

  -- LSP minimal: Mason + LSPConfig
  -- Note: mason.nvim a migré vers mason-org. Mason 2.0 a des changements; si besoin, pinner sur 1.x. [web:198][web:225]
  {
    "mason-org/mason.nvim",
    -- Charger tôt est recommandé pour gérer PATH et commandes Mason proprement. [web:208]
    lazy = false,
    opts = {},
  },
  {
    "mason-org/mason-lspconfig.nvim",
    -- Optionnel: s'assurer que certains serveurs sont installés automatiquement
    opts = {
      ensure_installed = {
        "bashls",
        "pyright",
        -- tsserver/ts_ls: voir note ci-dessous
        "lua_ls",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = function(_, opts)
      opts = opts or {}
      opts.inlay_hints = { enabled = false }

      -- Compat tsserver -> ts_ls:
      -- nvim-lspconfig a renommé tsserver en ts_ls; selon la version, l’un ou l’autre est attendu. [web:221][web:219]
      -- On enregistre les deux et on laisse celui existant s’activer.
      opts.servers = vim.tbl_deep_extend("force", opts.servers or {}, {
        bashls = {},
        pyright = {},
        tsserver = { enabled = false }, -- conservé désactivé pour compat anciens setups [web:219]
        ts_ls = {}, -- nouveau nom (si dispo dans votre version de lspconfig) [web:221]
        lua_ls = {
          settings = {
            Lua = {
              diagnostics = { globals = { "vim" } },
              workspace = { checkThirdParty = false },
            },
          },
        },
      })

      return opts
    end,
  },

  -- Treesitter minimal
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = { enable = true },
      indent = { enable = true },
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "bash",
        "json",
        "yaml",
        "markdown",
        "python",
        "javascript",
        "typescript",
      },
    },
  },

  -- Telescope (fuzzy find)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
    opts = {
      defaults = { layout_strategy = "horizontal", sorting_strategy = "ascending" },
    },
    keys = {
      { "<leader>ff", function() require("telescope.builtin").find_files() end, desc = "Files" },
      { "<leader>fg", function() require("telescope.builtin").live_grep() end,  desc = "Grep"  },
      { "<leader>fb", function() require("telescope.builtin").buffers() end,   desc = "Buffers" },
      { "<leader>fh", function() require("telescope.builtin").help_tags() end, desc = "Help" },
    },
  },

  -- Statut/barre simple
  { "nvim-lualine/lualine.nvim", opts = { options = { theme = "auto", icons_enabled = true } } },

  -- Utilitaires
  { "numToStr/Comment.nvim", opts = {} },
  { "kylechui/nvim-surround", version = "*", opts = {} },
  { "tpope/vim-sleuth" }, -- détecte indentations
  { "folke/which-key.nvim", opts = {} },
  { "windwp/nvim-autopairs", opts = {} },
}
