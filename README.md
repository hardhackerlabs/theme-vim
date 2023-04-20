# HardHacker Theme for Vim

> Supported vim's gui and term environments

![](./media/preview.jpeg)

## Install

#### Git clone

```bash
git clone https://github.com/hardhackerlabs/theme-vim.git
cp theme-vim/colors/hardhacker.vim  ~/.vim/colors/
```

Add the following configuration to the `~/.vimrc` file, then restart Vim

```
syntax      enable
syntax      on
set         t_Co=256
colorscheme hardhacker
```

#### Vundle

Add the following configuration to the ~/.vimrc file, then execute `PluginInstall` command to install hardhacker theme

```
Plugin 'hardhackerlabs/theme-vim', { 'name': 'hardhacker' }
```

Note that before installing the theme, you need to have installed and configured **Vundle** package management