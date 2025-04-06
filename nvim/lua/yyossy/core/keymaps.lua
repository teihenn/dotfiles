-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--------------------
-- General Keymaps -------------------

-- use jk to exit insert mode
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- delete single character without copying into register
-- keymap.set("n", "x", '"_x')

-- increment/decrement numbers
-- keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
-- keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- Map Ctrl+S to :w (save)
vim.keymap.set("n", "<C-s>", "<Cmd>w<CR>", { desc = "Save file" })
vim.keymap.set("i", "<C-s>", "<Esc><Cmd>w<CR>a", { desc = "Save file" })

-- terminal
-- exit terminal-job mode with <Esc> or jk
keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true }) -- exit terminal-job mode with <Esc>
vim.api.nvim_set_keymap("t", "jk", "<C-\\><C-n>", { noremap = true, silent = true })

vim.api.nvim_create_autocmd("TermOpen", {
  pattern = "*",
  callback = function()
    -- Remap <C-h> to act as backspace in terminal mode
    vim.keymap.set("t", "<C-h>", "<BS>", { noremap = true, silent = true, buffer = true })

    -- Remap <C-k> to delete everything after the cursor (kill-line behavior)
    vim.keymap.set("t", "<C-k>", "<C-\\><C-n>i<C-k>", { noremap = true, silent = true, buffer = true })
  end,
})

-- Toggle command-line window with <leader>u
keymap.set("n", "<leader>u", function()
  -- Close the command-line window if it is open
  if vim.fn.getcmdwintype() ~= "" then
    vim.cmd("close")
  else
    -- Open the command-line window (command history)
    vim.api.nvim_feedkeys("q:", "n", false)
  end
end, { desc = "Toggle Command-Line Window" })
