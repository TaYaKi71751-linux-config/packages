let configPath = expand(stdpath('config'))
exec 'source' configPath . '/coc.vim'
exec 'source' configPath . '/plugs.vim'
exec 'source' configPath . '/indent.vim'
exec 'source' configPath . '/git.vim'
exec 'source' configPath . '/tailscale.vim'
exec 'source' configPath . '/nvim_instance.vim'
exec 'source' configPath . '/nvimtree.vim'
exec 'source' configPath . '/blame.vim'
exec 'source' configPath . '/nerdtree.vim'
exec 'source' configPath . '/theme.vim'
lua require('init')
