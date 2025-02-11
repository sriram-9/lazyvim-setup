return {
  -- Markdown Preview Plugin
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      require("lazy").load({ plugins = { "markdown-preview.nvim" } })
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      { "<leader>cp", "<cmd>MarkdownPreviewToggle<cr>", desc = "Toggle Markdown Preview", mode = "n" },
    },
  },

  -- Render Markdown Plugin
  {
    "MeanderingProgrammer/render-markdown.nvim",
    opts = {
      code = { sign = false, width = "block", right_pad = 1 },
      heading = { sign = false, icons = {} },
    },
    ft = { "markdown", "norg", "rmd", "org" },
    config = function(_, opts)
      require("render-markdown").setup(opts)
    end,
  },

  -- Linting and Formatting
  {
    "mfussenegger/nvim-lint",
    opts = {
      linters = {
        markdownlint = { args = { "--config", "~/.markdownlint.jsonc", "--" } },
      },
    },
  },

  -- Optional: Prettier and markdownlint-cli2 for formatting
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = { "prettier", "markdownlint-cli2" },
        ["markdown.mdx"] = { "prettier", "markdownlint-cli2" },
      },
    },
  },
}
