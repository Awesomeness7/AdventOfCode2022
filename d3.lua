local utils = require'pl.utils'
local tabx = require'pl.tablex'

local input = utils.readlines("d3in.txt")
input = tabx.imap(function (v)
	local val = tabx.keys(tabx.merge(tabx.index_map{string.byte(string.sub(v, 1, #v/2), 1, -1)}, tabx.index_map{string.byte(string.sub(v, #v/2 + 1), 1, -1)}))[1]
	if val <= 90 then
		val = val - 38
	else
		val = val - 96
	end
	return val
end, input)

print(tabx.reduce('+', input))

input = utils.readfile("d3in.txt")
local inputTemp = {}
for w in string.gmatch(input, "%a+%s%a+%s%a+") do
	table.insert(inputTemp, utils.split(w))
end
input = tabx.imap(function (v)
	local sack1 = tabx.index_map{string.byte(v[1], 1, -1)}
	local sack2 = tabx.index_map{string.byte(v[2], 1, -1)}
	local sack3 = tabx.index_map{string.byte(v[3], 1, -1)}
	local tempMerge = tabx.merge(sack1, sack2)
	local val = tabx.keys(tabx.merge(tempMerge, sack3))[1]
	if val <= 90 then
		val = val - 38
	else
		val = val - 96
	end
	return val
end, inputTemp)

print(tabx.reduce('+', input))