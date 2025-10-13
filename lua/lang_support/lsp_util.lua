local M = {}

local ok_cmp, cmp = pcall(require, "cmp_nvim_lsp")
local caps = ok_cmp and cmp.default_capabilities() or {}

function M.root_pattern(patterns)
	return function(buf)
		local path = vim.api.nvim_buf_get_name(buf)
		local found = vim.fs.find(patterns, { upward = true, path = path })[1]
		return found and vim.fs.dirname(found) or vim.uv.cwd()
	end
end

function M.register(server, ft, cfg)
	_G.hetlesaetherTA_lsp_servers = _G.hetlesaetherTA_lsp_servers or {}
	table.insert(_G.hetlesaetherTA_lsp_servers, server)

	if not ft or ft == "" or (cfg and cfg.autostart == false) then
		return
	end

	cfg = cfg or {}
	local name = cfg.name or server
	local cmd = cfg.cmd or { server }
	local root = cfg.root_dir or M.root_pattern({ ".git" })

	local group = vim.api.nvim_create_augroup("LspStart:" .. name, { clear = true })
	vim.api.nvim_create_autocmd("FileType", {
		group = group,
		pattern = ft,
		callback = function(args)
			if next(vim.lsp.get_clients({ bufnr = args.buf, name = name })) then
				return
			end

			local c = vim.deepcopy(cfg)
			c.name = name
			c.cmd = cmd
			c.capabilities = c.capabilities or caps
			c.root_dir = type(root) == "function" and root(args.buf) or root

			vim.lsp.start(c)
		end,
	})
end

return M
