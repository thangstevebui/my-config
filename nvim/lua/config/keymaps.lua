-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local key = vim.keymap
local opts = { noremap = true, silent = true }

key.set("n", "x", '"_x')

-- Increment/decrement
key.set("n", "+", "<C-a>")
key.set("n", "-", "<C-x>")

-- Delete a word backwards
key.set("n", "dw", 'vb"_d')

-- Disable continuations
key.set("n", "<Leader>o", "o<Esc>^Da", opts)
key.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
key.set("n", "<C-m>", "<C-i>", opts)

-- New tab
key.set("n", "te", ":tabedit<Return>")
key.set("n", "<tab>", ":tabnext<Return>", opts)
key.set("n", "<s-tab>", ":tabprev<Return>", opts)
key.set("n", "tq", ":tabclose<Return>", opts)
-- Split window
key.set("n", "ss", ":split<Return>", opts)
key.set("n", "sv", ":vsplit<Return>", opts)
-- Move window
key.set("n", "sh", "<C-w>h")
key.set("n", "sk", "<C-w>k")
key.set("n", "sj", "<C-w>j")
key.set("n", "sl", "<C-w>l")

--Move previous window
key.set("n", "<space>", "<C-w>w")

-- Resize window
key.set("n", "Fh", "<C-w><10", opts)
key.set("n", "Fl", "<C-w>>10", opts)
key.set("n", "Fk", "<C-w>+10", opts)
key.set("n", "Fj", "<C-w>-10", opts)

-- Diagnostics
key.set("n", "<C-j>", function()
  vim.diagnostic.goto_next()
end, opts)
