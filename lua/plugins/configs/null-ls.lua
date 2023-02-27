-- import null-ls plugin safely using pcall_handler 
local ok, null_ls = pcall(require, "null-ls")
if not ok then
  return
end

-- creating lists for formatting, diagnostics and code actions 
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local code_actions = null_ls.builtins.code_actions

local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

null_ls.setup({
    -- setup formatters and linters
    sources = {
        ----------------------------------
        --------- FORMATTERS -------------
        ----------------------------------
        formatting.clang_format,
        formatting.stylua,
        formatting.black.with({ extra_args = { "--fast", "--line-length=80" } }),
        formatting.isort,

        ----------------------------------
        ---------- LINTERS ---------------
        ----------------------------------
        diagnostics.gitlint,
        diagnostics.cpplint,
        diagnostics.shellcheck,
        diagnostics.cspell.with({ filetypes = { "markdown", "tex", "tex" } }),

        ----------------------------------
        ---------- CODE ACTIONS ----------
        ----------------------------------
        code_actions.cspell,
    },

-- configure format on save
on_attach = function (current_client, bufnr)
    if current_client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds( { group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd( "BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function ()
                vim.lsp.buf.format({
                    filter = function (client)
                        return client.name == "null-ls"
                    end,
                    bufnr = bufnr,
                })
            end
        })
    end
end
})
