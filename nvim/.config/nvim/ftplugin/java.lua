vim.opt.shiftwidth = 4
vim.opt.tabstop = 4

local jdtls = require("jdtls")

local home = os.getenv("HOME")
local root_dir = require("jdtls.setup").find_root({ "packageInfo" }, "Config")
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")

local jdtls_binary = home .. "/.local/share/nvim/mason/packages/jdtls/jdtls"
local workspace_dir = home .. "/.workspace/" .. project_name
local lombok_jar = home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar" -- need for lombok magic

local ws_folders_jdtls = {}
if root_dir then
  local file = io.open(root_dir .. "/.bemol/ws_root_folders")
  if file then
    for line in file:lines() do
      table.insert(ws_folders_jdtls, "file://" .. line)
    end
    file:close()
  end
end

local config = {
  settings = {
    java = {
      signatureHelp = { enabled = true },
      extendedClientCapabilities = jdtls.extendedClientCapabilities,
      format = {
        enabled = false,
      },
    },
  },
  cmd = {
    jdtls_binary,
    "--jvm-arg=-javaagent:" .. lombok_jar,
    "-data",
    workspace_dir,
  },
  root_dir = root_dir,
  init_options = {
    workspaceFolders = ws_folders_jdtls,
  },
}

jdtls.start_or_attach(config)
