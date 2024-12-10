return {
	'L3MON4D3/LuaSnip',
	-- follow latest release.
	version = 'v2.*', -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!).
	build = 'make install_jsregexp',
	config = function()
		local ls = require 'luasnip'
		local s = ls.snippet
		local i = ls.insert_node
		local t = ls.text_node

		-- Define the snippet for wrapping with JSON.stringify
		ls.add_snippets('javascript', {
			s('jstr', {
				t 'JSON.stringify(',
				i(1, 'obj'),
				t ')',
			}),
		})
	end,
}
