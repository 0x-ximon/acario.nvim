# acario.nvim

Port of the Emacs Doom Acario Theme.

> [!WARNING]
> This colorscheme is still in development.

## Installation

If you enjoy living on the edge, you can install it via your favorite plugin manager. Here's an example using [Lazy.nvim](https://github.com/folke/lazy.nvim):

```lua
return {
    "0x-ximon/acario.nvim",
    name = "acario",
    lazy = false,
    priority = 1000,
    config = function()
        require("acario").setup({})
        
        -- Select the desired colorscheme variant
        -- vim.cmd("colorscheme acario_light")
        -- vim.cmd("colorscheme acario_dark")
    end,
}
```

## Credits

This colorscheme is inspired by the Emacs Doom Acario Theme and is a fork of the [Dracula.nvim](https://github.com/Mofiqul/dracula.nvim) colorscheme.
