---
layout: post
title: Neovim使用Copilot
date: 2023-09-14 21:41:00 +0800
categories: [Neovim]
tags: [Neovim, Copilot]
---
GitHub Copilot支持Vim/Neovim，只需要下载插件或者加入插件管理其中，比如我的Neovim插件管理文件是`~/.config/nvim/lua/plugins/plugins-setup.lua`

```lua
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- 保存此文件自动更新安装软件
-- 注意PackerCompile改成了PackerSync
-- plugs.lua改成了plugins-setup.lua，适应本地文件名字
vim.cmd([[
  augroup packer_user_config
    autocmd!
    auto BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'folke/tokyonight.nvim' -- 主题
  use {
    'nvim-lualine/lualine.nvim',  -- 状态栏
    requires = { 'kyazdani42/nvim-web-devicons', opt = true } -- 状态栏图标
  }
  use {
    'nvim-tree/nvim-tree.lua',  -- 文档树
    requires = {
      'nvim-tree/nvim-web-devicons',  -- 文档树图标
    }
  }
  use("christoomey/vim-tmux-navigator")  -- 用ctrl-hjkl来定位窗口
  use "nvim-treesitter/nvim-treesitter"  -- 语法高亮
  use "p00f/nvim-ts-rainbow"  -- 配合treesitter，不同括号颜色区分
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig"
  }

  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-nvim-lsp"
  use "L3MON4D3/LuaSnip" -- snippets引擎，不装这个自动补全会出问题
  use "saadparwaiz1/cmp_luasnip"
  use "rafamadriz/friendly-snippets"
  use "hrsh7th/cmp-path" -- 文件路径

  use "numToStr/Comment.nvim" -- gcc和gc注释
  use "windwp/nvim-autopairs" -- 自动补全括号

  use "akinsho/bufferline.nvim" -- buffer分割线
  use "lewis6991/gitsigns.nvim" -- 左则git提示

  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.1',  -- 文件检索
    requires = { {'nvim-lua/plenary.nvim'} }
  }

  use "github/copilot.vim" -- github copilot


  if packer_bootstrap then
    require('packer').sync()
  end
end)
```

`:w`保存文件会安装插件。

使用`:Copilot setup`去GitHub网站授权。

最后启用GitHub Copilot

```vim
:Copilot enable
```
