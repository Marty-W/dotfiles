return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = { "hrsh7th/cmp-emoji" },
    opts = function()
      local cmp = require("cmp")
      return {
        completion = {
          completeopt = "menu,menuone,noinsert",
        },
        snippet = {
          expand = function(args)
            require("luasnip").lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-j>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-k>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
          ["<C-p>"] = cmp.mapping.scroll_docs(-4),
          ["<C-n>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<C-e>"] = cmp.mapping.abort(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<S-CR>"] = cmp.mapping.confirm({
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = function(_, item)
            local icons = require("lazyvim.config").icons.kinds
            if icons[item.kind] then
              item.kind = icons[item.kind] .. item.kind
            end
            return item
          end,
        },
        experimental = {
          ghost_text = {
            hl_group = "LspCodeLens",
          },
        },
      }
    end,
  },
  {
    "mbbill/undotree",
    keys = {
      { "<leader>cu", vim.cmd.UndotreeToggle, desc = "Undotree" },
    },
  },
  -- Pair html and jsx tags
  {
    "windwp/nvim-ts-autotag",
    opts = true,
  },
  {
    "wellle/targets.vim",
  },
  {
    "wakatime/vim-wakatime",
  },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = {
        enabled = true,
        auto_trigger = true,
      },
    },
  },
  {
    "mason-nvim-dap.nvim",
    opts = {
      ensure_installed = {
        "chrome",
        "js",
        "node2",
      },
    },
  },
  {
    "echasnovski/mini.move",
    version = false,
    config = function()
      require("mini.move").setup({
        mappings = {
          left = "<S-h>",
          right = "<S-l>",
          up = "<S-k>",
          down = "<S-j>",
        },
        options = {
          reindeint_linewise = true,
        },
      })
    end,
  },
  {
    "gbprod/yanky.nvim",
    config = function()
      local yanky = require("yanky")

      yanky.setup({
        ring = {
          storage = "shada",
        },
        system_clipboard = {
          sync_with_ring = true,
        },
      })

      vim.keymap.set({ "n", "x" }, "p", "<Plug>(YankyPutAfter)")
      vim.keymap.set({ "n", "x" }, "P", "<Plug>(YankyPutBefore)")
      vim.keymap.set("n", "gp", "<Plug>(YankyPutIndentAfterLinewise)")
      vim.keymap.set("n", "gP", "<Plug>(YankyPutIndentBeforeLinewise)")

      vim.keymap.set("n", "<c-n>", "<Plug>(YankyCycleForward)")
      vim.keymap.set("n", "<c-p>", "<Plug>(YankyCycleBackward)")
    end,
  },
  {
    "HiPhish/nvim-ts-rainbow2",
  },
  {
    "james1236/backseat.nvim",
    enabled = false,
    config = function()
      require("backseat").setup({
        openai_api_key = "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",
        openai_model_id = "gpt-3.5-turbo",
        language = "english",
        split_treshold = 200,
      })
    end,
  },
}
