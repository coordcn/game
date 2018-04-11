local combine   = require("./combine")
local permute   = require("./permute")
local utils     = require("./utils")

local begin_word = "hit"
local end_word = "cog"
local word_list = { "hot", "dot", "dog", "lot", "log", "cog" }

local function check(word1, word2)
    local count = 0
    for i = 1, #word1 do
        if string.byte(word1, i) == string.byte(word2, i) then
            count = count + 1
        end
    end

    if count == 2 then
        return true
    else
        return false
    end
end

local function check_list(list)
    local temp = list[1]
    for i = 2, #list do
        if not check(temp, list[i]) then
            return false
        end
        temp = list[i]
    end

    return true
end

for i = 1, #word_list do
    local c = combine.combine(word_list, i)
    for j = 1, #c do
        local p = permute.permute(c[j])
        for k = 1, #p do
            local tmp = p[k]
            if check(begin_word, tmp[1]) and 
               check(tmp[#tmp], end_word) and 
               check_list(tmp) then
                print(utils.dump(tmp))
            end
        end
    end
end
