let configPath = expand(stdpath('config'))
"https://www.reddit.com/r/neovim/comments/i65pwd/no_python3_provider_found_run_checkhealth_provider/
" PYTHON PROVIDERS {{{

if has('macunix')

" OSX

let g:python3_host_prog = '/usr/local/bin/python3' " -- Set python 3 provider

let g:python_host_prog = '/usr/local/bin/python2' " --- Set python 2 provider

elseif has('unix')

" Ubuntu

let g:python3_host_prog = '/usr/bin/python3' " -------- Set python 3 provider

let g:python_host_prog = '/usr/bin/python' " ---------- Set python 2 provider

elseif has('win32') || has('win64')

" Window

endif

" }}} "
exec 'source' configPath . '/coc.vim'
exec 'source' configPath . '/plugs.vim'
exec 'source' configPath . '/indent.vim'
exec 'source' configPath . '/git.vim'
exec 'source' configPath . '/nvimtree.vim'
exec 'source' configPath . '/blame.vim'
exec 'source' configPath . '/nerdtree.vim'
exec 'source' configPath . '/theme.vim'
lua require('init')
