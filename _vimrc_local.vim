if debug_mikko
   echom 'Entering ~/emediate/_vimrc_local.vim'
endif

augroup LOCAL_SETUP
	 "using vim-addon-sql providing alias aware SQL completion for .sql files and PHP:
	 "autocmd BufRead,BufNewFile *.sql,*.php call vim_addon_sql#Connect('mysql',{'database':'DATABASE', 'user':'USER', 'password' : 'PASSWORD'})
	
	 "for php use tab as indentation character. Display a tab as 4 spaces:
	 "autocmd BufRead,BufNewFile *.php set noexpandtab| set tabstop=4 | set sw=4
	 "autocmd FileType php setlocal noexpandtab| setlocal tabstop=4 | setlocal sw=4
	
   "hint: for indentation settings modelines can be an alternative as well as
	"various plugins trying to set vim's indentation based on file contents.
augroup end
set tabstop=3
set expandtab
set shiftwidth=3
set autoindent
set smartindent
set cindent



" SYNTAX CHECK
call vam#ActivateAddons(['Syntastic'], {'force_loading_plugins_now': 1})

"In order to check header files add this to your .vimrc:
let g:syntastic_c_check_header = 1
let g:syntastic_cpp_check_header = 1

"To disable the search of included header files after special libraries like gtk and glib add this line to your .vimrc:
let g:syntastic_c_no_include_search = 1
let g:syntastic_cpp_no_include_search = 1

"To disable the include of the default include dirs (such as /usr/include) add this line to your .vimrc:
let g:syntastic_c_no_default_include_dirs = 1
let g:syntastic_cpp_no_default_include_dirs = 1

"To enable header files being re-checked on every file write add the following line to your .vimrc. Otherwise the header files are checked only one time on initially loading the file. In order to force syntastic to refresh the header includes simply unlet b:syntastic_cpp_includes. Then the header files are being re-checked on the next file write.
let g:syntastic_c_auto_refresh_includes = 1
let g:syntastic_cpp_auto_refresh_includes = 1

"Alternatively you can set the buffer local variable b:syntastic_cpp_cflags. If this variable is set for the current buffer no search for additional libraries is done. I.e. set the variable like this:
"let b:syntastic_c_cflags = '-I/usr/include/libsoup-2.4'
"let b:syntastic_cpp_cflags = '-I/usr/include/libsoup-2.4'

"In order to add some custom include directories that should be added to the gcc command line you can add those to the global variable g:syntastic_cpp_include_dirs. This list can be used like this:
let g:syntastic_c_include_dirs = [ 'includes', 'headers' ]
let g:syntastic_cpp_include_dirs = [ '/home/mikko/emediate/CatchTestFramework/include', ]

"Moreover it is possible to add additional compiler options to the syntax checking execution via the variable g:syntastic_cpp_compiler_options:
let g:syntastic_c_compiler_options = '-ansi'
let g:syntastic_cpp_compiler_options = '-ansi -std=c++0x'

"Additionally the setting g:syntastic_cpp_config_file allows you to define a file that contains additional compiler arguments like include directories or CFLAGS. The file is expected to contain one option per line. If no filename is given, it defaults to .syntastic_c_config:
let g:syntastic_c_config_file = '.config'
let g:syntastic_cpp_config_file = '.config'

"Using the global variable g:syntastic_cpp_remove_include_errors you can specify whether errors of files included via the g:syntastic_c_include_dirs setting are removed from the result set:
let g:syntastic_c_remove_include_errors = 0
let g:syntastic_cpp_remove_include_errors = 0

"Use the variable g:syntastic_cpp_errorformat to override the default error format:
let g:syntastic_c_errorformat = '%f:%l:%c: %trror: %m'
let g:syntastic_cpp_errorformat = '%f:%l:%c: %trror: %m'

"Set your compiler executable with e.g. (defaults to gcc, or clang if gcc is not found):
let g:syntastic_c_compiler = 'gcc'
let g:syntastic_cpp_compiler = 'g++'

let g:syntastic_cpp_cppcheck_exec = 'cppcheck'

if debug_mikko
   echom 'Exiting ~/emediate/_vimrc_local.vim'
endif

