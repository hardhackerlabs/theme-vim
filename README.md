<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
  HardHacker Theme for VIM
</h1>

Supported Vim, MacVim and NeoVim 

![](./media/preview.jpeg)

## Install

### Using Git

```bash
git clone https://github.com/hardhackerlabs/theme-vim.git
cp theme-vim/colors/hardhacker.vim  ~/.vim/colors/
```

### Using Vundle

```vim
Plugin 'hardhackerlabs/theme-vim', { 'name': 'hardhacker' }
```

### Using Plug

```vim
Plug 'hardhackerlabs/theme-vim', { 'as': 'hardhacker' }
```

### Using Lazy.nvim (for neovim user)
If you're using neovim, you can use [lazy.nvim](https://github.com/folke/lazy.nvim) too
```lua
-- init.lua:
  {
    'hardhackerlabs/theme-vim',
    config = function()
      vim.cmd.colorscheme 'hardhacker'
    end,
  },
```
## Setup

Add the following configuration to the `~/.vimrc` or `~/.config/nvim/init.vim` file, then restart Vim or Neovim.

```vim
syntax      enable
syntax      on
set         t_Co=256
" let g:hardhacker_darker = 1
colorscheme hardhacker
```

This theme is dark by default, if you set the variable `g:hardhacker_darcker` to 1, you will get a darker theme
