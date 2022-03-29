let g:tailscale_name = split(trim(json_decode(trim(system('tailscale status --json'))).Self.DNSName),'\.')[0]
