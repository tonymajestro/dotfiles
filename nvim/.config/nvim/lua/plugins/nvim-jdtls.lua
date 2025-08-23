-- requires nvim 0.11
-- based on https://github.com/LazyVim/LazyVim/blob/25abbf546d564dc484cf903804661ba12de45507/lua/lazyvim/plugins/extras/lang/java.lua#L4
return {
  "mfussenegger/nvim-jdtls",
  depends = "neovim/nvim-lspconfig",
  ft = "java",
  config = function()
    local attach_jdtls = function()
      local default_config = require("lspconfig.configs.jdtls").default_config
      local cmd = default_config.cmd

      -- lombok support
      local lombok_jar = vim.fn.expand("$MASON/share/jdtls/lombok.jar")
      if vim.uv.fs_stat(lombok_jar) then
        table.insert(cmd, string.format("--jvm-arg=-javaagent:%s", lombok_jar))
      end

      vim.keymap.set("n", "<leader>co", require("jdtls").organize_imports, { desc = "Organize Imports" })

      require('jdtls').start_or_attach({
        cmd = cmd,
        root_dir = default_config.root_dir(vim.api.nvim_buf_get_name(0))
      })
    end

    vim.api.nvim_create_autocmd("Filetype", {
      pattern = "java",
      callback = attach_jdtls
    })

    attach_jdtls()
  end
}
