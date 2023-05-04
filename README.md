<p align="center">
  <img width="180" src="https://github.com/hardhackerlabs/themes/raw/master/media/logo/logo.png" alt="HardHacker">
</p>

<h1 align="center">
  HardHacker Theme for VIM
</h1>

Supported Vim, MacVim and NeoVim.

Since Vim only supports 256 colors, there will be some color differences with Gui Vim, especially in the background color. For best results, it is recommended to use MacVim, NeoVim or other Gui Vim.

![](./media/preview.jpeg)

## 256-COLORS Palette

| Palette       | XtermNum  | Hex     | 
| ------------- | --------- | ------- | 
| Background    | 235       | #262626 | 
| Foreground    | 255       | #eeeeee | 
| Selection     | 238       | #444444 | 
| Comment       | 243       | #767676 | 
| Red           | 205       | #ff5faf | 
| Green         | 157       | #afffaf | 
| Yellow        | 227       | #ffff5f | 
| Blue          | 153       | #afd7ff | 
| Purple        | 219       | #ffafff | 
| Cyan          | 123       | #87ffff | 


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

### Using Packer.nvim

```lua
use {'hardhackerlabs/theme-vim',  as = 'hardhacker'}
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
