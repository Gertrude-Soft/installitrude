--
-- EPITECH PROJECT, 2024
-- installitrude
-- File description:
-- init.lua
--

---@diagnostic disable-next-line
local ital = "\27[3m"
local bold = "\27[1m"

---@diagnostic disable-next-line
local green = "\27[32m"
---@diagnostic disable-next-line
local yellow = "\27[33m"
local red = "\27[31m"
local none = "\27[0m"

---@type string
local input
local devmode = false

print(green .. bold .. "== Entering Git Installation Mode ==\n" .. none)

-- Parse arguments
if arg[1] == "demode-on" and #arg == 2 then
    input = "https://github.com/" .. arg[2]
    devmode = true
elseif arg[1] == "devmode-on" and #arg ~= 2 then
    print(red .. "Gertrude's assistant was underwhelmed with arguments." .. none)
    os.exit(84)
elseif #arg ~= 1 then
    print(red .. "Gertrude's assistant was overwhelmed with arguments." .. none)
    os.exit(84)
else
    input = arg[1]
end
print(bold .. "-- Input given: " .. input .. " --".. none)

-- Verify repo with api
os.execute("curl https://api.github.com/repos/" .. input .. "/commits/main" ..
    "--no-progress-meter &> /tmp/installitrude/git_install")
if not os.execute("cat /tmp/installitrude/git_install | grep 'Not Found' > /dev/null") then
    print(green .. bold .. "Good plant: repo found ("..input..")" .. none)
else
    print(red .. bold .. "Bad plant, repo does not exist. \nRepo must follow AUTHOR/REPO_NAME." .. none)
    os.execute("rm /tmp/installitrude/git_install")
    os.exit(84)
end
os.execute("rm /tmp/installitrude/git_install")
