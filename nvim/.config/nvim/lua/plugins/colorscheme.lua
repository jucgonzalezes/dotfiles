return {
  {
    "bluz71/vim-nightfly-colors",
    name = "nightfly",
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.g.nightflyTransparent = true

      require("notify").setup({
        background_colour = "#000000",
      })

      vim.cmd([[colorscheme nightfly]])
    end,
  },
}
