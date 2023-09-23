-- Basic Keys
lvim.log.level = "warn"
lvim.format_on_save.enabled = false
lvim.colorscheme = "vn-night"
lvim.builtin.terminal.open_mapping = "<c-t>"
vim.opt.relativenumber = true
vim.opt.foldmethod = "manual"
vim.opt.mouse = "a"
vim.opt.number = true
vim.opt.expandtab = true
vim.opt.sw = 2
vim.opt.ts = 2
vim.opt.fileencoding = "utf-8"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.linebreak = true
vim.opt.wrap = true

lvim.leader = "space"

-- Key Mappings
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<C-,>"] = ":bprevious<CR>"
lvim.keys.normal_mode["<C-.>"] = ":bnext<CR>"
lvim.keys.normal_mode["<C-H>"] = ":NvimTreeFindFile<CR>"
lvim.keys.normal_mode["<C-G>"] = ":NvimTreeToggle<CR>"
lvim.keys.normal_mode["<C-U>"] = ":u<CR>"
lvim.keys.normal_mode["<C-Y>"] = ":w<CR>"
lvim.keys.visual_mode["<leader> p"] = [["_dP]]
lvim.keys.normal_mode["<C-D>"] = ":DiffviewOpen<CR>"

-- Plugin Configuration
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "right"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- Treesitter Configuration
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "javascript",
  "json",
  "lua",
  "typescript",
  "css",
  "yaml",
}
lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true
lvim.builtin.which_key.mappings["t"] = {
  name = "Diagnostics",
  t = { "<cmd>TroubleToggle<cr>", "trouble" },
  w = { "<cmd>TroubleToggle workspace_diagnostics<cr>", "workspace" },
  d = { "<cmd>TroubleToggle document_diagnostics<cr>", "document" },
  q = { "<cmd>TroubleToggle quickfix<cr>", "quickfix" },
  l = { "<cmd>TroubleToggle loclist<cr>", "loclist" },
  r = { "<cmd>TroubleToggle lsp_references<cr>", "references" },
}

lvim.builtin.which_key.mappings["S"] = {
  name = "Session",
  c = { "<cmd>lua require('persistence').load()<cr>", "Restore last session for current dir" },
  l = { "<cmd>lua require('persistence').load({ last = true })<cr>", "Restore last session" },
  Q = { "<cmd>lua require('persistence').stop()<cr>", "Quit without saving session" },
}

lvim.builtin.which_key.mappings["H"] = {
  name = "Keyshorts code",
  a = { "<cmd>!eslint_d % --fix<cr>", "Linting ESLint in your workspace" },
  b = { "<leader>a /* eslint-enable */ <CR>", "Enable at this line on ESLint in your workspace" },
  c = { "<leader>a /* eslint-disable */ <CR>", "Disable at this line on ESLint in your workspace" },
  d = { "<leader>lf <CR>", "Formatting code" },
  e = { "<leader>ls <CR>", "Search by symbol" },
  f = { "<leader>zf <CR>", "Hidden lines" },
  g = { "<leader>za <CR>", "Show hidden lines" },
  k = { "<cmd> :NullLsInfo<cr>", "NullInfo"},
  l = { "<leader>sp", "Change theme"},
}

-- Plugin List
lvim.plugins = {
  { "mhartington/oceanic-next" },
  { "marko-cerovac/material.nvim" },
  { "gbprod/nord.nvim" },
  {
    "navarasu/onedark.nvim",
    config = function()
      require("onedark").setup {
        style = 'deep',
      }
      require('onedark').load()
    end
  },
  { "embark-theme/vim" },
  { "tiagovla/tokyodark.nvim" },
  {
    "itchyny/vim-cursorword",
    event = { "BufEnter", "BufNewFile" },
    config = function()
      vim.api.nvim_command("augroup user_plugin_cursorword")
      vim.api.nvim_command("autocmd!")
      vim.api.nvim_command("autocmd FileType NvimTree,lspsagafinder,dashboard,vista let b:cursorword = 0")
      vim.api.nvim_command("autocmd WinEnter * if &diff || &pvw | let b:cursorword = 0 | endif")
      vim.api.nvim_command("autocmd InsertEnter * let b:cursorword = 0")
      vim.api.nvim_command("autocmd InsertLeave * let b:cursorword = 1")
      vim.api.nvim_command("augroup END")
    end
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      vim.g.gitblame_enabled = 0
    end,
  },
  {
    "windwp/nvim-ts-autotag",
    config = function()
      require("nvim-ts-autotag").setup()
    end,
  },
  {
  "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    }
  },
  {
    "folke/persistence.nvim",
    lazy = true,
    event = "BufReadPre",
    config = function()
      require("persistence").setup {
        dir = vim.fn.expand(vim.fn.stdpath "config" .. "/session/"),
        options = { "buffers", "curdir", "tabpages", "winsize" },
      }
    end,
  },
  {
    "windwp/nvim-spectre",
    event = "BufRead",
    config = function()
      require("spectre").setup()
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "tzachar/cmp-tabnine",
    build = "./install.sh",
    dependencies = "hrsh7th/nvim-cmp",
    event = "InsertEnter",
  },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
}

-- Null LS Configuration
local null_ls = require("null-ls")
null_ls.setup({
    sources = {
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
        null_ls.builtins.formatting.prettier, -- markdown formatting
        null_ls.builtins.diagnostics.shellcheck, -- shell script diagnostics
    },
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    name = "prettier",
    ---@usage arguments to pass to the formatter
    -- these cannot contain whitespace
    -- options such as `--line-width 80` become either `{"--line-width", "80"}` or `{"--line-width=80"}`
    args = { "--print-width", "100" },
    -- filetypes = { "typescript", "vue", "css" },
  },
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { name = "flake8" },
  {
    name = "shellcheck",
    args = { "--severity", "warning" },
  },
}

local code_actions = require "lvim.lsp.null-ls.code_actions"
code_actions.setup {
  {
    name = "proselint",
  },
}

