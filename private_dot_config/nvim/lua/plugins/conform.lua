return {
	'stevearc/conform.nvim',
	event = 'BufWritePre',
	opts = {
		formatters_by_ft = {
			c = { 'clangformat' },
			cpp = { 'clangformat' },
			go = { 'gofmt' },
			javascript = { { 'prettierd', 'prettier' } },
			typescript = { { 'prettierd', 'prettier' } },
			lua = { 'stylua' },
			python = { 'black' },
			sh = { 'shfmt' },
			tf = { 'terraform_fmt' },
			yaml = { 'yamlfmt' },
			just = { 'just' },
		},
		format_on_save = { timeout_ms = 500, lsp_fallback = true },
		notify_on_error = false,
	},
}
