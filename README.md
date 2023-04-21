<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
  HardHacker Theme for VIM
</h1>

> Supported vim's gui and term environments

![](./media/preview.jpeg)

## Install

### Using Git

```bash
git clone https://github.com/hardhackerlabs/theme-vim.git
cp theme-vim/colors/hardhacker.vim  ~/.vim/colors/
```

### Using Vundle

```
Plugin 'hardhackerlabs/theme-vim', { 'name': 'hardhacker' }
```

### Using Plug

```
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

Add the following configuration to the `~/.vimrc` or `~/.config/nvim/init.vim` file, then restart Vim or Neovim

```
syntax      enable
syntax      on
set         t_Co=256
colorscheme hardhacker
```
