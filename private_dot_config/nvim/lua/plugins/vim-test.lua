return{
    "vim-test/vim-test",
    dependencies = {
        "preservim/vimux",
    },
    config = function() {
        vim.keymap.set('n', '<leader>t', ':TestNearest<CR>', { desc = 'Run the nearest [T]est' }),
        vim.keymap.set('n', '<leader>T', ':TestFile<CR>', { desc = 'Run the current [T]est file' }),
        vim.keymap.set('n', '<leader>a', ':TestSuite<CR>', { desc = 'Run the [A]ll tests' }),
        vim.keymap.set('n', '<leader>l', ':TestLast<CR>', { desc = 'Run the [L]ast test' }),
        vim.keymap.set('n', '<leader>g', ':TestVisit<CR>', { desc = 'Visit the test file' }),
        vim.cmd('let test#strategy = "vimux"'),
    }
}