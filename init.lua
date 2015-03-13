local os = require 'os'
local boundary = require 'boundary'
local timer = require 'timer'

local param = boundary.param

local source = param.source or os.hostname()
local interval = param.pollInterval or 1000;

local last_cpus = nil

timer.setInterval(interval, function()
  local cpus = os.cpus()

  for _, cpu in ipairs(cpus) do
    cpu.total = 0

    for name, value in pairs(cpu.times) do
      cpu.total = cpu.total + value
    end
  end

  if last_cpus then
    for idx, cpu in ipairs(cpus) do
      local last_cpu = last_cpus[idx]

      local user = (cpu.times.user - last_cpu.times.user) / (cpu.total - last_cpu.total)

      if user == user then
        print(string.format("CPU_CORE %f %s-C%d", user, source, idx))
      end
    end
  end

  last_cpus = cpus
end)
