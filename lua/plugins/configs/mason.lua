local mason_present, mason = pcall(require, "mason")
if not mason_present then
  return
end

local mason_lsp_present, mason_lspconfig = pcall(require, "mason-lspconfig")
if not mason_lsp_present then
  return
end

local null_mason_present, mason_null_ls = pcall(require, "mason-null-ls")
if not null_mason_present then
  return
end

vim.api.nvim_create_augroup("_mason", { clear = true })
vim.api.nvim_create_autocmd("Filetype", {
  pattern = "mason",
  callback = function()
    require("base46").load_highlight "mason"
  end,
  group = "_mason",
})

local options = {

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = " ",
      package_uninstalled = " ﮊ",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

options = require("core.utils").load_override(options, "williamboman/mason.nvim")

vim.api.nvim_create_user_command("MasonInstallAll", function()
  vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
end, {})

mason.setup(options)

mason_lspconfig.setup({
    ensure_installed = {
        "lua-language-server",
        "clangd",
        "pyright",
        "bashls",
        "texlab",
        "marksman"
    },
    automatic_installation = true
})

mason_null_ls.setup({
    ensure_installed = {
        -- formatters
        "clang_format",
        "stylua",
        "black",
        "isort",

        -- linters
        "gitlint",
        "cpplint",
        "flake8",
        "shellcheck",
        "cspell"
    },
    automatic_installation = true
})

