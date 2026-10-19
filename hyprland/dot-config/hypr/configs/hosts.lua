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

local function load_hosts(path)
    local hosts = {}
    local file = io.open(path, "r")

    if not file then
        return hosts
    end

    for line in file:lines() do
        local read_hostname = line:match("^%s*(.-)%s*$")
        if read_hostname ~= "" and not line:match("^#") then
            hosts[read_hostname] = true
        end
    end

    file:close()
    return hosts
end

local hostname = get_hostname()
local laptop_hosts = load_hosts(os.getenv("HOME") .. "/.config/hypr/laptops.txt")

-- Hosts with NVIDIA-specific configuration.
local nvidia_hosts = {
    alexdesk = true,
}

return {
    hostname = hostname,
    is_nvidia = nvidia_hosts[hostname] == true,
    is_laptop = laptop_hosts[hostname] == true,
}

