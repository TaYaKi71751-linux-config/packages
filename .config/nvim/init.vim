let configPath = expand(stdpath('config'))
exec 'source' configPath . '/plugs.vim'
exec 'source' configPath . '/settings.vim'
exec 'source' configPath . '/nvimtree.vim'
lua require('init')
colorscheme tokyonight
