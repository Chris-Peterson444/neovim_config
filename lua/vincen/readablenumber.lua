-- manual version of this package: https://github.com/asrul10/readable-number.nvim
local function readable_number()
	local curr = vim.fn.expand("<cword>")

	if tonumber(curr) then
		if #curr < 3 then
			return
		end
		local formatted = ""
		for i = #curr, 1, -3 do
			if i - 3 <= 0 then
				formatted = curr:sub(1, i) .. formatted
				break
			end
			formatted = "_" .. curr:sub(i - 2, i) .. formatted
		end
		vim.api.nvim_set_current_line(vim.fn.substitute(vim.fn.getline("."), curr, formatted, ""))
	end
end

vim.keymap.set('n', '<leader>ln', readable_number)


