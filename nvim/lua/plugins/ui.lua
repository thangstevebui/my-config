return {
  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    config = function()
      local p = require("rose-pine.palette")

      require("bufferline").setup({
        highlights = {
          -- fill = {
          -- 	fg = p.text,
          -- 	bg = "#575279",
          -- },
          buffer_visible = {
            fg = p.subtle,
            bg = p.base,
          },
          buffer_selected = {
            fg = p.rose,
            bold = true,
            italic = true,
          },
          tab_selected = {
            fg = p.text,
            bg = p.overlay,
          },
        },
        options = {
          mode = "tabs",
          -- separator_style = "slant",
          show_buffer_close_icons = false,
          show_close_icon = true,
          termguicolors = true,
          numbers = "ordinal",
          diagnostics = "nvim_lsp",
        },
      })
    end,
  },

  {
    "nvim-lualine/lualine.nvim",
    event = "ColorScheme",
    opts = {
      options = {
        globalstatus = false,
        theme = "rose-pine",
      },
    },
  },

  -- filename
  {
    "b0o/incline.nvim",
    event = "VeryLazy",
    priority = 1200,
    config = function()
      local p = require("rose-pine.palette")
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = p.highlight_med, guifg = p.rose },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {},
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename
          end
          local devicons = require("nvim-web-devicons")
          if filename == "" then
            filename = "[No Name]"
          end
          local ft_icon, ft_color = devicons.get_icon_color(filename)

          return {
            { (ft_icon or "") .. " ", guifg = ft_color, guibg = "none" },
            { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
            { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
          }
        end,
      })
    end,
  },

  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
  {
    "xiyaowong/transparent.nvim",
    config = function()
      local transparent = require("transparent").setup({
        groups = { -- table: default groups
          "Normal",
          "NormalNC",
          "Comment",
          "Constant",
          "Special",
          "Identifier",
          "Statement",
          "PreProc",
          "Type",
          "Underlined",
          "Todo",
          "String",
          "Function",
          "Conditional",
          "Repeat",
          "Operator",
          "Structure",
          "LineNr",
          "NonText",
          "SignColumn",
          "CursorLineNr",
          "EndOfBuffer",
          "NormalFloat",
          "Pmenu",
          "Float",
        },
        extra_groups = {
          "IndentBlanklineChar",

          -- make floating windows transparent
          "LspFloatWinNormal",
          "Normal",
          "NormalFloat",
          "FloatBorder",
          "TelescopeNormal",
          "TelescopeBorder",
          "TelescopePromptBorder",
          "SagaBorder",
          "SagaNormal",
        }, -- table: additional groups that should be cleared
        exclude_groups = {}, -- table: groups you don't want to clear
      })
    end,
  },
  { "MunifTanjim/nui.nvim", lazy = true },
  {
    "NvChad/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({})
    end,
  },
}
