vim.api.nvim_create_user_command("ToggleBuffFormat", function()
  local buf = vim.api.nvim_get_current_buf()
  local enabled = vim.b[buf].disable_autoformat or nil
  if enabled then
    vim.b[buf].disable_autoformat = false
  else
    vim.b[buf].disable_autoformat = true
  end
end, {
  desc = "Toggle autoformat-on-save",
})

vim.api.nvim_create_user_command("ToggleFormat", function()
  local enabled = vim.g.disable_autoformat or nil
  if enabled then
    vim.g.disable_autoformat = false
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Toggle autoformat-on-save",
})
