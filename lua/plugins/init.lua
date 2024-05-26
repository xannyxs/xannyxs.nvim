local plugins = {
  {
    "nvimtools/none-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "configs.none-ls"
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    event = "VeryLazy",
    config = function()
      local dap, dapui = require "dap", require "dapui"
      dapui.setup()
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end
    end,
  },
  {
    "jay-babu/mason-nvim-dap.nvim",
    event = "VeryLazy",
    dependencies = {
      "williamboman/mason.nvim",
      "mfussenegger/nvim-dap",
    },
    opts = {
      handlers = {},
    },
  },
  {
    "mfussenegger/nvim-dap",
    -- config = function(_, _)
    --   require("mappings").load_mappings "dap"
    -- end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.g.userLanguages = {
        eelixir = "html-eex",
        eruby = "erb",
        rust = "html",
      }
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "lua-language-server",
        "typescript-language-server",
        "html-lsp",
        "prettierd",
        "eslint_d",
        "stylua",
        "bash-language-server",
        "tailwindcss-language-server",
        "css-lsp",
        "rust-analyzer",
        "yaml-language-server",
        "vue-language-server",
        "rustywind",
        "astro-language-server",

        -- Python
        "black",
        "pylint",
        "pyright",
        "mypy",

        -- C++
        "clangd",
        "clang-format",
        "codelldb",
        "cmake-language-server",
        "cmakelint",

        -- Low-level
        "asm-lsp",
        "asmfmt",
        "checkmake",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        -- defaults
        "vim",
        "lua",
        "yaml",

        -- web dev
        "html",
        "css",
        "javascript",
        "typescript",
        "tsx",
        "json",
        "vue",

        "python",
        "c",
        "cpp",
        "rust",
        "cmake",
        "make",
      },
      auto_install = true,
      highlight = {
        enable = true,
      },
      incremental_selection = {
        enable = true,
      },
      indent = {
        enable = true,
      },
    },
  },
  {
    "windwp/nvim-ts-autotag",
    ft = {
      "astro",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "html",
    },
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
  },
  -- {
  --   "jackMort/ChatGPT.nvim",
  --   event = "VeryLazy",
  --   dependencies = {
  --     "MunifTanjim/nui.nvim",
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope.nvim",
  --   },
  --   config = function()
  --     require("chatgpt").setup {
  --       api_key_cmd = "bw get password Chatgpt",
  --     }
  --   end,
  -- },
  {
    "ggandor/leap.nvim",
    event = "VeryLazy",
    enabled = true,
    keys = {
      { "s",  mode = { "n", "x", "o" }, desc = "Leap forward to" },
      { "S",  mode = { "n", "x", "o" }, desc = "Leap backward to" },
      { "gs", mode = { "n", "x", "o" }, desc = "Leap from windows" },
    },
    config = function(_, opts)
      local leap = require "leap"
      for k, v in pairs(opts) do
        leap.opts[k] = v
      end
      leap.add_default_mappings(true)
      vim.keymap.del({ "x", "o" }, "x")
      vim.keymap.del({ "x", "o" }, "X")
    end,
  },
  {
    "iamcco/markdown-preview.nvim",
    event = "VeryLazy",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
  {
    "vuki656/package-info.nvim",
    event = "VeryLazy",
    dependencies = "MunifTanjim/nui.nvim",
    opts = {
      package_manager = "yarn",
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    dependencies = "nvim-lua/plenary.nvim",
  },
  {
    "wuelnerdotexe/vim-astro",
    opts = {
      astro_typescript = true,
      astro_stylus = "enable",
    },
  },
  {
    "VonHeikemen/fine-cmdline.nvim",
    event = "VimEnter",
    dependencies = {
      { "MunifTanjim/nui.nvim" },
    },
    config = function()
      require("fine-cmdline").setup {
        cmdline = {
          prompt = " 󰘳  ",
        },
      }
    end,
  },
  {
    "rcarriga/nvim-notify",
    event = "BufWinEnter",
    config = function()
      vim.notify = require "notify"
      ---@diagnostic disable-next-line
      vim.notify.setup {
        background_colour = "#1c2433",
        top_down = true,
      }
    end,
  },
  {
    "ray-x/lsp_signature.nvim",
    event = { "VeryLazy", "LspAttach" },
    config = function(_, opts)
      require("lsp_signature").setup(opts)
    end,
  },
  {
    "utilyre/barbecue.nvim",
    event = "VeryLazy",
    name = "barbecue",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      theme = {
        dirname = { fg = "#c3cfd9" },
        basename = { bold = true },
        context = { fg = "#c3cfd9" },
      },
    },
  },
  {
    "folke/todo-comments.nvim",
    event = "BufRead",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("todo-comments").setup {
        keywords = {
          GROUP = { icon = " ", color = "hint" },
        },
        highlight = { multiline = true },
      }
    end,
  },
}

return plugins
