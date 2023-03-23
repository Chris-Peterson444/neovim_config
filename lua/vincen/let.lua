local config_path = os.getenv('HOME')
-- Specifically required for python based plugins
vim.g.python3_host_prog = config_path .. '/.config/nvim/venv/bin/python3'
