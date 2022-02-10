let configPath = expand(stdpath('config'))
exec 'source' configPath . '/plugs.vim'
exec 'source' configPath . '/settings.vim'
colorscheme tokyonight
