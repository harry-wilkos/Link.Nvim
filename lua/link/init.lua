local M = {}
function M.setup(opts)
    require("mason").setup({})
    require("mason-lspconfig").setup({})
    require("conform").setup({})
    local processed_fts = {}
    vim.api.nvim_create_autocmd("FileType", {
        callback = function(args)
            local ft = vim.bo[args.buf].filetype
            local bt = vim.bo[args.buf].buftype
            if bt == "" and ft ~= "" and not processed_fts[ft] then
                processed_fts[ft] = true
                require("link.link_class")(opts)
            end
        end,
    })
end
return M
