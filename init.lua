-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("lazy").setup({
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
      vim.o.background = "dark"
    end,
    ft = "markdown", -- Load this plugin only for markdown files
  },
})
return {
  {
    "nvim-tree/nvim-tree.lua",
    lazy = false,
    dependencies = { "nvim-tree/nvim-web-devicons" }, -- Add devicons as a dependency
    config = function()
      require("nvim-tree").setup({
        -- Your nvim-tree configuration here
      })
    end,
  },
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true, -- This enables lazy loading for devicons
  },
  -- Other plugins can be added here as needed
}
