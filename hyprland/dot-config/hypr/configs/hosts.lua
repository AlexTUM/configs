-- hosts.lua
-- Host identification and hardware categories

local function get_hostname()
    local pipe = io.popen("/bin/uname -n")
    if not pipe then
        return ""
    end

    local name = pipe:read("*l") or ""
    pipe:close()

    return name
end

local hostname = get_hostname()

-- Hosts with NVIDIA-specific configuration.
local nvidia_hosts = {
    alexdesk = true,
}

-- Hosts that are laptops.
local laptop_hosts = {
}

return {
    hostname = hostname,
    is_nvidia = nvidia_hosts[hostname] == true,
    is_laptop = laptop_hosts[hostname] == true,
}

