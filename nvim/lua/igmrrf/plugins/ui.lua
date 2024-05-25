return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
  },
  { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    event = "VeryLazy",
    opts = {
      views = {
        cmdline_popup = {
          border = {
            -- style = "none",
            -- padding = { 1, 2 },
          },
          filter_options = {},
          win_options = {
            winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
          },
          position = {
            row = "20%",
            col = "50%",
          },
          size = {
            width = 60,
            height = "auto",
          },
        },
        cmdline_popupmenu = {
          -- view = "popupmenu",
          zindex = 200,
          position = {
            row = "30%",
            col = "50%",
          },
        },
        popupmenu = {
          relative = "editor",
          zindex = 65,
          position = "auto", -- when auto, then it will be positioned to the cmdline or cursor
          size = {
            width = "auto",
            height = "auto",
            max_height = 20,
            -- min_width = 10,
          },
          win_options = {
            winbar = "",
            foldenable = false,
            cursorline = true,
            cursorlineopt = "line",
            winhighlight = {
              Normal = "NoicePopupmenu", -- change to NormalFloat to make it look like other floats
              FloatBorder = "NoicePopupmenuBorder", -- border highlight
              CursorLine = "NoicePopupmenuSelected", -- used for highlighting the selected item
              PmenuMatch = "NoicePopupmenuMatch", -- used to highlight the part of the item that matches the input
            },
          },
          border = {
            padding = { 0, 1 },
          },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      routes = {
        {
          filter = {
            event = "msg_show",
            any = {
              { find = "%d+L, %d+B" },
              { find = "; after #%d+" },
              { find = "; before #%d+" },
            },
          },
          view = "mini",
        },
      },
      presets = {
        top_down = false,
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = true,
      },
    },
    keys = {
      {
        "<S-Enter>",
        function()
          require("noice").redirect(vim.fn.getcmdline())
        end,
        mode = "c",
        desc = "Redirect Cmdline",
      },
      {
        "<leader>snl",
        function()
          require("noice").cmd("last")
        end,
        desc = "Noice Last Message",
      },
      {
        "<leader>snh",
        function()
          require("noice").cmd("history")
        end,
        desc = "Noice History",
      },
      {
        "<leader>sna",
        function()
          require("noice").cmd("all")
        end,
        desc = "Noice All",
      },
      {
        "<leader>snd",
        function()
          require("noice").cmd("dismiss")
        end,
        desc = "Dismiss All",
      },
      {
        "<leader>snt",
        function()
          require("noice").cmd("telescope")
        end,
        desc = "Noice Telescope",
      },
      {
        "<c-f>",
        function()
          if not require("noice.lsp").scroll(4) then
            return "<c-f>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll Forward",
        mode = { "i", "n", "s" },
      },
      {
        "<c-b>",
        function()
          if not require("noice.lsp").scroll(-4) then
            return "<c-b>"
          end
        end,
        silent = true,
        expr = true,
        desc = "Scroll Backward",
        mode = { "i", "n", "s" },
      },
    },
  },

  {
    "rcarriga/nvim-notify",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      display = { "NvimNotify" },
      top_down = false,
    },
  },
}
