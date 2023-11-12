-- To get telescope-file-browser loaded and working with telescope,
-- you need to call load_extension, somewhere after setup function:
local telescope = require('telescope')
telescope.load_extension("live_grep_args")
telescope.load_extension("file_browser")
telescope.load_extension("live_grep_args")
