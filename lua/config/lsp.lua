local lspconfig = require("lspconfig")
local cmp_nvim_lsp = require("cmp_nvim_lsp")

-- Set up capabilities for autocompletion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = cmp_nvim_lsp.update_capabilities(capabilities)

-- Configure Pyright language server
lspconfig.pyright.setup({
  capabilities = capabilities,
  on_attach = function(client, bufnr)
    -- Key mappings for LSP functions
    local bufmap = function(mode, lhs, rhs)
      local opts = { buffer = bufnr }
      vim.keymap.set(mode, lhs, rhs, opts)
    end

    -- Define key mappings for common LSP actions
    bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>") -- Go to definition
    bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>") -- Hover documentation
    bufmap("i", "<C-Space>", "<cmd>lua vim.lsp.completion.trigger()<CR>") -- Trigger completion
  end,
})
