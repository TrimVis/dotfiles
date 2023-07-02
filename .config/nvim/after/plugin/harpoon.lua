local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>ha", mark.add_file)
vim.keymap.set("n", "<leader>hm", ui.toggle_quick_menu)

-- Quickly jump to files
vim.keymap.set("n", "<leader>hg", function() ui.nav_file(1) end)
