# NvChad-Config

## TOC


<!--toc:start-->
- [NvChad-Config](#nvchad-config)
  - [What are we talking about?](#what-are-we-talking-about)
  - [Content](#content)
<!--toc:end-->

## Author
Owner : Guglielmi Matteo [@github](https://github.com/MatteoGuglielmi-tech)

## What are we talking about?
This repository contains a revisited and extended configuration of [NvChad](https://nvchad.com/), a **blazing fast Neovim config** providing solid default and a beautiful UI. The advantage in using NvChad is that it provides a set of
feature that's exhaustive and sufficient for the majority of the users. It is also a good way to get close to the Vim world which is fascinating and pretty harsh at the same time. Indeed, all the Vim based editor, such as Neovim, LunarVim
or AstroVim, require lots of configuration sometimes not that trivial. NvChad comes to the rescue and provides a **ready to use config with lots of features** (for the whole list, please refer to 
[plugin list](https://github.com/NvChad/NvChad#plugins-list).  

## Content
This repository presents the following structure:
```bash
.
├── init.lua
├── LICENSE
├── lua
│   ├── core
│   │   ├── default_config.lua
│   │   ├── init.lua
│   │   ├── lazy_load.lua
│   │   ├── mappings.lua
│   │   ├── options.lua
│   │   └── utils.lua
│   └── plugins
│       ├── configs
│       │   ├── alpha.lua
│       │   ├── cmp.lua
│       │   ├── lspconfig.lua
│       │   ├── mason.lua
│       │   ├── null-ls.lua
│       │   ├── nvimtree.lua
│       │   ├── nvterm.lua
│       │   ├── others.lua
│       │   ├── telescope.lua
│       │   ├── treesitter.lua
│       │   └── whichkey.lua
│       └── init.lua
└── README.md
```
where:
- the outer most `init.lua` calls the plugin manager [Packer.nvim](https://github.com/wbthomason/packer.nvim) which allows to install all the necessary plugins forseen in the basic NvChad config and some others I personally added;
- in the `lua` folder it is possible to find the core configuration files that make NvChad so amazing. The most interesting ones resides in the `plugins/config` folder where it is possible to find:
    - `alpha.lua`: it essentially defined the layout and appearance of the greeter (for more info refer to [alpha.nvim](https://github.com/goolord/alpha-nvim));
    - `cmp.lua`: a completion engine plugin for neovim. Allows also to define some keybindings for navigation in floating windows (for more info refer to [nvim-cmp](https://github.com/hrsh7th/nvim-cmp));
    - `lspconfig.lua`: allows to deal with the installation and configuration of different language servers  (for more info refer to [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig));
    - `mason.lua`: can be used alongside `nvim-lspconfig` and allows to easily install and manage LSP servers, DAP, linters and formatters (for more info please refer to [mason.nvim](https://github.com/williamboman/mason.nvim));
    - `null-ls.lua`: allow to use Neovim as language server to integrate LSP related capabilities (for more details, refer to [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim));
    - `nvimtree.lua`: file explorer for Neovim (for more info refer to [nvim-tree.lua](https://github.com/nvim-tree/nvim-tree.lua));
    - `nvterm.lua`: allows to interact and toggle terminals (for more info refer to [nvterm](https://github.com/NvChad/nvterm));
    - `others.lua`: contains some other "small" plugins used under the hood;
    - `telescope.lua`: very powerful fuzzy finder (see [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim)); 
    - `treesitter.lua`: to provide an easy way to use the interface for [tree-sitter](https://github.com/tree-sitter/tree-sitter) and introduce some basic functionalities such as highlighting base don parsing 
    (ref. [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter));
    - `whichkey.lua`: displays a popup with all possible recorded bindings (for more info refer to [which-key.nvim](https://github.com/folke/which-key.nvim));
- in the `init.lua` inside the `plugins` folder, some specifications regarding the used plugins are defined.

