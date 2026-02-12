require'nvim-treesitter.configs'.setup {
  prefer_git = false,
  ensure_installed ={},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
require'nvim-treesitter.install'.compilers = { "clang" }
