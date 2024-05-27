local map = require('utils').map

return {
	{
		'mfussenegger/nvim-dap',
		enabled = true,
		config = function()
			local dap = require 'dap'
			map('n', '<F5>', dap.continue)
			map('n', '<leader>db', dap.toggle_breakpoint)
			map('n', '<leader>dB', dap.set_breakpoint)
			map('n', '<leader>dc', dap.disconnect)
			map('n', '<leader>dk', dap.up)
			map('n', '<leader>dj', dap.down)
			map('n', '<leader>di', dap.step_into)
			map('n', '<leader>do', dap.step_out)
			map('n', '<leader>du', dap.step_over)
			map('n', '<leader>ds', dap.stop)
			map('n', '<leader>dn', dap.run_to_cursor)
			map('n', '<leader>de', dap.set_exception_breakpoints)
			require('dap-python').setup '~/.virtualenvs/debugpy/bin/python'
		end,
		dependencies = { 'mfussenegger/nvim-dap-python' },
	},
	{
		'rcarriga/nvim-dap-ui',
		dependencies = { 'mfussenegger/nvim-dap', 'nvim-neotest/nvim-nio' },
		config = function()
			local ui = require 'dapui'
			map('n', '<S-F5>', ui.open)
			map('n', '<S-F6>', ui.close)
			map('n', '<S-F7>', ui.float_element)
			ui.setup()
		end,
	},
}
