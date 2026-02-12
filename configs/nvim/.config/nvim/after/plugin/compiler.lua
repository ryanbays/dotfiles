-- Open compiler
vim.api.nvim_set_keymap('n', '<F5>', "<cmd>CompilerOpen<cr>", { noremap = true, silent = true })

-- Redo last selected option
vim.api.nvim_set_keymap('n', '<S-F5>',
    "<cmd>CompilerStop<cr>" .. "<cmd>CompilerRedo<cr>",
    { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F6>',
    "<cmd>CompilerStop<cr>", { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<F7>', "<cmd>CompilerToggleResults<cr>", { noremap = true, silent = true })
