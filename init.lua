local framework = require('framework.lua')
local Plugin = framework.Plugin
local MeterDataSource = framework.MeterDataSource
local each = framework.functional.each
local pack = framework.util.pack

local params = framework.params
params.name = 'Boundary CPU Core'
params.version = '2.1'
params.tags = 'cpu,core'

local data_source = MeterDataSource:new()
function data_source:onFetch(socket)
  socket:write(self:queryMetricCommand({match = 'system.cpu.usage'}))
end

local plugin = Plugin:new(params, data_source)

function plugin:onParseValues(data)
  local result = {}
  
  each(function (v, i) 
    local metric, cpu_id = v.metric:match('^(system%.cpu%.usage)|cpu=(%d+)$')
    if metric then
      table.insert(result, pack('CPU_CORE', v.value, v.timestamp, plugin.source .. '_C' .. cpu_id))
    end
  end, data)

  return result
end

plugin:run()
