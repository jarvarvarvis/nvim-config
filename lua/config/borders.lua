local rounded_corner_borders = {
    { "╭", "FloatBorder" }, -- top left
    { "─", "FloatBorder" }, -- top
    { "╮", "FloatBorder" }, -- top right
    { "│", "FloatBorder" }, -- right
    { "╯", "FloatBorder" }, -- bottom right
    { "─", "FloatBorder" }, -- bottom
    { "╰", "FloatBorder" }, -- bottom left
    { "│", "FloatBorder" }, -- left
}

local corner_borders = {
    { "┌", "FloatBorder" }, -- top left
    { "─", "FloatBorder" }, -- top
    { "┐", "FloatBorder" }, -- top right
    { "│", "FloatBorder" }, -- right
    { "┘", "FloatBorder" }, -- bottom right
    { "─", "FloatBorder" }, -- bottom
    { "└", "FloatBorder" }, -- bottom left
    { "│", "FloatBorder" }, -- left
}

local function unpack_nvim_api_borders(borders)
    local ordered_border_indices = {
        2, -- top
        4, -- right
        6, -- bottom
        8, -- left
        1, -- top left
        3, -- top right
        5, -- bottom right
        7  -- bottom left
    }

    -- Iterate indices and concatenate the border characters +
    -- insert them into a table
    local result_string = ""
    local result_table = {}

    for _, index in pairs(ordered_border_indices) do
        local border = borders[index]
        result_string = result_string .. border[1] -- Add character to the result string
        table.insert(result_table, border[1])      -- Insert character into table
    end

    return {
        result_string,
        result_table
    }
end

local M = {}
M.border = rounded_corner_borders

local unrolled = unpack_nvim_api_borders(M.border)
M.border_character_string = unrolled[1]
M.border_character_table = unrolled[2]

return M
