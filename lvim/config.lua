-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

--[[
 THESE ARE EXAMPLE CONFIGS FEEL FREE TO CHANGE TO WHATEVER YOU WANT
 `lvim` is the global options object
]]

--EMMET-LS
--require("lvim.lsp.manager").setup("emmet_ls")

-- Enable folding
lvim.builtin.which_key.setup.plugins.presets.z = true


-- vim options
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.relativenumber = true
vim.opt.clipboard = "unnamedplus"
-- New Keybinds
vim.api.nvim_set_keymap('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'jk', '<Esc>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('c', 'jk', '<Esc>', { noremap = true, silent = true })

-- Map <Tab> to change buffers / tabs
vim.api.nvim_set_keymap('n', '<Tab>', ':bn<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':bp<CR>', { noremap = true })

--Map zm to NoNeckPain
vim.api.nvim_set_keymap('n', 'zm', ':ZenMode<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'zz', ':NoiceDismis<CR>', { noremap = true, silent = true })


-- general
lvim.log.level = "info"
lvim.format_on_save = {
  enabled = true,
  pattern = "*.lua",
  timeout = 1000,
}
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings <https://www.lunarvim.org/docs/configuration/keybindings>
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

-- -- Use which-key to add extra bindings with the leader-key prefix
-- lvim.builtin.which_key.mappings["W"] = { "<cmd>noautocmd w<cr>", "Save without formatting" }
-- lvim.builtin.which_key.mappings["P"] = { "<cmd>Telescope projects<CR>", "Projects" }

lvim.transparent_window = true


-- Change theme settings
-- lvim.colorscheme = "lunar"
lvim.colorscheme = "no-clown-fiesta"

--Status line
lvim.builtin.lualine.style = "lvim"

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Automatically install missing parsers when entering buffer
lvim.builtin.treesitter.auto_install = true

-- lvim.builtin.treesitter.ignore_install = { "haskell" }

-- -- always installed on startup, useful for parsers without a strict filetype
-- lvim.builtin.treesitter.ensure_installed = { "comment", "markdown_inline", "regex" }

-- -- generic LSP settings <https://www.lunarvim.org/docs/languages#lsp-support>

-- --- disable automatic installation of servers
-- lvim.lsp.installer.setup.automatic_installation = false

-- ---configure a server manually. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---see the full default list `:lua =lvim.lsp.automatic_configuration.skipped_servers`
-- vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { "pyright" })
-- local opts = {} -- check the lspconfig documentation for a list of all possible options
-- require("lvim.lsp.manager").setup("pyright", opts)

-- ---remove a server from the skipped list, e.g. eslint, or emmet_ls. IMPORTANT: Requires `:LvimCacheReset` to take effect
-- ---`:LvimInfo` lists which server(s) are skipped for the current filetype
-- lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
--   return server ~= "emmet_ls"
-- end, lvim.lsp.automatic_configuration.skipped_servers)

-- -- you can set a custom on_attach function that will be used for all the language servers
-- -- See <https://github.com/neovim/nvim-lspconfig#keybindings-and-completion>
-- lvim.lsp.on_attach_callback = function(client, bufnr)
--   local function buf_set_option(...)
--     vim.api.nvim_buf_set_option(bufnr, ...)
--   end
--   --Enable completion triggered by <c-x><c-o>
--   buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")
-- end

-- -- linters and formatters <https://www.lunarvim.org/docs/languages#lintingformatting>
-- local formatters = require "lvim.lsp.null-ls.formatters"
-- formatters.setup {
--   { command = "stylua" },
--   {
--     command = "prettier",
--     extra_args = { "--print-width", "100" },
--     filetypes = { "typescript", "typescriptreact" },
--   },
-- }
-- local linters = require "lvim.lsp.null-ls.linters"
-- linters.setup {
--   { command = "flake8", filetypes = { "python" } },
--   {
--     command = "shellcheck",
--     args = { "--severity", "warning" },
--   },
-- }

-- -- Additional Plugins <https://www.lunarvim.org/docs/plugins#user-plugins>
lvim.plugins = {
  {
    window = {
      width = 200,
    },

    "folke/zen-mode.nvim",
    opts = {
      kitty = { enabled = true },
      plugins = {
        twilight = { enabled = false },

      }

    }
  },
  { "folke/twilight.nvim" },
  { "shortcuts/no-neck-pain.nvim" },
  { "folke/zen-mode.nvim" },
  { "t184256/vim-boring" },
  { "aditya-azad/candle-grey" },
  { "nyoom-engineering/oxocarbon.nvim" },
  { "metalelf0/base16-black-metal-scheme" },
  { "aktersnurra/no-clown-fiesta.nvim" },
  { "rose-pine/neovim",                   name = "rose-pine" },
  -- { "bluz71/vim-moonfly-colors",       name = "moonfly",   lazy = false, priority = 1000 },
  { "catppuccin/nvim",                    name = "catppuccin" },
  { 'projekt0n/github-nvim-theme' },
  { "norcalli/nvim-colorizer.lua" },
  --noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",

    opts = {

      -- add any options here
    },
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    }
  },
  {
    -- EMMET PLUGIN
    "aca/emmet-ls",
    config = function()
      local lspconfig = require("lspconfig")
      local configs = require("lspconfig/configs")

      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      capabilities.textDocument.completion.completionItem.resolveSupport = {
        properties = {
          "documentation",
          "detail",
          "additionalTextEdits",
        },
      }

      if not lspconfig.emmet_ls then
        configs.emmet_ls = {
          default_config = {
            cmd = { "emmet-ls", "--stdio" },
            filetypes = {
              "html",
              "css",
              "javascript",
              "typescript",
              "eruby",
              "typescriptreact",
              "javascriptreact",
              "svelte",
              "vue",
            },
            root_dir = function(fname)
              return vim.loop.cwd()
            end,
            settings = {},
          },
        }
      end
      lspconfig.emmet_ls.setup({ capabilities = capabilities })
    end,
  },

  --greeter

  {
    "goolord/alpha-nvim",
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'
      dashboard.section.header.val = {
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠈⠫⡛⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠀⠀⠈⠲⣽⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢄⡀⠀⠀⣸⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣶⣄⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠉⠀⠀⠀⠈⠳⣻⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢹⡛⠋⢡⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠀⠉⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⣴⠚⠁⠀⠉⠉⠉⡿⣿⣿⣿⣿⣿⣿⣿⡄⠀⠀⠀⣠⡀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢀⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠁⣼⠙⣦⣿⠀⠀⠀⠀⠸⡜⣿⣿⣿⣿⣿⣿⣏⣤⣶⣿⣛⣻⣶⣦⣼⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣿⡿⠋⠉⢉⡿⠋⠀⣤⣀⣀⠀⣻⣿⣿⣿⣿⣿⣿⠿⣿⣿⠟⣿⡌⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⡿⠟⠋⣸⠋⠉⢫⣻⣿⣤⣈⠿⣿⣿⣿⣿⣭⣿⣧⣿⣿⣿⣿⣿⣿⣿⣷⣿⡄⢺⣿⠿⠘⢷⣾⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣡⡅⢰⣇⠀⠀⠀⠙⣿⣿⣗⣶⣟⠛⢿⣿⣿⠻⣿⣿⣿⡿⠛⠛⢿⣿⣿⣿⣿⣶⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⣿⣿⣿⣿⣿⣿⣿⣯⣤⣬⣿⣶⡄⢿⣿⣿⣿⣽⣿⣶⣠⣹⣋⣠⣶⣿⣿⣷⣾⣿⢿⣿⣿⣿⣞⢹⡏⠉⠉⣩⣾⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣛⠛⠻⠿⠿⠿⠿⡿⣿⣿⣿⠹⣿⡿⣿⣿⣿⣇⢻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣿⣿⣿⣿⣿⣿⢶⣾⣿⣾⣿⣿⣿⣿⣿⣿⣿⣿",
        "⡏⣿⣿⣿⣿⣿⣶⣮⣿⣿⡿⣶⣿⣾⣿⣿⣿⣿⣿⣌⠉⠙⣿⣿⣿⣿⣿⣿⣿⢛⣫⣯⣛⣿⣿⣿⣿⣿⡟⣿⣟⣻⣿⣿⣿⣿⣿⣿⣿⣿",
        "⢰⣿⣿⣿⣿⡟⠹⣷⡿⣿⣷⠙⣿⣿⣟⠺⢭⣟⡿⠿⣿⣿⡿⣡⣾⡿⣿⣿⠉⠉⢻⣿⣿⣿⣟⢷⣦⣽⣅⠀⠀⢸⣿⣿⣿⣿⣿⣿⣿⣿",
        "⣿⠸⣿⣿⣿⣿⣄⣇⢹⣷⠇⣾⣿⢿⣿⣿⣿⣷⣯⣵⣴⣇⢙⣿⣿⡃⣿⣟⡇⢰⣾⣿⣿⠹⣿⣶⣬⣍⣹⠟⠓⢿⣿⣿⣿⣿⣿⣿⣿⣿",
        "⠋⢀⣿⣿⣿⣿⣿⣿⢸⡿⢠⣿⡿⣯⣛⡿⠿⣿⠿⠿⣟⣿⡉⢹⣟⣹⠸⣿⡇⢸⣿⣿⣿⣿⣾⣝⡛⠿⢿⣷⣦⢾⣿⣿⣿⣿⣿⣿⣿⣿",

      }

      dashboard.section.buttons.val = {
        --dashboard.button("f", " Find File", ":Telescope find_files<CR>"),
        dashboard.button("n", " New File", ":ene!<CR>"),
        --dashboard.button("P", "  Recent Projects ", ":Telescope projects<CR>"),
        --dashboard.button("s r", "  Recently Used Files", ":Telescope oldfiles<CR>"),
        --dashboard.button("s t", "  Find Text", ":Telescope live_grep<CR>"),
        dashboard.button("c", " Configuration", ":edit " .. "/home/giovak/.config/lvim/config.lua" .. "<CR>"),
        dashboard.button("q", " Quit", ":qa<CR>"),
      }
      -- local handle = io.popen('fortune')
      -- local fortune = handle:read("*a")
      -- handle:close()
      --dashboard.section.footer.val = fortune
      dashboard.section.footer.val =
      --'"Any person capable of angering you becomes your master;\n he can anger you only when you permit yourself to be disturbed by him." -- Epictetus.'
      '“I judge you unfortunate because you have never lived through misfortune.\n You have passed through life without an opponent—no one can ever know what you are capable of, not even you.” – Seneca'

      dashboard.config.opts.noautocmd = false


      alpha.setup(dashboard.config)
    end
  }

}

require 'colorizer'.setup()


vim.cmd([[
  augroup EJSFileType
    autocmd!
    autocmd BufNewFile,BufRead *.ejs set filetype=html.javascript
  augroup END
]])

vim.filetype.add({ extension = { templ = "templ" } })




require("notify").setup({
  background_colour = "#000000",
})


-- -- Autocommands (`:help autocmd`) <https://neovim.io/doc/user/autocmd.html>
-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "zsh",
--   callback = function()
--     -- let treesitter use bash highlight for zsh files as well
--     require("nvim-treesitter.highlight").attach(0, "bash")
--   end,
-- })
--
--
--
--Dashboard
