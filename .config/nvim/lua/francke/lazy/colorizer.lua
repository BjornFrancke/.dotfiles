return {
  {
    "brenoprata10/nvim-highlight-colors",
    event = "VeryLazy",
    config = function()
      require("nvim-highlight-colors")
    end
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require('colorizer').setup({})
    end
  }
}
