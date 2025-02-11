function ColorMyPencils(color)
  color = color or "rose-pine-moon"
  vim.cmd.colorscheme(color)

  vim.opt.guifont = "JetBrains Mono:h12"

  -- Set transparent background
  vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

  -- Neo-tree specific highlights
  vim.api.nvim_set_hl(0, "NeoTreeNormal", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeNormalNC", { bg = "none" })
  vim.api.nvim_set_hl(0, "NeoTreeFileName", { fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "NeoTreeDirectoryName", { fg = "#a3be8c" })

  -- Explicitly set comment colors and style
  vim.api.nvim_set_hl(0, "Comment", {
    fg = "#FDFBD4", -- A muted taupe
    italic = true, -- Ensure italics are applied
  })

  -- Type Definitions
  vim.api.nvim_set_hl(0, "@lsp.type.type", { fg = "#e5c07b" })
  vim.api.nvim_set_hl(0, "@type.definition", { fg = "#e5c07b", bold = true })

  -- Cursor line highlight
  vim.api.nvim_set_hl(0, "CursorLine", { bg = "#3e4451" })
end

return {
  {
    "erikbackman/brightburn.vim",
  },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()
      require("rose-pine").setup({
        disable_background = true,
        styles = {
          italic = true, -- Explicitly enable italics
          comments = { italic = true }, -- Additional comment italic setting
        },
        highlight_groups = {
          -- Override comment highlight to ensure visibility
          Comment = { fg = "#5c6370", italic = true },
        },
      })
      ColorMyPencils()
    end,
  },
  {
    "folke/tokyonight.nvim",
    config = function()
      require("tokyonight").setup({
        style = "storm",
        transparent = true,
        terminal_colors = true,
        styles = {
          comments = { italic = true, fg = "#928374" },
          keywords = { italic = false },
          sidebars = "dark",
          floats = "dark",
        },
        on_highlights = function(hl, c)
          hl.Comment = {
            fg = "#928374", -- Bright magenta color
            italic = true, -- Ensure italic style
          }
          hl.CursorLine = { bg = "#3e4451" }
          hl.CursorColumn = { bg = "#3e4451" }
        end,
      })
    end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    config = function()
      require("gruvbox").setup({
        terminal_colors = true,
        undercurl = true,
        bold = true,
        italic = {
          strings = false,
          emphasis = false,
          comments = true, -- Enable italic comments
          operators = false,
          folds = false,
        },
        overrides = {
          Comment = { italic = true }, -- Ensure comment italics
        },
      })
    end,
  },
}
