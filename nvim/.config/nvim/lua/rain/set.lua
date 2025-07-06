vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.so = 8

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
-- Gets OSName found in: https://gist.github.com/Zbizu/43df621b3cd0dc460a76f7fe5aa87f30
local osname
local fh, err = assert(io.popen("uname -o 2>/dev/null", "r"))
if fh then
    osname = fh:read()
    if not osname then
        osname = "Windows"
    end
end

if osname == "GNU/Linux" then
    vim.notify("Using Linux config", "info", { title = "Start up" })
    vim.g.undotree_DiffCommand = "diff"
    vim.opt.undodir = vim.fn.expand("$HOME/.config/nvim-data/undo")
elseif osname == "Windows" then
    vim.notify("Using Windows config")
    vim.g.undotree_DiffCommand = "FC"
    vim.opt.undodir = vim.fn.expand("$HOME/AppData/Local/nvim-data/undo")
else
    vim.notify("Unknown OS")
end

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.updatetime = 50
