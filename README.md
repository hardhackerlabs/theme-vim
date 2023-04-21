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

Add the following configuration to the `~/.vimrc` file, then restart Vim

```
syntax      enable
syntax      on
set         t_Co=256
colorscheme hardhacker
```

### Using Vundle

Add the following configuration to the ~/.vimrc file, then execute `PluginInstall` command to install hardhacker theme

```
Plugin 'hardhackerlabs/theme-vim', { 'name': 'hardhacker' }
```

Note that before installing the theme, you need to have installed and configured **Vundle** plugin management

Add the following configuration to the `~/.vimrc` file, then restart Vim

```
syntax      enable
syntax      on
set         t_Co=256
colorscheme hardhacker
```
