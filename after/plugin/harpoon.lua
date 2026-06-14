local harpoon = require('harpoon')
  harpoon:setup({})

  local conf = require("telescope.config").values
  local action_state = require("telescope.actions.state")
  local actions = require("telescope.actions")

  local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
      end

      require("telescope.pickers").new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table({
              results = file_paths,
              entry_maker = function(entry)
                  return {
                      value = entry,
                      display = entry,
                      ordinal = entry,
                      path = entry,
                  }
              end,
          }),
          previewer = conf.file_previewer({}),
          sorter = conf.generic_sorter({}),
          attach_mappings = function(prompt_bufnr, map)
              local delete_entry = function()
                  local selection = action_state.get_selected_entry()
                  harpoon_files:remove_at(selection.index)
                  actions.close(prompt_bufnr)
                  toggle_telescope(harpoon_files)
              end
              map("i", "<C-d>", delete_entry)
              map("n", "dd", delete_entry)
              return true
          end,
      }):find()
  end

  vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
      { desc = "Open harpoon window" })

  vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
  vim.keymap.set("n", "<leader>r", function() harpoon:list():remove() end,
      { desc = "Remove current file from harpoon" })

  vim.keymap.set("n", "<C-h>", function() harpoon:list():select(1) end)
  vim.keymap.set("n", "<C-t>", function() harpoon:list():select(2) end)
  vim.keymap.set("n", "<C-n>", function() harpoon:list():select(3) end)
  vim.keymap.set("n", "<C-s>", function() harpoon:list():select(4) end)
