# fugitive-aliases.nvim

A NeoVim plugin that adds aliases to [vim-fugitive](https://github.com/tpope/vim-fugitive) commands.

## Installation

Chose your favorite plugins manager.

<details>
    <summary>lazy.nvim</summary>

```lua
{
    "kostya-zero/fugitive-aliases.nvim",
    ---@module "fugitive-aliases"
    ---@type fugitive-aliases.Config
    opts = {}, -- See Configuration section
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

## Setup & Configuration

The plugin is enabled by default when you call the `setup()` function.
If you're using `lazy.nvim` with the `opts` table, this is handled for you automatically.

To configure the plugin, pass a table to the `setup()` function.
You can disable any alias by setting its key to `false`.
By default, all aliases are enabled.

```lua
-- Example: Disable the "Ga" and "Gb" aliases
require("fugitive-aliases").setup({
  ga = false, -- Disables :Ga
  gb = false, -- Disables :Gb
})
```

## Default Configuration

```lua
require("fugitive-aliases").setup({
    gs = true,
    ga = true,
    gaa = true,
    gc = true,
    gl = true,
    gb = true,
})
```

## Usage

Use the aliases just like you would the full vim-fugitive commands. You can pass arguments to them as usual.

### Example

This command:

```vim
:Ga LICENSE README.md
```

is equivalent to:

```vim
:Git add LICENSE README.md
```

## Available aliases

| Alias | Fugitive Command | Description |
| ----- | ------- | ----------- |
| `Gs`  | `Git status` | Open the Git status pane. |
| `Ga`  | `Git add`  | Stage a file. Accepts arguments. |
| `Gaa` | `Git add .` | Stage all changes in the current directory. |
| `Gc` | `Git commit` | Open the commit pane. |
| `Gl` | `Git log` | Open the Git log. |
| `Gb` | `Git blame`| Open Git blame for the current file. |

## Contributing

Contributions are welcome!
Feel free to open an issue to suggest a feature or report a bug.
If you want to contribute code, please open a pull request.
