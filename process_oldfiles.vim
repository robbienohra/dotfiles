" write_oldfiles.vim
" Write v:oldfiles to a specified file

let output_file = expand('$HOME') . '/oldfiles_output.txt'

call writefile(v:oldfiles, output_file)
