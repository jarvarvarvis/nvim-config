---@diagnostic disable-next-line: unused-local
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

---@diagnostic disable-next-line: unused-local
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

local M = {}

function M.reorder_and_unpack_borders(borders, indices)
    -- Iterate indices and concatenate the border characters +
    -- insert them into a table
    local result_string = ""
    local result_table = {}

    for _, index in pairs(indices) do
        local border = borders[index]
        result_string = result_string .. border[1] -- Add character to the result string
        table.insert(result_table, border[1])      -- Insert character into table
    end

    return {
        result_string,
        result_table
    }
end

M.table_clockwise_from_top_left = rounded_corner_borders

local cardinals_first_corners_second_indices = {
    2, -- top
    4, -- right
    6, -- bottom
    8, -- left
    1, -- top left
    3, -- top right
    5, -- bottom right
    7  -- bottom left
}
local reorder_unpack_result = M.reorder_and_unpack_borders(M.table_clockwise_from_top_left,
    cardinals_first_corners_second_indices)
M.string_cardinals_first_corners_second = reorder_unpack_result[1]
M.table_cardinals_first_corners_second = reorder_unpack_result[2]

return M
