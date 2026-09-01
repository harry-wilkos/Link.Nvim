local M = {}

local has_initialized_globals = false

function M.setup(opts)
	local processed_fts = {}

	vim.api.nvim_create_autocmd("FileType", {
		callback = function(args)
			local ft = vim.bo[args.buf].filetype
			if
				vim.bo[args.buf].buftype == ""
				and ft ~= ""
				and vim.api.nvim_buf_get_name(args.buf) ~= ""
				and not processed_fts[ft]
			then
				processed_fts[ft] = true
				vim.schedule(function()
					if not has_initialized_globals then
						require("mason").setup({})
						require("mason-lspconfig").setup({})
						require("conform").setup({})
						has_initialized_globals = true
					end
					require("link.link_class")(opts)
				end)
			end
		end,
	})
end

return M
