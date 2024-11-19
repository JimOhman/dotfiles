local autocmd = vim.api.nvim_create_autocmd


autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)
    local view = vim.fn.winsaveview()
    -- Save the buffer contents
    vim.api.nvim_buf_call(buf, function()
      vim.cmd("silent write")
    end)
    -- Format the file
    vim.fn.system(string.format("black --quiet %s", filename))
    -- Reload the buffer and restore the view
    vim.cmd("edit!")
    vim.fn.winrestview(view)
  end,
})
