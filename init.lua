vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
-- 自定义的 lazy.nvim 安装路径 /home/<user_name>/.local/share/nvim/lazy/lazy.nvim
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

-- 如果 lazy.nvim 不存在，则通过 Git 克隆它到指定路径
if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

-- 将 lazy.nvim 的安装路径添加到 Neovim 的运行时路径中，以便 Neovim 能找到它
vim.opt.rtp:prepend(lazypath)

-- DEFAULT_PATH=/home/<user_name>/.config/nvim/lua
-- 这里引入的文件就是 `${DEFAULT_PATH}/configs/lazy.lua`，它包含了 lazy.nvim 的一些基本配置
local lazy_config = require "configs.lazy"

-- load plugins
-- 通过 lazy.nvim 加载插件
-- lazy.nvim 会自动下载在 `.setup` 中指定的插件并加载它们
require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  -- 然后从 `plugins/` 目录（也就是你当前配置文件夹的 `${DEFAULT_PATH}/lua/plugins/` 目录）中查找插件并加载
  -- （执行全部 Lua 文件，并读取它们的返回值）
  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)
