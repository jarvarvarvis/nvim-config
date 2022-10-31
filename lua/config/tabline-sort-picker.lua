local pickers = require('telescope.pickers')
local finders = require('telescope.finders')
local conf = require('telescope.config').values
local dropdown = require('telescope.themes').get_dropdown {}

local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')

local pick_tabline_sort_mode = function(opts)
    -- Get arguments
    op_map = opts.op_map
    remaining_opts = opts.remaining_opts or {}

    -- Collect results
    local results = {}
    local n = 0

    for key, value in pairs(op_map) do
        n = n + 1
        results[n] = key
    end

    -- Create the picker
    pickers.new(remaining_opts, {
        prompt_title = "Tabline sort mode",
        finder = finders.new_table {
            results = results
        },
        sorter = conf.generic_sorter(remaining_opts),
        attach_mappings = function(prompt_bufnr, map)
            actions.select_default:replace(function()
                actions.close(prompt_bufnr)
                local selection = action_state.get_selected_entry()
                local sort = op_map[selection[1]]

                -- Sort, if the function value in the map is valid
                if sort ~= nil then
                    sort()
                end
            end)
            return true
        end
    }):find()
end

local M = {}
M.pick_tabline_sort_mode = function(op_map)
    pick_tabline_sort_mode({
        op_map = op_map,
        remaining_opts = dropdown
    })
end

return M
