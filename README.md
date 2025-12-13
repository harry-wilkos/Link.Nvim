<h1 align="center">🔗 Link</h1>

<div align="center">
  <img src="https://img.shields.io/badge/neovim-57A143?logo=neovim&logoColor=white&style=for-the-badge" height="40" alt="lua logo"  />
  <img width="12" />
  <img src="https://img.shields.io/badge/Lua-2C2D72?logo=lua&logoColor=white&style=for-the-badge" height="40" alt="lua logo"  />
</div>

###

<h4 align="center">Hands free auto-install LSPs Formatters and Linters for Neovim</h4>

###


https://github.com/user-attachments/assets/cc5699b9-e108-41b0-88c4-ee3c25233bf4



## Motivation

This is a simple plugin aimed at people that can't be bothered finding individual linters, formatters and LSPs for every random file format they come accross. It's not intended to handle custom configuration of tools, but instead install and attatch them with a simple options table. I therefore reccomend setting up clients you daily drive according to plugins like [conform](https://github.com/stevearc/conform.nvim) or [nvim-lint](https://github.com/mfussenegger/nvim-lint) after this plugin, which just handless the installation element.
## Requirements
+ Neovim >= 0.11.0
#### Dependencies:
+ [Mason](https://github.com/mason-org/mason.nvim)
+ [Mason-LSPConfig](https://github.com/mason-org/mason-lspconfig.nvim)
+ [Nvim-LSPConfig](https://github.com/neovim/nvim-lspconfig)
+ [Conform](https://github.com/stevearc/conform.nvim)
+ [Mason-Conform](https://github.com/zknx/mason-conform.nvim)
+ [Nvim-Lint](https://github.com/mfussenegger/nvim-lint)
+ [Mason-Nvim-Lint](https://github.com/rshkarin/mason-nvim-lint)
###
>[!NOTE]
>The rather lengthy requirements list is due to my reliance on the name mappings from [Mason](https://github.com/mason-org/mason.nvim) to the client names which I don't have the time to maintain personally.


## Installation

Example using [lazy.nvim](https://github.com/folke/lazy.nvim):
```lua
{ 'harry-wilkos/link.nvim' }
```

Example using [packer.nvim](https://github.com/wbthomason/packer.nvim):
```lua
use { 'harry-wilkos/link.nvim' }
```

Example using [vim-plug](https://github.com/junegunn/vim-plug):
```vim
Plug 'harry-wilkos/link.nvim'
```

## Usage

Call the setup function in your Neovim config.

```lua
require("link").setup({})
```

## Configuration

>[!NOTE]
>Calling setup without an option will use the default value

### Default Config
```lua
{
    clean = true, -- Whether clients that are no longer required by the plugin
                  -- should be automatically uninstalled

    lsps = {
        limit = 1, -- The number of LSP's to use

    },

    formatters = {
        limit = 2 -- The number of Formatters's to use
    },

    linters = {
        limit = 1 -- The number of Linters's to use
    }

}
```

### Specify Preferences

Per file-type overrides can be used to ignore or include certain clients.

```lua
{
    lsps = {
        lua = {
            include = { "luals" } -- Lua LS will be used over other possible lsps
        }
    },
    formatters = {
        python = {
            include = {"isort"},
            exclude = {"black"} -- Black won't be considered for formatting
        },
        fish = {
            include = {"fish_indent"} -- Although not available on Mason, 
                                      -- will still priorities the externally 
                                      -- installed fish indent formatter
        }
    }
}
```
###
An example of the plugins' configuration can be seen in my [dotfiles](https://github.com/harry-wilkos/dotfiles/blob/main/nvim/.config/nvim/lua/plugins/link.lua)









