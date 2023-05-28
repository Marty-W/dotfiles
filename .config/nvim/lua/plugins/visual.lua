return {
  {
    "rebelot/kanagawa.nvim",
    opts = function()
      local kanagawa = require("kanagawa")

      kanagawa.setup({
        undercurl = true, -- enable undercurls
        commentStyle = { italic = false },
        functionStyle = {},
        keywordStyle = { italic = false },
        statementStyle = { bold = false },
        typeStyle = {},
        variablebuiltinStyle = { italic = true },
        specialReturn = true, -- special highlight for the return keyword
        specialException = true, -- special highlight for exception handling keywords
        transparent = true, -- do not set background color
        dimInactive = false, -- dim inactive window `:h hl-NormalNC`
        globalStatus = true, -- adjust window separators highlight for laststatus=3
        terminalColors = true, -- define vim.g.terminal_color_{0,17}
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          local theme = colors.theme
          local palette = colors.palette
          return {
            HarpoonWindow = { fg = "#C8C093" },
            HarpoonBorder = { fg = palette.samuraiRed },
            CWDHead = { bg = palette.waveAqua1, fg = palette.sumiInk0 },
            Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
            PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
            PmenuSbar = { bg = theme.ui.bg_m1 },
            PmenuThumb = { bg = theme.ui.bg_p2 },
            NavicText = { bg = palette.sumiInk4, fg = palette.fujiWhite },
            NavicSeparator = { bg = palette.sumiInk4, fg = palette.fujiWhite },
            NavicIconsFile = { fg = theme.syn.punct, bg = palette.sumiInk4 },
            NavicIconsModule = { fg = theme.syn.operator, bg = palette.sumiInk4 },
            NavicIconsNamespace = { fg = theme.syn.punct, bg = palette.sumiInk4 },
            NavicIconsPackage = { fg = theme.ui.special, bg = palette.sumiInk4 },
            NavicIconsClass = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsMethod = { fg = theme.syn.fun, bg = palette.sumiInk4 },
            NavicIconsProperty = { fg = theme.syn.type, bg = palette.sumiInk4 },
            NavicIconsField = { fg = theme.diag.hint, bg = palette.sumiInk4 },
            NavicIconsConstructor = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsEnum = { fg = theme.syn.regex, bg = palette.sumiInk4 },
            NavicIconsInterface = { fg = theme.syn.identifier, bg = palette.sumiInk4 },
            NavicIconsFunction = { fg = theme.syn.fun, bg = palette.sumiInk4 },
            NavicIconsVariable = { fg = theme.syn.statement, bg = palette.sumiInk4 },
            NavicIconsConstant = { fg = theme.syn.statement, bg = palette.sumiInk4 },
            NavicIconsString = { fg = theme.syn.string, bg = palette.sumiInk4 },
            NavicIconsNumber = { fg = theme.syn.number, bg = palette.sumiInk4 },
            NavicIconsBoolean = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsArray = { fg = theme.syn.type, bg = palette.sumiInk4 },
            NavicIconsObject = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsKey = { fg = theme.syn.statement, bg = palette.sumiInk4 },
            NavicIconsNull = { fg = theme.syn.identifier, bg = palette.sumiInk4 },
            NavicIconsEnumMember = { fg = theme.syn.identifier, bg = palette.sumiInk4 },
            NavicIconsStruct = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsEvent = { fg = theme.syn.constant, bg = palette.sumiInk4 },
            NavicIconsOperator = { fg = theme.syn.punct, bg = palette.sumiInk4 },
            NavicIconsTypeParameter = { fg = theme.syn.special1, bg = palette.sumiInk4 },
            TelescopeTitle = { fg = theme.ui.special, bold = true },
            TelescopePromptNormal = { bg = "NONE" },
            TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = "NONE" },
            TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = "NONE" },
            TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = "NONE" },
            TelescopePreviewNormal = { bg = "NONE" },
            TelescopePreviewBorder = { bg = "NONE", fg = theme.ui.bg_dim },
            TSRainbowRed = { fg = colors.palette.autumnRed },
            TSRainbowYellow = { fg = colors.palette.carpYellow },
            TSRainbowBlue = { fg = colors.palette.dragonBlue },
            TSRainbowOrange = { fg = colors.palette.surimiOrange },
            TSRainbowGreen = { fg = colors.palette.springGreen },
            TSRainbowViolet = { fg = colors.palette.oniViolet },
            TSRainbowCyan = { fg = colors.palette.waveAqua1 },
          }
        end,
      })
    end,
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa-wave",
    },
  },
  {
    "akinsho/bufferline.nvim",
    enabled = false,
    keys = {
      {
        "<Tab>",
        "<cmd>BufferLineCycleNext<CR>",
        desc = "Cycle next buffer",
      },
      {
        "<S-Tab>",
        "<cmd>BufferLineCyclePrev<CR>",
        desc = "Cycle prev buffer",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require("lazyvim.config").icons
      local colors = {
        bg = "none",
        fg = "#C8C093",
        none = "none",
      }
      local function harpoon_component()
        local mark_idx = require("harpoon.mark").get_current_index()
        if mark_idx == nil then
          return ""
        end

        return string.format("| %d", mark_idx)
      end

      return {
        options = {
          theme = {
            normal = {
              a = { fg = colors.fg, bg = colors.bg },
              b = { fg = colors.fg, bg = colors.bg },
              c = { fg = colors.fg, bg = colors.bg },
            },
            insert = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
            visual = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
            command = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },
            replace = { a = { fg = colors.fg, bg = colors.bg }, b = { fg = colors.fg, bg = colors.bg } },

            inactive = {
              a = { bg = colors.fg, fg = colors.bg },
              b = { bg = colors.fg, fg = colors.bg },
              c = { bg = colors.fg, fg = colors.bg },
            },
          },
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
          component_separators = { left = "", right = "" },
          section_separators = { left = "", right = "" },
        },
        sections = {
          lualine_a = {
            {
              function()
                return "%="
              end,
              separator = "",
            },
          },
          lualine_b = {
            {
              function()
                return "%="
              end,
              separator = "",
            },
          },
          lualine_c = {
            { "filename", path = 0, symbols = { modified = "~", readonly = "", unnamed = "" }, padding = 0 },
            {
              harpoon_component,
            },
          },
          lualine_x = {
            {
              function()
                return "%="
              end,
              separator = "",
            },
          },
          lualine_y = {},
          lualine_z = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    enabled = false,
    opts = {
      window = {
        width = 25,
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    opts = {
      highlight = { pattern = [[.*<(KEYWORDS)\s*]] },
      search = { pattern = [[\b(KEYWORDS)\b]] },
    },
  },
  {
    "petertriho/nvim-scrollbar",
    dependencies = {
      "kevinhwang91/nvim-hlslens",
    },
    opts = {
      handlers = {
        diagnostic = true,
        search = true,
      },
      excluded_filetypes = { layout_strategy = "center", "neo-tree" },
    },
  },
  {
    "simrat39/symbols-outline.nvim",
    cmd = "SymbolsOutline",
    keys = { { "<leader>cs", "<cmd>SymbolsOutline<cr>", desc = "Symbols Outline" } },
    opts = {
      position = "right",
    },
  },
  {
    "shortcuts/no-neck-pain.nvim",
    version = "*",
    opts = {
      buffers = {
        right = {
          enabled = false,
        },
        scratchPad = {
          enabled = true,
          location = "~/Documents/notes/logseq/pages",
        },
        bo = { filetype = "md" },
      },
    },
  },
  {
    "goolord/alpha-nvim",
    enabled = false,
  },
  {
    "xiyaowong/nvim-transparent",
    config = function()
      require("transparent").setup({
        extra_groups = {
          "TreesitterContext",
        },
      })
    end,
  },
}
