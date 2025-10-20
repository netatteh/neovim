-- Basic commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")
vim.cmd("set number")
vim.cmd("set relativenumber")

vim.cmd("noremap <C-h> <C-w>h")
vim.cmd("noremap <C-j> <C-w>j")
vim.cmd("noremap <C-k> <C-w>k")
vim.cmd("noremap <C-l> <C-w>l")

require("config.lazy")

-- Themes etc.
require("plugins.catppuccin")
vim.cmd.colorscheme("catppuccin")
require("lualine").setup()

-- Fuzzy finder
local builtin = require("telescope.builtin")
require("telescope").load_extension("ui-select")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

require("nvim-treesitter").install({
	"go",
	"python",
})
vim.diagnostic.config({ virtual_text = true })

-- Other keymap things
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Linting, formatting etc.
--
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

-- Python: Use linting, formatting and imports from ruff, disable these from pyright
vim.lsp.config("pyright", {
	settings = {
		pyright = {
			-- Using Ruff's import organizer
			disableOrganizeImports = true,
		},
		python = {
			analysis = {
				-- Ignore all files for analysis to exclusively use Ruff for linting
				ignore = { "*" },
			},
		},
	},
})

-- Other linters and formatters
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})

