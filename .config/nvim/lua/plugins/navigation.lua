return {
  {
    "folke/persistence.nvim",
    enabled = false,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
  },
  {
    "rmagatti/auto-session",
    enabled = true,
    config = function()
      vim.cmd([[let g:auto_session_root_dir = '/Users/martin/.config/nvim/sessions']])

      require("auto-session").setup({
        auto_session_enable_last_session = false,
        auto_save_enabled = true,
        auto_restore_enabled = true,
      })
    end,
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim", "nvim-tree/nvim-web-devicons" },
  },
  {
    "nvim-telescope/telescope.nvim",
    keys = {
      {
        "<leader><space>",
        false,
      },
    },
    opts = {
      defaults = {
        mappings = {
          i = {
            ["<esc>"] = require("telescope.actions").close,
          },
          n = {
            ["<esc>"] = require("telescope.actions").close,
            ["q"] = require("telescope.actions").close,
          },
        },
      },
      extensions = {
        file_browser = {
          use_fd = true,
          cwd_to_path = true,
          theme = "dropdown",
          grouped = true,
          hijack_netrw = true,
          initial_mode = "normal",
          hide_parrent_dir = true,
          hidden = true,
          mappings = {
            n = {
              ["q"] = require("telescope.actions").close,
            },
          },
        },
      },
    },
  },
  {
    "theprimeagen/harpoon",
    keys = {
      {
        "<leader><space>",
        function()
          require("harpoon.ui").toggle_quick_menu()
        end,
        desc = "Add file",
      },
      {
        "<leader>a",
        function()
          require("harpoon.mark").add_file()
        end,
        desc = "Add file",
      },
      {
        "<leader>1",
        function()
          require("harpoon.ui").nav_file(1)
        end,
        desc = "Harpoon file 1",
      },
      {
        "<leader>2",
        function()
          require("harpoon.ui").nav_file(2)
        end,
        desc = "Harpoon file 2",
      },
      {
        "<leader>3",
        function()
          require("harpoon.ui").nav_file(3)
        end,
        desc = "Harpoon file 3",
      },
      {
        "<leader>4",
        function()
          require("harpoon.ui").nav_file(4)
        end,
        desc = "Harpoon file 4",
      },
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
  },
  {
    "nanozuki/tabby.nvim",
    enabled = false,
    config = function()
      local kanagawa = {
        bg = "#1F1F28",
        bg_sec = "#2A2A37",
        fg = "#C8C093",
        accent = "#E46876",
        accent_sec = "#98BB6C",
      }
      local function harpoon_component()
        local mark_idx = require("harpoon.mark").get_current_index()
        if mark_idx == nil then
          return "  "
        end

        return string.format("󰛢 %d ", mark_idx)
      end

      local palette = kanagawa
      local theme = {
        line = { fg = palette.fg, bg = palette.bg },
        head = { fg = palette.bg, bg = palette.accent, style = "italic" },
        current_tab = { fg = palette.bg, bg = palette.accent_sec, style = "bold" },
        tab = { fg = palette.fg, bg = palette.bg_sec, style = "bold" },
        win = { fg = palette.fg, bg = palette.bg_sec },
        tail = { fg = palette.bg, bg = palette.accent_sec, style = "bold" },
      }
      vim.opt.showtabline = 2
      require("tabby.tabline").set(function(line)
        local cwd = " " .. vim.fn.fnamemodify(vim.fn.getcwd(), ":t") .. " "
        return {
          { { cwd, hl = theme.head }, line.sep("", theme.head, theme.line) },
          line.tabs().foreach(function(tab)
            local hl = tab.is_current() and theme.current_tab or theme.tab
            return {
              line.sep("", hl, theme.line),
              tab.is_current() and "" or "",
              string.format("%s:", tab.number()),
              tab.name(),
              line.sep("", hl, theme.line),
              margin = " ",
              hl = hl,
            }
          end),
          line.spacer(),
          line.wins_in_tab(line.api.get_current_tab()).foreach(function(win)
            return {
              line.sep("", theme.win, theme.line),
              win.is_current() and "" or "",
              win.buf_name(),
              line.sep("", theme.win, theme.line),
              margin = " ",
              hl = theme.win,
            }
          end),
          { line.sep("", theme.tail, theme.line), { harpoon_component(), hl = theme.tail, margin = " " } },
          hl = theme.line,
        }
      end, {})
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
}
