vim.filetype.add({
  extension = {
    http = "http",
  },
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.ansible",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
