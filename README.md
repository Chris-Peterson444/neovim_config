# Neovim configuration
This is my personal Neovim configuration based on ThePrimeagen's awesome guide: [GitHub](https://github.com/ThePrimeagen/init.lua/) and [Video](https://www.youtube.com/watch?v=w7i4amO_zaE)

List of plugins can be found in [lua/vincen/packer.lua](lua/vincen/packer.lua)

Also requires:
- [ripgrep](https://github.com/BurntSushi/ripgrep) for Grep replacement in Telescope.
- A virtual environment named `venv` in the `~/.config/nvim/` directory which has the `pynvim` package installed (for Python LSP support).
- A [patched font](https://github.com/ryanoasis/nerd-fonts) to properly render some symbols in Lualine, Telescope, etc.

Useful but not necessary:
- [fzf](https://github.com/junegunn/fzf) and tmux
