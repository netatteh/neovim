-- Basic commands
vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

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
	"python",
})
vim.diagnostic.config({ virtual_text = true })

-- Other keymap things
vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>")
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

-- Linting, formatting etc.
local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.formatting.stylua,
	},
})
vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
