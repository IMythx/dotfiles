return {
  -- {
  --   "ngtuonghy/live-server-nvim",
  --   event = "VeryLazy",
  --   build = ":LiveServerInstall",
  --   opts = {
  --     custom = {
  --       "--port=5500",
  --       "--no-css-inject",
  --     },
  --     serverPath = vim.fn.stdpath("data") .. "/live-server/", --default
  --     open = "folder", -- folder|cwd     --default
  --   },
  -- },
  {
    "barrett-ruth/live-server.nvim",
    build = "sudo npm i -g live-server",
    cmd = { "LiveServerStart", "LiveServerStop" },
    config = true,
  },
}
