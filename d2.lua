local utils = require'pl.utils'
local tabx = require'pl.tablex'
local p = require'pl.pretty'

local input = utils.readfile("d2in.txt")
input = string.gsub(input, "X", "A")
input = string.gsub(input, "Y", "B")
input = string.gsub(input, "Z", "C")
input = utils.split(input, "\n", true)
input = tabx.imap(function (v)
	local bytes = {string.byte(v, 1, 3)}
	return {bytes[1] - 64, bytes[3] - 64}
end, input)
local final = tabx.imap(function (v)
	local score = 0
	if v[1] == 3 and v[2] == 1 then
		score = 6
	elseif v[1] == 1 and v[2] == 3 then
		score = 0
	elseif v[1] == v[2] then
		score = 3
	elseif v[2] > v[1] then
		score = 6
	end
	return score + v[2]
end, input)
print("part 1:")
print(tabx.reduce('+', final))
-- part 2
local final = tabx.imap(function (v)
	local score = 0
	local hand
	--lose
	if v[2] == 1 then
		hand = v[1] - 1
		if hand < 1 then hand = 3 end
	-- tie
	elseif v[2] == 2 then
		score = 3
		hand = v[1]
	--win
	else
		score = 6
		hand = v[1] + 1
		if hand > 3 then hand = 1 end
	end
	return score + hand
end, input)
print("part 2:")
print(tabx.reduce('+', final))