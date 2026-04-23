vim.filetype.add({
  extension = {
    http = "http",
    mjml = "mjml",
    j2 = "jinja2",
    jinja2 = "jinja2",
    jinja = "jinja2",
  },
  pattern = {
    [".*/playbooks/.*%.ya?ml"] = "yaml.ansible",
    [".*/roles/.*%.ya?ml"] = "yaml.ansible",
    [".*/handlers/.*%.ya?ml"] = "yaml.ansible",
    [".*/tasks/.*%.ya?ml"] = "yaml.ansible",
    [".*/group_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/host_vars/.*%.ya?ml"] = "yaml.ansible",
    [".*/inventory/.*%.ya?ml"] = "yaml.ansible",
  },
})

vim.treesitter.language.register("yaml", "yaml.ansible")
vim.treesitter.language.register("html", "mjml")

vim.api.nvim_create_autocmd("FileType", {
  pattern = "mjml",
  callback = function()
    vim.treesitter.start()
  end,
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "yaml.ansible",
  callback = function()
    vim.bo.commentstring = "# %s"
  end,
})
