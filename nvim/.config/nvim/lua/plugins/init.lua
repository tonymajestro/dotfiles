return {
 {
    'folke/lazydev.nvim',
    ft = 'lua',
    opts = {
      library = {
        { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
      },
    },
  },
  'NMAC427/guess-indent.nvim',
  "neovim/nvim-lspconfig",
}
