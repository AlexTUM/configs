-- Debuggers: gdb (for c and cpp), python
-- keybinds to interact with debugger UI

local function get_python()
    local venv = os.getenv("VIRTUAL_ENV")

    if venv then
        local executable = vim.fn.has("win32") == 1
            and venv .. "/Scripts/python.exe"
            or venv .. "/bin/python"

        if vim.fn.executable(executable) == 1 then
            return executable
        end
    end

    return vim.fn.exepath("python3") ~= ""
        and vim.fn.exepath("python3")
        or "python"
end

local function python_dap_setup()
    require("dap-python").setup(get_python())
end

local function gdb_dap_setup()
    local dap = require("dap")

    dap.adapters.gdb = {
        type = "executable",
        command = "gdb",
        args = { "-i", "dap" }
    }

    local gdb_configuration = {
        {
            name = "Launch executable",
            type = "gdb",
            request = "launch",
            program = function()
                return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
        },
    }
    dap.configurations.c = vim.deepcopy(gdb_configuration)
    dap.configurations.cpp = vim.deepcopy(gdb_configuration)
end

local function basic_dap_setup()
    local dap = require("dap")
    local dapui = require("dapui")

    dapui.setup()

    dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
        dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
        dapui.close()
    end

    gdb_dap_setup()
end

return {
    {
        "mfussenegger/nvim-dap",
        keys = {
            {
                "<leader>db",
                function()
                    require("dap").toggle_breakpoint()
                end,
                desc = "Debug: Toggle breakpoint",
            },

            {
                "<leader>dc",
                function()
                    require("dap").continue()
                end,
                desc = "Debug: Continue (or start debugging)",
            },

            {
                "<leader>di",
                function()
                    require("dap").step_into()
                end,
                desc = "Debug: Step into",
            },

            {
                "<leader>do",
                function()
                    require("dap").step_over()
                end,
                desc = "Debug: Step over",
            },

            {
                "<leader>dO",
                function()
                    require("dap").step_out()
                end,
                desc = "Debug: Step out",
            },

            {
                "<leader>dt",
                function()
                    require("dap").terminate()
                end,
                desc = "Debug: Terminate",
            },

            {
                "<leader>du",
                function()
                    require("dapui").toggle()
                end,
                desc = "Debug: Toggle UI",
            },
        },
        dependencies = {
            {
                "rcarriga/nvim-dap-ui",
                dependencies = {
                    "nvim-neotest/nvim-nio",
                },
                config = true,
            },
        },
        config = basic_dap_setup,
    },
    {
        "mfussenegger/nvim-dap-python",
        ft = {
            "python",
        },
        dependencies = {
            "mfussenegger/nvim-dap",
        },
        config = python_dap_setup,
    },
}
