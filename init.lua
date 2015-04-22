local json = require('json')
local framework = require('framework.lua')
framework.table()
framework.util()
framework.functional()
local stringutil = framework.string

local Plugin = framework.Plugin
local NetDataSource = framework.NetDataSource
local net = require('net')
require('fun')(true) -- Shows a warn when overriding an existing function.

local items = {}

local params = framework.boundary.param
params.name = 'Boundary CPU Core'
params.version = '2.0'

items = params.items or items

local meterDataSource = NetDataSource:new('127.0.0.1', '9192')

function meterDataSource:onFetch(socket)
	socket:write('{"jsonrpc":"2.0","method":"query_metric","id":1,"params":{"match":"system.cpu.usage"}}\n')
end

local meterPlugin = Plugin:new(params, meterDataSource)

function meterPlugin:onParseValues(data)
	
	local result = {}
	local parsed = json.parse(data)
        if table.getn(parsed.result.query_metric) > 0 then
		for i = 1, table.getn(parsed.result.query_metric), 3 do
			if parsed.result.query_metric[i] ~= 'system.cpu.usage.total' then
				local cpuid = stringutil.urldecode(string.sub(parsed.result.query_metric[i], string.find(parsed.result.query_metric[i], "cpu=")+4, -1))
				local sourcename=meterPlugin.source.."-C"..cpuid
				local metric = {}

				metric.metric = "CPU_CORE"
				metric.source = sourcename
				metric.value = parsed.result.query_metric[i+1]
				table.insert(result, metric)
			end
		end
	end

	return result	

end

meterPlugin:run()
