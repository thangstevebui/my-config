local key = vim.keymap
local opts = { noremap = true, silent = true }

key.set("n", "x", '"_x')

-- Increment/decrement
key.set("n", "+", "<C-a>")
key.set("n", "-", "<C-x>")

-- Delete a word backwards
key.set("n", "dw", 'vb"_d')

-- Select all
-- keymap.set("n", "<C-a>", "gg<S-v>G")

-- Save with root permission (not working for now)
--vim.api.nvim_create_user_command('W', 'w !sudo tee > /dev/null %', {})

--Timerly
key.set("n", "<Leader>t", ":TimerlyToggle<Return>", opts)

-- Disable continuations
key.set("n", "<Leader>o", "o<Esc>^Da", opts)
key.set("n", "<Leader>O", "O<Esc>^Da", opts)

-- Jumplist
key.set("n", "<C-m>", "<C-i>", opts)

-- New tab
key.set("n", "te", ":tabedit<Return>")
key.set("n", "<tab>", ":tabnext<Return>", opts)
key.set("n", "<s-tab>", ":tabprev<Return>", opts)
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
