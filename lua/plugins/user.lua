---@type LazySpec

-- Create SaveAsTopLine command
vim.cmd [[
  command! -nargs=0 SaveAsTopLine execute '1y|w ' .. getline(1)
]]

return {
  -- Snacks customization
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          -- customize the dashboard header
          header = table.concat({
            "⠀⠀⠀⠀⠀⠀⠀⠀⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠻⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⣀⣠⣴⣶⣿⣿⠿⠿⠧⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠉⠛⠛⠋⣿⣿⣀⣀⣀⣀⣀⣀⣀⡀⠀⠀",
            "⠀⠀⠀⢀⣀⣤⣴⣶⣿⡿⠿⢿⣿⠿⠛⠿⠿⣿⣿⣷⡄",
            "⢲⣶⣾⣿⡿⠿⡋⡁⠀⠀⠀⢨⣿⡇⠀⠀⠀⠀⠉⠉⠁",
            "⠀⠉⠉⠀⠀⠐⣿⣿⠏⠀⢀⣾⣟⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⢀⣈⣯⣴⣶⣿⣿⠿⠿⠆⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠈⠛⠛⢛⣿⣷⣄⣀⣀⣄⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⢢⣴⣶⣿⡿⣿⣿⠟⠛⠿⢿⣿⠄⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠉⠉⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
            "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
          }, "\n"),
        },
      },
    },
  },

  -- Neovim options and keymaps
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      options = {
        -- configure general options: vim.opt.<key>
        opt = {
          spell = true, -- sets vim.opt.spell
          relativenumber = false, -- unsurprisingly, sets vim.opt.relativenumber
        },
        -- configure global vim variables: vim.g
        g = {},
      },
      mappings = {
        n = {
          -- normal mode key bindings
          -- setting a mapping to false will disable it
          -- ["<esc>"] = false,

          -- Top line save
          ["<leader>T"] = { "<cmd>SaveAsTopLine<cr>", desc = "Save as Top line" },

          -- navigate buffer tabs
          ["<F4>"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
          ["<F2>"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },

          -- Error navigation
          ["<F12>"] = { function() vim.diagnostic.jump({count = 1}) end, desc = "Next diagnostic" },
          ["<F11>"] = { function() vim.diagnostic.jump({count = -1}) end, desc = "Previous diagnostic" },

          -- Shadow
          ["<localleader>ca"] = { "<cmd>ConjureShadowSelect app<cr>", desc = "Connect to shadow-cljs :app" },
          ["<localleader>cb"] = {
            "<cmd>ConjureShadowSelect browser-repl<cr>",
            desc = "Connect to shadow-cljs browser-repl",
          },

          -- Plantuml
          ["<Leader>lu"] = { ':silent exec "!plantuml % && open %:s,clj,png,"<CR>', desc = "UML diagram" },

          -- Open portal
          ["<localleader>ct"] = {
            "<cmd>ConjureEval (do (require 'portal.api) (portal.api/open) (add-tap #'portal.api/submit) (add-tap #'clojure.pprint/pprint))<cr>",
            desc = "Open portal",
          },
        },
        t = {
          -- terminal mode key bindings
        },
        v = {
          -- visual mode key bindings
        },
      },
    },
  },

  -- Default UI colors
  {
    "AstroNvim/astroui",
    ---@type AstroUIOpts
    opts = {
      colorscheme = "everforest",
    },
  },

  -- LSP
  {
    "AstroNvim/astrolsp",
    ---@type AstroLSPOpts
    -- INFO: Use local Clojure & Lua LSP servers
    opts = {
      -- Configuration table of features provided by AstroLSP
      features = {
        autoformat = false, -- enable or disable auto formatting on start
        codelens = true, -- enable/disable codelens refresh on start
        inlay_hints = false, -- enable/disable inlay hints on start
        semantic_tokens = true, -- enable/disable semantic token highlighting
      },
      formatting = {
        format_on_save = {
          enabled = false, -- enable or disable format on save globally
        },
      },
    },
  },

  -- Disabled plugins
  { "astrocommunity.editing-support.vim-visual-multi", enabled = false },
  { "windwp/nvim-autopairs", enabled = false },
  { "dundalek/parpar.nvim", enabled = false },
  { "gpanders/nvim-parinfer", enabled = false },
  { "max397574/better-escape.nvim", enabled = false },

  -- Added plugins
  { import = "astrocommunity.colorscheme.everforest" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.xml" },
  { import = "astrocommunity.pack.svelte" },
  { import = "astrocommunity.pack.lua" },
}
