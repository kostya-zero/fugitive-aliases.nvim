# fugitive-aliases.nvim

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

#### Load plugin

If you are using `lazy.nvim` or `packer` to install this plugin
with the examples above, the plugin will be loaded automatically.

If not, install it your way first, and then put this somewhere in your configuration:

```lua
require("fugitive-aliases").setup()
```

#### Configuration

This plugin creates aliases for `vim-fugitive` as commands, for example `Ga` command will be an alias to `Git add`.
You can configure this behavior by disabling aliases in configuration that you dont want to enable.

```lua
require("fugitive-aliases").setup({
    -- Disable "Ga" alias
    ga = false
})
```

By default, all aliases are enabled.

#### Passing arguments

When using these aliases you still can pass your arguments to the command. For example:

```vim
:Ga LICENSE README.md

" Will be equivalent to:

:Git add LICENSE README.md
```

## Available aliases

| Alias | Command |
| ----- | ------- |
| `Gs`  | `Git status` |
| `Ga`  | `Git add`  |
| `Gaa` | `Git add .` |
| `Gc` | `Git commit` |
| `Gl` | `Git log` |
| `Gb` | `Git blame`|

## Contributing

Make a pull request...
