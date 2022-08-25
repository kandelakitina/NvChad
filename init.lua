-- example file i.e lua/custom/init.lua
-- load your options globals, autocmds here or anything .__.
-- you can even override default options here (core/options.lua)

require'marks'.setup {
   default_mappings = true,
   signs = true,
   mappings = {},
   builtin_marks = { "'", "<", ">", ".", "`", "[", "]" }
}

require('leap').set_default_keymaps()

local autocmd = vim.api.nvim_create_autocmd

-- Remove whitespace on save
autocmd('BufWritePre', {
  pattern = '*',
  command = ":%s/\\s\\+$//e"
})

-- Don't auto commenting new lines
autocmd('BufEnter', {
  pattern = '*',
  command = 'set fo-=c fo-=r fo-=o'
})

-- Change background color in insertmode
vim.api.nvim_command([[
	autocmd InsertEnter * hi Normal guibg=#190f19
	autocmd InsertLeave * hi Normal guibg=#0B0E14
]])

local opt = vim.opt

opt.scrolloff = 4

opt.ignorecase = true
opt.smartcase = true

opt.tags = "tags;"

vim.api.nvim_command([[
	autocmd BufWritePost *.py silent! !crags -R &
]])

opt.foldmethod = "marker"
