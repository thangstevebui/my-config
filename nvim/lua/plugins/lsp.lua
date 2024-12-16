return {
  {
    "onsails/lspkind.nvim",
    config = function()
      require("lspkind").init({
        mode = "symbol",
        preset = "codicons",
        symbol_map = {
          Text = "",
          Method = "",
          Function = "",
          Constructor = "",
          Field = "ﰠ",
          Variable = "",
          Class = "ﴯ",
          Interface = "",
          Module = "",
          Property = "ﰠ",
          Unit = "塞",
          Value = "",
          Enum = "",
          Keyword = "",
          Snippet = "",
          Color = "",
          File = "",
          Reference = "",
          Folder = "",
          EnumMember = "",
          Constant = "",
          Struct = "פּ",
          Event = "",
          Operator = "",
          TypeParameter = "",
        },
      })
    end,
  },
  {
    "nvimdev/lspsaga.nvim",
    priority = 1500,
    dependencies = {
      { "nvim-treesitter/nvim-treesitter" },
    },
    event = "BufRead",
    keys = {
      { "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic jump next" },
      { "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic jump prev" },
      { "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
      { "gf", "<cmd>Lspsaga finder<CR>" },
      -- { "K", "<cmd>Lspsaga hover_doc<CR>" },
      { "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },
      { "gp", "<cmd>Lspsaga peek_definition<CR>" },
      { "re", "<cmd>Lspsaga rename ++project<CR>" },
      { "gt", "<cmd>Lspsaga peek_type_definition<CR>" },
      { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },
      { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
      { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
      { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
      { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
      { "<Leader>o", "<cmd>Lspsaga outline<CR>" },
    },
    config = function()
      local opts = { noremap = true, silent = true }
      require("lspsaga").setup({
        ui = {
          theme = "round",
          title = true,
          border = "rounded",
          lines = { "┗", "┣", "┃", "━", "┏" },
          winblend = 1,
          expand = "",
          collapse = "",
          preview = " ",
          code_action = "",
          diagnostic = "🐞",
          incoming = " ",
          outgoing = " ",
          hover = " ",
          imp_sign = "󰳛 ",
          kind = {},
        },
        definition = {
          keys = {
            edit = "<C-c>o",
            vsplit = "<C-c>v",
            split = "<C-c>i",
            tabe = "<C-c>t",
            close = "<C-c>x",
            quit = "q",
          },
        },
        callhierarchy = {
          keys = {
            edit = "<C-c>e",
            vsplit = "<C-c>s",
            split = "<C-c>i",
            tabe = "<C-c>t",
            quit = "<C-c>q",
            shuttle = "<C-c>w",
            toggle_or_req = "<C-c>u",
            close = "<C-c>x",
          },
        },
        diagnostic = {
          keys = {
            quit = { "q", "<ESC>" },
          },
        },
        lightbulb = {
          enable = true,
          enable_in_insert = true,
          sign = true,
          sign_priority = 40,
          virtual_text = true,
        },
        rename = {
          quit = "<C-w>",
          exec = "<CR>",
          mark = "x",
          confirm = "<CR>",
          in_select = true,
        },
        beacon = {
          enable = true,
          frequency = 7,
        },
        outline = {
          detail = false,
          win_width = 50,
        },
        hover = {
          enabled = true,
        },
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
      inlay_hints = {
        enabled = false,
      },
      servers = {
        jdtls = {},
      },
      setup = {
        jdtls = function()
          return true
        end,
      },
      config = function() end,
    },

    {
      "onsails/lspkind.nvim",
      config = function()
        require("lspkind").init({
          mode = "symbol",
          preset = "codicons",
          symbol_map = {
            Text = "",
            Method = "",
            Function = "",
            Constructor = "",
            Field = "ﰠ",
            Variable = "",
            Class = "ﴯ",
            Interface = "",
            Module = "",
            Property = "ﰠ",
            Unit = "塞",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "",
            Reference = "",
            Folder = "",
            EnumMember = "",
            Constant = "",
            Struct = "פּ",
            Event = "",
            Operator = "",
            TypeParameter = "",
          },
        })
      end,
    },
    {
      "nvimdev/lspsaga.nvim",
      priority = 1500,
      dependencies = {
        { "nvim-treesitter/nvim-treesitter" },
      },
      event = "BufRead",
      keys = {
        { "<C-j>", "<cmd>Lspsaga diagnostic_jump_next<CR>", desc = "diagnostic jump next" },
        { "<C-k>", "<cmd>Lspsaga diagnostic_jump_prev<CR>", desc = "diagnostic jump prev" },
        { "<leader>ca", "<cmd>Lspsaga code_action<CR>" },
        { "gf", "<cmd>Lspsaga finder<CR>" },
        -- { "K", "<cmd>Lspsaga hover_doc<CR>" },
        { "K", "<cmd>Lspsaga hover_doc ++keep<CR>" },
        { "gp", "<cmd>Lspsaga peek_definition<CR>" },
        { "re", "<cmd>Lspsaga rename ++project<CR>" },
        { "gt", "<cmd>Lspsaga peek_type_definition<CR>" },
        { "<leader>sl", "<cmd>Lspsaga show_line_diagnostics<CR>" },
        { "<leader>sc", "<cmd>Lspsaga show_cursor_diagnostics<CR>" },
        { "<leader>sb", "<cmd>Lspsaga show_buf_diagnostics<CR>" },
        { "<Leader>ci", "<cmd>Lspsaga incoming_calls<CR>" },
        { "<Leader>co", "<cmd>Lspsaga outgoing_calls<CR>" },
        { "<Leader>o", "<cmd>Lspsaga outline<CR>" },
      },
      config = function()
        require("lspsaga").setup({
          ui = {
            theme = "round",
            title = true,
            border = "rounded",
            lines = { "┗", "┣", "┃", "━", "┏" },
            winblend = 1,
            expand = "",
            collapse = "",
            preview = " ",
            code_action = "",
            diagnostic = "🐞",
            incoming = " ",
            outgoing = " ",
            hover = " ",
            imp_sign = "󰳛 ",
            kind = {},
          },
          definition = {
            keys = {
              edit = "<C-c>o",
              vsplit = "<C-c>v",
              split = "<C-c>i",
              tabe = "<C-c>t",
              close = "<C-c>x",
              quit = "q",
            },
          },
          callhierarchy = {
            keys = {
              edit = "<C-c>e",
              vsplit = "<C-c>s",
              split = "<C-c>i",
              tabe = "<C-c>t",
              quit = "<C-c>q",
              shuttle = "<C-c>w",
              toggle_or_req = "<C-c>u",
              close = "<C-c>x",
            },
          },
          diagnostic = {
            keys = {
              quit = { "q", "<ESC>" },
            },
          },
          lightbulb = {
            enable = true,
            enable_in_insert = true,
            sign = true,
            sign_priority = 40,
            virtual_text = true,
          },
          rename = {
            quit = "<C-w>",
            exec = "<CR>",
            mark = "x",
            confirm = "<CR>",
            in_select = true,
          },
          beacon = {
            enable = true,
            frequency = 7,
          },
          outline = {
            detail = false,
            win_width = 50,
          },
          hover = {
            enabled = true,
          },
        })
        local opts = { noremap = true, silent = true }
      end,
    },
  },
}
