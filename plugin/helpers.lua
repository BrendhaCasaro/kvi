function StartsWith(str, prefix)
	return string.sub(str, 1, #prefix) == prefix
end

function MergeTables(t1, t2)
	local result = {}

	for k, v in pairs(t1) do
		result[k] = v
	end

	for k, v in pairs(t2) do
		result[k] = v
	end

	return result
end
