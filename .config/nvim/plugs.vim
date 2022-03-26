call plug#begin(stdpath('data').'/plugged')
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes

" https://github.com/kyazdani42/nvim-tree.lua
" requires
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" https://github.com/jbyuki/instant.nvim
Plug 'jbyuki/instant.nvim'

" https://github.com/tveskag/nvim-blame-line
Plug 'tveskag/nvim-blame-line'

" https://github.com/andweeb/presence.nvim
Plug 'andweeb/presence.nvim'

" https://github.com/folke/tokyonight.nvim
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }

" Unmanaged plugin (manually installed and updated)
Plug '~/my-prototype-plugin'

" Initialize plugin system
" Use release branch
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" NERDTree
Plug 'scrooloose/nerdtree'
" Npm NVim
Plug 'neoclide/npm.nvim', {'do' : 'npm install'}
call plug#end()
