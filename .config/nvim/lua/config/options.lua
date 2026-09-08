vim.filetype.add({
  extension = {
    FCMacro = "python",
    mmn = "mmn",
  },
})

vim.treesitter.language.register("mmn", "mmn")
