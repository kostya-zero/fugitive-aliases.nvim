# `fugitive-aliases.nvim`

A NeoVim plugin that adds aliases to [vim-fugitive](https://github.com/tpope/vim-fugitive) commands.

## Installation

<details>
    <summary>lazy.nvim</summary>

```lua
{
    "kostya-zero/fugitive-aliases.nvim",
    ---@module "fugitive-aliases"
    ---@type fugitive-aliases.Config
    opts = {}
    dependencies = {
        "tpope/vim-fugitive"
    },
    lazy = false,
}
```

</details>

<details>
    <summary>Packer</summary>

```lua
use({
    "kostya-zero/fugitive-aliases.nvim",
    config = function()
        require("fugitive-aliases").setup()
    end
})
```

</details>

## Getting started

If you are using `lazy.nvim` or `packer` to install this plugin
with examples above, plugin will be loaded already.

If not, install it your way, and then put this somewhere in your configuration:

```lua
require("fugitive-aliases").setup()
```
