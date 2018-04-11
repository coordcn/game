-- 排列

local _M = {}

local function permute(input, index, M, output)
    if index == M + 1 then
        local res = {}
        for i = 1, M do
            res[i] = input[i]
        end

        table.insert(output, res)
        return
    end

    for i = index, M do
        input[i], input[index] = input[index], input[i]
        permute(input, index + 1, M, output)
        input[i], input[index] = input[index], input[i]
    end
end

function _M.permute(input)
    local output = {}

    permute(input, 1, #input, output)

    return output
end

return _M
