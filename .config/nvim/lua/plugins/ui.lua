-- Inside herdr (and not a nested tmux), vim-tmux-navigator cannot leave nvim, so move
-- between nvim windows and hand off to the neighbouring herdr pane at the edge.
local in_herdr = vim.env.HERDR_PANE_ID ~= nil and vim.env.TMUX == nil

local function herdr_navigate(wincmd, direction)
  return function()
    local win = vim.api.nvim_get_current_win()
    vim.cmd("wincmd " .. wincmd)
    if vim.api.nvim_get_current_win() == win then
      vim.system({ "herdr", "pane", "focus", "--pane", vim.env.HERDR_PANE_ID, "--direction", direction })
    end
  end
end

return {
  -- noice
  {
    "folke/noice.nvim",
    opts = function(_, opts)
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })

      opts.presets.lsp_doc_border = true
      opts.presets.inc_rename = true
    end,
  },

  -- filename
  {
    "b0o/incline.nvim",
    -- The dependency statement below failed LazyVim
    -- dependencies = { "crafztdog/solarized-osaka.nvim" },
    event = "BufReadPre",
    priority = 1200,
    config = function()
      local colors = require("solarized-osaka.colors").setup()
      require("incline").setup({
        highlight = {
          groups = {
            InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
            InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
          },
        },
        window = { margin = { vertical = 0, horizontal = 1 } },
        hide = {
          cursorline = true,
        },
        render = function(props)
          local filename = vim.fn.fnamemodify((vim.api.nvim_buf_get_name(props.buf)), ":t")
          if vim.bo[props.buf].modified then
            filename = "[+]" .. filename
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)
          return { { icon, guifg = color }, { " " }, { filename } }
        end,
      })
    end,
  },

  -- bufferline
  {
    "akinsho/bufferline.nvim",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
      -- The defaults in bufferline didn't work out for me, so I followed these rebindings:
      -- - https://lazyvim-ambitious-devs.phillips.codes/course/chapter-9/#_navigating_between_open_buffers
      {
        "L",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "H",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
      {
        "]b",
        function()
          vim.cmd("bnext " .. vim.v.count1)
        end,
        desc = "Next buffer",
      },
      {
        "[b",
        function()
          vim.cmd("bprev " .. vim.v.count1)
        end,
        desc = "Previous buffer",
      },
    },
    opts = {
      options = {
        mode = "tabs",
        show_buffer_close_icon = false,
        show_close_icon = false,
      },
    },
  },

  -- logo
  {
    "folke/snacks.nvim",
    opts = {
      dashboard = {
        preset = {
          header = [[
      ██████╗ ██████╗  ██████╗ ██╗  ██╗ ██╗██████╗ ██████╗ 
    ██╔════╝██╔═████╗██╔═████╗██║ ██╔╝███║╚════██╗╚════██╗
    ██║     ██║██╔██║██║██╔██║█████╔╝ ╚██║ █████╔╝ █████╔╝
    ██║     ████╔╝██║████╔╝██║██╔═██╗  ██║ ╚═══██╗ ╚═══██╗
    ╚██████╗╚██████╔╝╚██████╔╝██║  ██╗ ██║██████╔╝██████╔╝
      ╚═════╝ ╚═════╝  ╚═════╝ ╚═╝  ╚═╝ ╚═╝╚═════╝ ╚═════╝ 
]],
        },
      },
    },
  },

  -- Tmux integration
  {
    "christoomey/vim-tmux-navigator",
    -- The plugin's own mappings would replace the keys below when it loads.
    init = function()
      vim.g.tmux_navigator_no_mappings = 1
    end,
    cmd = {
      "TmuxNavigateLeft",
      "TmuxNavigateDown",
      "TmuxNavigateUp",
      "TmuxNavigateRight",
      "TmuxNavigatePrevious",
      "TmuxNavigatorProcessList",
    },
    keys = in_herdr and {
      { "<c-h>", herdr_navigate("h", "left") },
      { "<c-j>", herdr_navigate("j", "down") },
      { "<c-k>", herdr_navigate("k", "up") },
      { "<c-l>", herdr_navigate("l", "right") },
      { "<c-\\>", "<cmd>wincmd p<cr>" },
    } or {
      { "<c-h>", "<cmd>TmuxNavigateLeft<cr>" },
      { "<c-j>", "<cmd>TmuxNavigateDown<cr>" },
      { "<c-k>", "<cmd>TmuxNavigateUp<cr>" },
      { "<c-l>", "<cmd>TmuxNavigateRight<cr>" },
      { "<c-\\>", "<cmd>TmuxNavigatePrevious<cr>" },
    },
  },

  -- Neotree
  {
    "nvim-neo-tree/neo-tree.nvim",
    config = function()
      require("neo-tree").setup({
        close_if_last_window = true,
      })
    end,
  },
}
