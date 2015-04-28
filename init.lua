local json = require('json')
local framework = require('framework.lua')

local Plugin = framework.Plugin
local MeterDataSource = framework.MeterDataSource
local string = require('string')

local params = framework.params
params.name = 'Boundary CPU Core'
params.version = '2.1'
params.tags = 'cpu,core'

local data_source = MeterDataSource:new()
function data_source:onFetch(socket)
  socket:write(self:queryMetricCommand({match = 'system.cpu.usage'}))
end

local meterPlugin = Plugin:new(params, data_source)

function meterPlugin:onParseValues(data)
  
  local result = {}
  result['CPU_CORE'] = {}
  
  for _, v in ipairs(data) do
    local metric, cpu_id = string.match(v.metric, '^(system%.cpu%.usage)|cpu=(%d+)$')
    if (metric) then
      table.insert(result['CPU_CORE'], { value = v.value, source = 'C' .. cpu_id, timestamp = v.timestamp })
    end
  end

  return result

end

meterPlugin:run()
