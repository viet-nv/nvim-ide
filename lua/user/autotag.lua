local M = {
  "windwp/nvim-ts-autotag",
  event = "InsertEnter",
  dependencies = {
    {
      "hrsh7th/nvim-cmp",
      event = {
        "InsertEnter",
        "CmdlineEnter",
      },
    },
  },
}

function M.config()
  require("nvim-ts-autotag").setup()
end

return M
