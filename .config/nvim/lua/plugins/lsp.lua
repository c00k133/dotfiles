return {
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Lua
        "stylua",

        -- Shell
        "shellcheck",
        "shfmt",

        -- Python
        "autopep8",
        "black",
        "isort",
        "pylint",
        "pyright",

        -- CSS
        "css-lsp",

        -- Ansible
        "ansible-language-server",
        "ansible-lint",
      })
    end,
  },
}
