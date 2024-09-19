return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			c = { 'clangformat' },
			cpp = { 'clangformat' },
			go = { 'gofmt' },
			javascript = { { 'prettierd', 'prettier' } },
			json5 = { { 'prettierd', 'prettier' } },
			just = { 'just' },
			lua = { 'stylua' },
			python = { 'black' },
			sh = { 'shfmt' },
			tf = { 'terraform_fmt' },
			typescript = { { 'prettierd', 'prettier' } },
			yaml = { 'yamllint' },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,
	},
}
