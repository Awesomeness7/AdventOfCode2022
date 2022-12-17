local utils = require'pl.utils'
local tabx = require'pl.tablex'
local List = require'pl.List'
local p = require'pl.pretty'
local C = require('pl.comprehension').new()
local comp = C'_1(x) for x'

local input = List(utils.readlines("d4in.txt"))
input = input:map(function (v)
	local pairs = utils.split(v, ",")
	local p1 = utils.split(pairs[1], "-")
	local p2 = utils.split(pairs[2], "-")
	return {comp(tonumber, p1), comp(tonumber, p2)}
end)

local output = input:map(function (v)
	local p1 = v[1]
	local p2 = v[2]
	if p1[1] <= p2[1] and p1[2] >= p2[2] then
		return true
	elseif p1[1] >= p2[1] and p1[2] <= p2[2] then
		return true
	end
	return false
end)
local final = output:count(true)

print(final)

output = input:map(function (v)
	local p1 = v[1]
	local p2 = v[2]
	if p1[1] <= p2[1] and p2[1] <= p1[2] then
		return true
	elseif p1[1] <= p2[2] and p2[2] <= p1[2] then
		return true
	elseif p2[1] <= p1[1] and p1[1] <= p2[2] then
		return true
	elseif p2[1] <= p1[2] and p1[2] <= p2[2] then
		return true
	end
	return false
end)

print(output:count(true))