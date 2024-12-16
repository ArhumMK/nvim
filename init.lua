-- change data directory to D drive, I got no space in C lmao
vim.env.XDG_DATA_HOME = 'D:/'

-- Automatically change the working directory to the file's location
vim.api.nvim_create_autocmd('BufEnter', {
  callback = function()
    vim.cmd('cd ' .. vim.fn.expand '%:p:h')
  end,
})

-- Disable languages I don't use
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0

-- import neovide-specific settings
require 'shell.neovide'

-- use powershell instead of cmd
require 'shell.powershell'

-- import core config files from /lua/core/
require 'core.options'
require 'core.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
--    See `:help lazy.nvim.txt` or https://github.com/folke/lazy.nvim for more info
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = 'https://github.com/folke/lazy.nvim.git'
  local out = vim.fn.system { 'git', 'clone', '--filter=blob:none', '--branch=stable', lazyrepo, lazypath }
  if vim.v.shell_error ~= 0 then
    error('Error cloning lazy.nvim:\n' .. out)
  end
end ---@diagnostic disable-next-line: undefined-field
vim.opt.rtp:prepend(lazypath)

-- [[ Configure and install plugins ]]
--
--  To check the current status of your plugins, run
--    :Lazy
--
--  You can press `?` in this menu for help. Use `:q` to close the window
--
--  To update plugins you can run
--    :Lazy update
--
-- NOTE: Here is where you install your plugins.
require('lazy').setup {
  {
    require 'plugins.neotree',
    require 'plugins.colourtheme',
    require 'plugins.bufferline',
    require 'plugins.lualine',
    require 'plugins.treesitter',
    require 'plugins.telescope',
    require 'plugins.lsp',
    require 'plugins.autocompletion',
    require 'plugins.none-ls',
    require 'plugins.gitsigns',
    require 'plugins.alpha',
    require 'plugins.indent-blankline',
    require 'plugins.misc',
  },
}
