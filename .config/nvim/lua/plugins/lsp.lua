return {
  -- Mason
  -- Registry: https://mason-registry.dev/registry/list
  {
    "williamboman/mason.nvim",
    opts = function(_, opts)
      vim.list_extend(opts.ensure_installed, {
        -- Lua
        "stylua",

        -- Shell
        "bash-language-server",
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
