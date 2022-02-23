let g:git_username = trim(system('git config user.name'))

let g:tailscale_name = split(trim(json_decode(trim(system('tailscale status --json'))).Self.DNSName),'\.')[0]

let g:instant_username = g:git_username.'-'.g:tailscale_name

let g:coc_node_path = trim(system('which node'))
let NERDTreeShowHidden=1
set smartindent
set tabstop=1
set softtabstop=1
set noexpandtab
set shiftwidth=1
autocmd BufEnter * EnableBlameLine
