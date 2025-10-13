require("colorizer").setup({
	filetypes = { "*" },
	user_default_options = {
		RGB = true,
		RRGGBB = true,
		RRGGBBAA = true,
		names = true,
		rgb_fn = true,
		hsl_fn = true,
		css = true,
		css_fn = true,
		mode = "background", -- or 'background'/'foreground'
	},
})

vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
	callback = function()
		pcall(require("colorizer").attach_to_buffer, 0)
	end,
})

do
	local ok, rd = pcall(require, "rainbow-delimiters")
	if ok then
		vim.g.rainbow_delimiters = {
			strategy = { [""] = rd.strategy.global, vim = rd.strategy["local"] },
			query = { [""] = "rainbow-delimiters", lua = "rainbow-blocks" },
			highlight = {
				"RainbowDelimiter1",
				"RainbowDelimiter2",
				"RainbowDelimiter3",
				"RainbowDelimiter4",
				"RainbowDelimiter5",
				"RainbowDelimiter6",
			},
		}
	end
end

local function set_rainbow_palette()
	local set = vim.api.nvim_set_hl
	local colors = {
		"#89b4fa", -- soft blue
		"#a6e3a1", -- soft green
		"#f9e2af", -- warm sand
		"#fab387", -- peach
		"#cba6f7", -- lavender
		"#94e2d5", -- aqua
	}
	for i, c in ipairs(colors) do
		set(0, ("RainbowDelimiter%d"):format(i), { fg = c })
	end
end

set_rainbow_palette()

do
	local ok, tsc = pcall(require, "treesitter-context")
	if ok then
		tsc.setup({
			max_lines = 3,
			mode = "cursor",
			trim_scope = "inner",
			separator = "-", -- line under the context
		})
	end
end

vim.g.matchup_matchparen_offscreen = { method = "popup" }
vim.g.matchup_matchparen_deferred = 1
vim.g.matchup_surround_enabled = 1

local is_dark = (vim.o.background ~= "light")
local INDENT = is_dark and "#3b3f52" or "#d0d4e0" -- primary guide
local SCOPE = is_dark and "#a6adc8" or "#4c4f69" -- subtle accent

local ok_ibl, ibl = pcall(require, "ibl")
if ok_ibl then
	local ok_hooks, hooks = pcall(require, "ibl.hooks")
	if ok_hooks then
		hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
			vim.api.nvim_set_hl(0, "IblIndent", { fg = INDENT, nocombine = true })
		end)
	end
	ibl.setup({
		indent = { char = "│", highlight = { "IblIndent" } },
		scope = { enabled = false }, -- let mini handle scope line
	})
end

-- mini.indentscope: smart scope line
local ok_mini, mini = pcall(require, "mini.indentscope")
if ok_mini then
	mini.setup({
		symbol = "▏",
		options = { try_as_border = true }, -- pick inner scope when on borders/blank
	})
	vim.api.nvim_set_hl(0, "MiniIndentscopeSymbol", { fg = SCOPE, nocombine = true })
end
