local autocmd = vim.api.nvim_create_autocmd


vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.py",
  callback = function()
    local buf = vim.api.nvim_get_current_buf()
    local filename = vim.api.nvim_buf_get_name(buf)
    local view = vim.fn.winsaveview()
    vim.fn.system(string.format("black --quiet %s", filename))
    vim.cmd("e!")
    vim.fn.winrestview(view)
  end,
})
