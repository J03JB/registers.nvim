local M = {}
local api = vim.api
local BUFNR_PER_TAB = {}

local BUFFER_OPTIONS = {
  swapfile = false,
  buftype = "nofile",
  modifiable = false,
  filetype = "NvimTree",
  bufhidden = "wipe",
  buflisted = false,
}

-- The initial state of a tab
local tabinitial = {
	-- The position of the cursor { line, column }
	cursor = { 0, 0 },
	-- The NvimTree window number
	winnr = nil,
}



function M.init()
	local tab = api.nvim_get_current_tabpage()
	vim.api.nvim_buf_set_name(M.get_bufnr(), "GitBar_" .. tab)

    for option, value in pairs(BUFFER_OPTIONS) do
        vim.bo[M.get_bufnr()][option] = value
    end
end

--- Returns the current nvim tree bufnr
---@return number
function M.get_bufnr()
	return BUFNR_PER_TAB[vim.api.nvim_get_current_tabpage()]
end

M.init()

return M

