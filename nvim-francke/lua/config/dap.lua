local dap = require("dap")
local dapui = require("dap")

dapui.setup()

require("dap-cs").setup({
    netcoredbg = {
        path = "netcoredbg",
    },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end

dap.listeners.before.event_initialized["dapui_config"] = function()
    dapui.close()
end

dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
end


vim.keymap.set("n", "<F5>", function() dap.continue() end, { desc = "Debug: continue" })
vim.keymap.set("n", "<F10>", function() dap.step_over() end, { desc = "Debug: step over" })
vim.keymap.set("n", "<F11>", function() dap.step_into() end, { desc = "Debug: step into" })
vim.keymap.set("n", "<F12>", function() dap.step_out() end, { desc = "Debug: step out" })
vim.keymap.set("n", "<leader>db", function() dap.toggle_breakpoint() end, { desc = "Toggle breakpoint" })
vim.keymap.set("n", "<leader>dr", function() dap.repl.open() end, { desc = "Open REPL" })
