return {
  -- Désactiver UI lourde et extras non essentiels
  { "folke/noice.nvim", enabled = false },
  { "rcarriga/nvim-notify", enabled = false },
  { "folke/flash.nvim", enabled = false },
  { "nvim-neo-tree/neo-tree.nvim", enabled = false },
  { "akinsho/bufferline.nvim", enabled = false },
  { "goolord/alpha-nvim", enabled = false },
  { "nvim-mini/mini.starter", enabled = false },
  { "folke/trouble.nvim", enabled = false },
  { "folke/persistence.nvim", enabled = false },
  { "folke/edgy.nvim", enabled = false },
  { "lewis6991/gitsigns.nvim", enabled = false }, -- activer si besoin
  { "lukas-reineke/indent-blankline.nvim", enabled = false },
  { "nvim-tree/nvim-web-devicons", enabled = true }, -- garder icônes pour lualine/telescope
  -- Désactiver snippets si non nécessaires
  { "L3MON4D3/LuaSnip", enabled = false },
  { "rafamadriz/friendly-snippets", enabled = false },
  -- Désactiver extras divers
  { "folke/todo-comments.nvim", enabled = false },
  { "folke/which-key.nvim", enabled = true }, -- utile pour découvrir les mappings
  { "stevearc/dressing.nvim", enabled = false },
  { "windwp/nvim-autopairs", enabled = true }, -- utilitaire léger
}
