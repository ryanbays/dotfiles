local dap = require('dap')
dap.adapters.python = {
    type = 'executable',
    command = 'venv/bin/python',
    args = { '-m', 'debugpy.adapter' },
}
dap.configurations.python = {
    {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
            return 'venv/bin/python'
        end,
    },
}
