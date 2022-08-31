-- setup with all defaults
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
-- -- examples for your init.lua

-- empty setup using defaults
require("nvim-tree").setup()

-- OR setup with some options
require("nvim-tree").setup({
  sort_by = "case_sensitive",
  view = {
    adaptive_size = true,
    mappings = {
      list = {
        { key = "u", action = "dir_up" },
      },
    },
  },
  renderer = {
			 indent_markers = {
					 enable = true,
				},
				highlight_git = true,
				highlight_opened_files = "icon",
				root_folder_modifier = ':~',
				add_trailing = true,
				group_empty = 1,
				icons = {
					 padding = ' ',
						symlink_arrow = ' >> ',
						show = {
							 git = true,
								folder = true,
								file = true,
								folder_arrow = true,
						},
						glyphs = {
							default = '',
							symlink = '',
							git = {
								unstaged = "✗",
								staged = "✓",
								unmerged = "",
								renamed = "➜",
								untracked = "★",
								deleted = "",
								ignored = "◌",
							},
							folder = {
								arrow_open = "",
								arrow_closed = "",
								default = "",
								open = "",
								empty = "",
								empty_open = "",
								symlink = "",
								symlink_open = "",
							},
						},
				},
    group_empty = true,
  },
  filters = {
    dotfiles = true,
  },
		respect_buf_cwd = true,
		create_in_closed_folder = true,
})
