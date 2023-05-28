-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local wk = require("which-key")
local telescope = require("telescope")
local Util = require("lazyvim.util")

telescope.load_extension("yank_history")
telescope.load_extension("file_browser")

wk.register({
  --   Tabs
  ["<leader><tab>p"] = { ":-tabmove<CR>", "Move tab -1" },
  ["<leader><tab>n"] = { ":+tabmove<CR>", "Move tab +1" },
  -- -- File browser
  ["<leader>E"] = { "<cmd>Telescope file_browser<cr>", "File browser" },
  ["<leader>e"] = { "<cmd>Telescope file_browser path=%:p:h select_buffer=true<cr>", "File browser (buffer root)" },
  -- Windows
  ["<leader>we"] = { "<c-w>=", "Equalize" },
  ["<leader>ws"] = { "<C-w>x", "Swap splits" },
  -- Find using telescope
  ["<leader>sy"] = { "<cmd>Telescope yank_history<CR>", "Yank History" },
  -- Git
  ["<leader>gc"] = { "<cmd>Telescope git_bcommits<CR>", "Git commits editing this file" },
  -- Copilot
  ["<leader>cc"] = {
    function()
      local copilot = require("copilot.suggestion")
      copilot.toggle_auto_trigger()
    end,
    "Toggle copilot autosuggestion",
  },
  -- UI
  ["<leader>up"] = { "<cmd>NoNeckPain<CR>", "NoNeckPain" },
  ["<leader>uz"] = { "<cmd>TSContextToggle<CR>", "Toggle context" },
  -- Find files
  ["<leader>."] = { Util.telescope("files"), "Find Files (root dir)" },
})

wk.register({
  j = {
    name = "Logseq",
    j = {
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Search journals",
          cwd = "~/Documents/notes/logseq/journals/",
        })
      end,
      "Journals",
    },
    p = {
      function()
        require("telescope.builtin").find_files({
          prompt_title = "Search pages",
          cwd = "~/Documents/notes/logseq/pages/",
        })
      end,
      "Pages",
    },
  },
}, { prefix = "<leader>" })

-- Exit insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Keep cursor centered when scrolling
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move in insert mode
vim.keymap.set("i", "<C-j>", "<Down>")
vim.keymap.set("i", "<C-k>", "<Up>")
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- Faster horizontal movement
vim.keymap.set("n", "H", "^")
vim.keymap.set("n", "L", "$")

-- Move between tabs
vim.keymap.set("n", "<Tab>", ":tabnext<CR>", { silent = true })
vim.keymap.set("n", "<S-Tab>", ":tabprevious<CR>", { silent = true })

-- Rename strings
vim.keymap.set(
  "n",
  "grs",
  ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>",
  { desc = "Rename string with regex" }
)

vim.keymap.set("n", "<C-h>", "<cmd>TmuxNavigateLeft<CR>", { silent = true })
vim.keymap.set("n", "<C-j>", "<cmd>TmuxNavigateDown<CR>", { silent = true })
vim.keymap.set("n", "<C-k>", "<cmd>TmuxNavigateUp<CR>", { silent = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<CR>", { silent = true })

-- Unmap <A-j> and <A-k> to allow for tmux navigation
vim.keymap.del({ "n", "v", "i" }, "<a-j>")
vim.keymap.del({ "n", "v", "i" }, "<a-k>")
