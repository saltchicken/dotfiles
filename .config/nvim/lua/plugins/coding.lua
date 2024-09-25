return {
	{
		"Exafunction/codeium.nvim",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"hrsh7th/nvim-cmp",
		},
		config = function()
			require("codeium").setup({})
		end,
	},
	{
		"danymat/neogen",
		keys = {
			{
				"<leader>cc",
				function()
					require("neogen").generate({})
				end,
				desc = "Neogen Comment",
			},
		},
		opts = { snippet_engine = "luasnip" },
	},

	-- Incremental rename
	{
		"smjonas/inc-rename.nvim",
		cmd = "IncRename",
		config = true,
	},

	-- Refactoring tool
	{
		"ThePrimeagen/refactoring.nvim",
		keys = {
			{
				"<leader>r",
				function()
					require("refactoring").select_refactor()
				end,
				mode = "v",
				noremap = true,
				silent = true,
				expr = false,
			},
		},
		opts = {},
	},

	-- Go forward/backward with square brackets
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},

	-- Better increase/descrease
	{
		"monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<C-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<C-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
		config = function()
			local augend = require("dial.augend")
			require("dial.config").augends:register_group({
				default = {
					augend.integer.alias.decimal,
					augend.integer.alias.hex,
					augend.date.alias["%Y/%m/%d"],
					augend.constant.alias.bool,
					augend.semver.alias.semver,
					augend.constant.new({ elements = { "let", "const" } }),
				},
			})
		end,
	},

	{
		"simrat39/symbols-outline.nvim",
		keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
		cmd = "SymbolsOutline",
		opts = {
			position = "right",
		},
	},

	-- {
	-- 	"nvim-cmp",
	-- 	opts = function()
	-- 		vim.api.nvim_set_hl(0, "CmpGhostText", { link = "Comment", default = true })
	-- 		local cmp = require("cmp")
	-- 		local defaults = require("cmp.config.default")()
	-- 		local auto_select = true
	-- 		return {
	-- 			auto_brackets = {}, -- configure any filetype to auto add brackets
	-- 			completion = {
	-- 				completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
	-- 			},
	-- 			preselect = auto_select and cmp.PreselectMode.Item or cmp.PreselectMode.None,
	-- 			mapping = cmp.mapping.preset.insert({
	-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
	-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
	-- 				["<C-Space>"] = cmp.mapping.complete(),
	-- 				["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
	-- 				["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
	-- 				["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	-- 				["<C-CR>"] = function(fallback)
	-- 					cmp.abort()
	-- 					fallback()
	-- 				end,
	-- 			}),
	-- 			sources = cmp.config.sources({
	-- 				{ name = "codeium" },
	-- 				{ name = "nvim_lsp" },
	-- 				{ name = "path" },
	-- 			}, {
	-- 				{ name = "buffer" },
	-- 			}),
	-- 			formatting = {
	-- 				format = function(entry, item)
	-- 					local icons = LazyVim.config.icons.kinds
	-- 					if icons[item.kind] then
	-- 						item.kind = icons[item.kind] .. item.kind
	-- 					end
	--
	-- 					local widths = {
	-- 						abbr = vim.g.cmp_widths and vim.g.cmp_widths.abbr or 40,
	-- 						menu = vim.g.cmp_widths and vim.g.cmp_widths.menu or 30,
	-- 					}
	--
	-- 					for key, width in pairs(widths) do
	-- 						if item[key] and vim.fn.strdisplaywidth(item[key]) > width then
	-- 							item[key] = vim.fn.strcharpart(item[key], 0, width - 1) .. "…"
	-- 						end
	-- 					end
	--
	-- 					return item
	-- 				end,
	-- 			},
	-- 			experimental = {
	-- 				ghost_text = {
	-- 					hl_group = "CmpGhostText",
	-- 				},
	-- 			},
	-- 			sorting = defaults.sorting,
	-- 		}
	-- 	end,
	-- },

	-- {
	-- 	"nvim-cmp",
	-- 	dependencies = { "hrsh7th/cmp-emoji" },
	-- 	opts = function(_, opts)
	-- 		table.insert(opts.sources, { name = "emoji" })
	-- 	end,
	-- },
	{
		"hrsh7th/nvim-cmp",
		experimental = {
			ghost_text = true,
			-- ghost_text = {
			-- 	hl_group = "CmpGhostText",
			-- },
		},
		opts = function(_, opts)
			opts.completion.autocomplete = false
			-- 			mapping = cmp.mapping.preset.insert({
			-- 				["<C-b>"] = cmp.mapping.scroll_docs(-4),
			-- 				["<C-f>"] = cmp.mapping.scroll_docs(4),
			-- 				["<C-Space>"] = cmp.mapping.complete(),
			-- 				["<CR>"] = LazyVim.cmp.confirm({ select = auto_select }),
			-- 				["<C-y>"] = LazyVim.cmp.confirm({ select = true }),
			-- 				["<S-CR>"] = LazyVim.cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
			-- 				["<C-CR>"] = function(fallback)
			-- 					cmp.abort()
			-- 					fallback()
			-- 				end,
			-- 			}),
			-- opts.mapping["<CR>"] = nil
			-- local auto_select = true
			-- opts.completion = {
			-- 	completeopt = "menu,menuone,noinsert" .. (auto_select and "" or ",noselect"),
			-- }
			opts.mapping["<Esc>"] = function(fallback)
				local cmp = require("cmp")
				-- print("escape pressed")
				cmp.abort()
				fallback()
			end
			opts.window = {
				completion = {
					border = {
						{ "󱐋", "WarningMsg" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
					winblend = 0,
				},
				documentation = {
					border = {
						{ "󰙎", "DiagnosticHint" },
						{ "─", "Comment" },
						{ "╮", "Comment" },
						{ "│", "Comment" },
						{ "╯", "Comment" },
						{ "─", "Comment" },
						{ "╰", "Comment" },
						{ "│", "Comment" },
					},
					scrollbar = false,
					winblend = 0,
				},
			}
			opts.sources = {
				{ name = "codeium" },
				-- { name = "custom_source" },
				{ name = "nvim_lsp", max_item_count = 2 },
				{ name = "nvim_lua", max_item_count = 2 },
				{ name = "luasnip", max_item_count = 2 },
				{ name = "buffer", max_item_count = 2 },
				{ name = "path", max_item_count = 2 },
				{ name = "emoji", max_item_count = 2 },
			}
			-- opts.formatting = {
			-- 	format = function(entry, item)
			-- 		item.menu = ({
			-- 			nvim_lsp = "[LSP]",
			-- 			buffer = "[Buffer]",
			-- 			path = "[Path]",
			-- 			custom_source = "[Custom]",
			-- 		})[entry.source.name]
			-- 		return item
			-- 	end,
			-- }
		end,
	},
}
