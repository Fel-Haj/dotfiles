return {
  { "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      transparent_background = true,
    },
  },
  { "f-person/auto-dark-mode.nvim",
    opts = {
      update_interval = 1000,
      set_light_mode = function()
        vim.api.nvim_set_option_value("background", "light", {})
      end,
      set_dark_mode = function()
        vim.api.nvim_set_option_value("background", "dark", {})
      end,
    },
  },
}
