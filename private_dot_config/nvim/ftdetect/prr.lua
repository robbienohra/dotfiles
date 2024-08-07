vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufRead' }, {
	pattern = '*.prr',
	callback = function()
		vim.b.current_syntax = 'prr'
		vim.bo.filetype = 'prr'

		vim.cmd [[
			syn region prrFile start=/^> diff/ end=/^> diff/ms=s-1,me=s-1 transparent fold keepend contains=prrHeader,prrIndex,prrChunk
			syn region prrChunk start=/^> @@/ start=/^\n> /rs=e-2 end=/^> @@/ms=s-1,me=s-1 end=/^> diff/ms=s-1,me=s-1 end=/^$/ transparent fold keepend contains=CONTAINED,prrTag
			syn match prrAdded   contained "^> +.*"
			syn match prrRemoved contained "^> -.*"
			syn match prrHeader contained "^> diff.*"
			syn match prrIndex contained "^> index.*"
			syn match prrChunkH contained "^> @@.*"

			syn match prrTag "^@.*" contains=prrTagName,prrResult transparent

			syn match prrTagName contained "@prr" nextgroup=prrResult
			syn keyword prrResult contained approve reject comment
			hi def link prrAdded           Identifier
			hi def link prrRemoved         Special

			hi def link prrTagName Keyword
			hi def link prrResult String
			hi def link prrHeader Include
			hi def link prrIndex Comment
			hi def link prrChunkH Function
			let b:current_syntax = "prr"
		]]
	end,
})
