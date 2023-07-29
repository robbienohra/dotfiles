return {
	"mfussenegger/nvim-dap",
	config = function()
		local dap = require "dap"
		dap.adapters.codelldb = {
			type = "server",
			port = "13000",
			host = "127.0.0.1",
			-- executable = {
			--   command = "codelldb",
			--   args = { "--port", "13000" },
			-- },
		}
		dap.configurations.cpp = {
			{
				name = "Launch",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false,
			},
		}

		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = dap.configurations.cpp
	end,
}
