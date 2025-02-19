-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		-- add your plugins here
        {  "nyoom-engineering/oxocarbon.nvim" },
		{
			"nvim-treesitter/nvim-treesitter",
            build = ":TSUpdate",
            config = function () 
				local configs = require("nvim-treesitter.configs")
				configs.setup({
					ensure_installed = {"lua","javascript", "typescript" },
					sync_install = false,
					auto_install = true,
					highlight = { enable = true },
					indent = { enable = true },  
				})
			end
		}
	},
	-- Configure any other settings here. See the documentation for more details.
	-- colorscheme that will be used when installing plugins.
	install = { colorscheme = { "catppuccin-mocha" } },
	-- automatically check for plugin updates
	checker = { enabled = true, notify = false },
})

-- Set colorscheme
vim.opt.background = "dark" -- set this to dark or light
vim.cmd.colorscheme "oxocarbon"

-- Other configs

--vim.opt.guicursor = ""

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

--vim.opt.smartindent = true

--vim.opt.wrap = false

--vim.opt.swapfile = false
--vim.opt.backup = false
--vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
--vim.opt.undofile = true

--vim.opt.hlsearch = false
--vim.opt.incsearch = true

--vim.opt.termguicolors = true

--vim.opt.scrolloff = 8
--vim.opt.signcolumn = "yes"
--vim.opt.isfname:append("@-@")

--vim.opt.updatetime = 50

--vim.opt.colorcolumn = "80"
