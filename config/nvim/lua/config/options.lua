vim.g.mapleader = " "
vim.g.maplocalleader = "<leader>//"
local options = {
	number = true,
	relativenumber = true,
	tabstop = 4,
	shiftwidth = 4,
	expandtab = true,
	cursorline = true,
	cursorcolumn = true,
	backup = false,
	hlsearch = true,
	scrolloff = 10,
	smartcase = true,
	smartindent = true,
	softtabstop = 2,
	wildmenu = true,
	writebackup = false,
	clipboard = 'unnamedplus',
	wrap = false,
}

for k, v in pairs (options) do
	vim.opt[k] = v
end
