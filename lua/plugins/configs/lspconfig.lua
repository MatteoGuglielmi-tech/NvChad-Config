local present, lspconfig = pcall(require, "lspconfig")

if not present then
  return
end

require("base46").load_highlight "lsp"
require "nvchad_ui.lsp"

local M = {}
local utils = require "core.utils"

-- export on_attach & capabilities for custom lspconfigs

M.on_attach = function(client, bufnr)
  client.server_capabilities.documentFormattingProvider = false
  client.server_capabilities.documentRangeFormattingProvider = false

  utils.load_mappings("lspconfig", { buffer = bufnr })

  if client.server_capabilities.signatureHelpProvider then
    require("nvchad_ui.signature").setup(client)
  end
end

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

lspconfig.lua_ls.setup {
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
}

lspconfig.bashls.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings={
    Lua = {
      diagnostics = {
        globals = {"vim"},
      },
    },
  },
}

lspconfig.pyright.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = {"pyright-langserver", "--stdio"},
  settings = {
    python = {
      analysis = {
        typeCheckingMode = "basic",
        diagnosticMode = "workspace",
        inlayHints = {
          variableTypes = true,
          functionReturnTypes = true,
        },
      },
    },
  },
}

lspconfig.texlab.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = {"texlab"},
  settings = {
    texlab = {
      build = {
        args = {
          "-pdf",
          "-interaction=nonstopmode",
          "-synctex=1",
          "%f"
        },
        executable = "latexmk",
        onSave = true,
      },
      chktex = {
        onEdit = true,
        onOpenAndSave = false,
      },
      forwardSearch = {
        executable = "zathura",
        args = {"--synctex-forward", "%1:1:%f", "%p"},
      },
      lint = {
        onChange = true,
      },
      latexFormatter = "latexindent",
      latexindent = {
        modifyLineBreaks = true,
      },
    },
  },

  filetypes = {"tex", "bib", "plaintex"},
  single_file_support = true,
}

lspconfig.marksman.setup{
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = {"marksman"},
  filetypes = {"markdown"},
  single_file_support = true
}

return M
