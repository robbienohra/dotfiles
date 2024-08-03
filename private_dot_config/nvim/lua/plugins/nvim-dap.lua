local map = require('utils').map

return {
	{
		'mfussenegger/nvim-dap',
		enabled = true,
		config = function()
			-- https://github.com/tjdevries/config.nvim/blob/master/lua/custom/plugins/dap.lua
			local dap = require 'dap'
			local ui = require 'dapui'
			require('dapui').setup()
			require('dap-python').setup '~/.virtualenvs/debugpy/bin/python'
			map('n', '<F5>', dap.continue)
			map('n', '<F10>', dap.step_over)
			map('n', '<F11>', dap.step_into)
			map('n', '<F12>', dap.step_out)
			map('n', '<leader>b', dap.toggle_breakpoint)
			map('n', '<leader>B', dap.set_breakpoint)
			map('n', '<leader>lp', function()
				dap.set_breakpoint(nil, nil, vim.fn.input 'Log point message: ')
			end)
			map('n', '<leader>dr', dap.repl.open)
			map('n', '<leader>dl', dap.run_last)
			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				ui.close()
			end
		end,
		dependencies = { 'rcarriga/nvim-dap-ui', 'nvim-neotest/nvim-nio', 'mfussenegger/nvim-dap-python' },
	},
}
