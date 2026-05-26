require("codex").setup()

vim.keymap.set("n", "<leader>cc", "<cmd>Codex<cr>", {
  desc = "Codex: Toggle",
})

vim.keymap.set("n", "<leader>cf", "<cmd>CodexFocus<cr>", {
  desc = "Codex: Focus",
})

vim.keymap.set("v", "<leader>cs", "<cmd>CodexSend<cr>", {
  desc = "Codex: Send selection",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "neo-tree", "oil" },
  callback = function(args)
    vim.keymap.set("n", "<leader>cs", "<cmd>CodexTreeAdd<cr>", {
      buffer = args.buf,
      desc = "Codex: Add file",
    })
  end,
})

