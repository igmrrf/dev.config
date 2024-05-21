return {

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",

    keys = {
      -- {
      --   "<leader>fe",
      --   function()
      --     require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
      --   end,
      --   desc = "Explorer NeoTree (Root Dir)",
      -- },
      {
        "<leader>fe",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
        end,
        desc = "Explorer NeoTree (cwd)",
      },
      { "<leader>e", "<leader>fe", desc = "Explorer NeoTree (Root Dir)", remap = true },
      { "<leader>E", "<leader>fE", desc = "Explorer NeoTree (cwd)", remap = true },
      {
        "<leader>ge",
        function()
          require("neo-tree.command").execute({ source = "git_status", toggle = true })
        end,
        desc = "Git Explorer",
      },
      {
        "<leader>be",
        function()
          require("neo-tree.command").execute({ source = "buffers", toggle = true })
        end,
        desc = "Buffer Explorer",
      },
    },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
      "MunifTanjim/nui.nvim",
      "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {

      sources = { "filesystem", "buffers", "git_status", "document_symbols" },
      open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "Outline" },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },

      window = {
        position = "right",
        mappings = {
          ["<space>"] = "none",
          ["Y"] = {
            function(state)
              local node = state.tree:get_node()
              local path = node:get_id()
              vim.fn.setreg("+", path, "c")
            end,
            desc = "Copy Path to Clipboard",
          },
          ["O"] = {
            function(state)
              require("lazy.util").open(state.tree:get_node().path, { system = true })
            end,
            desc = "Open with System Application",
          },
        },
      },

      default_component_configs = {
        indent = {
          with_expanders = true, -- if nil and file nesting is enabled, will enable expanders
          expander_collapsed = "",
          expander_expanded = "",
          expander_highlight = "NeoTreeExpander",
        },
      },
    },
  },

  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = "nvim-tree/nvim-web-devicons",
  --   enable = false,
  --   keys = {
  --     {
  --       "<leader>ee",
  --       "<cmd>NvimTreeToggle<CR>",
  --       mode = { "n" },
  --       desc = "Toggle file explorer",
  --     },
  --
  --     {
  --       "<leader>ef",
  --       "<cmd>NvimTreeFindFileToggle<CR>",
  --       mode = { "n" },
  --       desc = "Toggle file explorer",
  --     },
  --     {
  --       "<leader>ec",
  --       "<cmd>NvimTreeCollapse<CR>",
  --       mode = { "n" },
  --       desc = "Toggle file explorer",
  --     },
  --     {
  --       "<leader>er",
  --       "<cmd>NvimTreeRefresh<CR>",
  --       mode = { "n" },
  --       desc = "Toggle file explorer",
  --     },
  --   },
  -- config = function()
  --   -- disable netrw at the very start of your init.lua
  --   vim.g.loaded_netrw = 1
  --   vim.g.loaded_netrwPlugin = 1
  --
  --   require("nvim-tree").setup({
  --     view = {
  --       width = 30,
  --     },
  --     renderer = {
  --       group_empty = true,
  --     },
  --     filters = {
  --       custom = { ".DS_Store" },
  --     },
  --     git = {
  --       ignore = false,
  --     },
  --   })
  -- end,
  -- },
}
