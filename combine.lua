-- 组合

local _M = {}

local function combine(input, N, M, temp, l, p, output)
    if l == M + 1 then
        local res = {}
        for i = 1, M do
            res[i] = temp[i]
        end

        table.insert(output, res)
        return
    end

    for i = p, N do
        temp[l] = input[i]
        combine(input, N, M, temp, l + 1, i + 1, output)
    end
end

function _M.combine(input, M)
    local output = {}
    local temp = {}

    combine(input, #input, M, temp, 1, 1, output)

    return output
end

local function repeat_combine(input, N, M, temp, l, p, output)
    if l == M + 1 then
        local res = {}
        for i = 1, M do
            res[i] = temp[i]
        end

        table.insert(ouput, res)
        return
    end

    for i = p, N do
        temp[l] = input[i]
        repeat_combine(input, N, M, temp, l + 1, i, ouput)
    end
end

function _M.repeat_combine(input, M)
    local output = {}
    local temp = {}

    repeat_combine(input, #input, M, temp, 1, 1, output)

    return output
end

return _M
