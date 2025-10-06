return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      local builtin = require("telescope.builtin")

      telescope.setup({
        defaults ={
          file_ignore_patterns ={},
        }
      }) -- basic setup

      vim.keymap.set("n", "<C-p>", function()
        builtin.find_files({ hidden = true, no_ignore = true })
      end,{desc = "find files(hidden too)"})

      -- Live grep (include hidden files as well)
      vim.keymap.set("n", "<leader>fg", function()
        builtin.live_grep({additional_args = { "--hidden" }})
      end, { desc = "Live grep" })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = require("telescope.themes").get_dropdown({})
        }
      })
      require("telescope").load_extension("ui-select")
    end,
  }
}

