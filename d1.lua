local utils = require'pl.utils'
local tabx = require'pl.tablex'

local input = io.open("d1in.txt", "r"):read("*a")
input = utils.split(input, "\n\n", true)
input = tabx.imap(function (v)
	return tabx.imap(function(v2) return tonumber(v2) end, utils.split(v))
end, input)
local final = tabx.imap(function (v)
	return tabx.reduce('+', v)
end, input)
table.sort(final)
print(final[#final])
print(final[#final] + final[#final - 1] + final[#final - 2])