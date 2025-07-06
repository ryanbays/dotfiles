local notify = require("notify")
notify.setup({
    render = "compact",
    background_colour = "#000000",
    stages = "fade",
    time_formats = {
        notification = "%Y",
        notification_history = "%FT%T"
    },
    timeout = 1500
})

vim.notify = notify
