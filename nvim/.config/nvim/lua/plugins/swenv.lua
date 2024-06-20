return {
  {
    "AckslD/swenv.nvim",
    config = function()
      require("swenv").setup({
        get_venvs = function(venvs_path)
          return require("swenv.api").get_venvs(venvs_path)
        end,
        venvs_path = vim.fn.expand("/Users/jucgonzalezes/miniforge3/envs"),
        post_set_env = nil,
      })
    end,
  },
}
