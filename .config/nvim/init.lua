vim.o.encoding = "utf-8"
vim.o.fileencodings = "utf-8,iso-2022-jp,cp932,euc-jp,default,latin"
vim.o.number = true
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.showmatch = true
vim.o.matchtime = 1
vim.o.history = 10000
vim.o.showcmd = true
vim.o.incsearch = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.wrapscan = true
vim.o.backspace = "indent,eol,start"
vim.o.ruler = true
vim.o.laststatus = 2
vim.o.mouse = "a"
vim.o.cmdheight = 2
vim.o.scrolloff = 10
vim.o.expandtab = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.softtabstop = 4
vim.o.showtabline = 4
vim.o.iminsert = 0
vim.o.imsearch = 0
vim.o.list= true
vim.o.listchars = "tab:>-,trail:_,eol:↴"
vim.o.clipboard = "unnamed,unnamedplus"
vim.o.shellslash = true
vim.o.browsedir = "buffer"
vim.o.ambiwidth = "single"
vim.o.autoread = true
vim.o.showmode = true
vim.o.hidden = true
vim.o.title = true
vim.o.display = "lastline"
vim.o.pumheight = 10
vim.o.shiftround = true
-- vim.o.relativenumber = true
vim.o.scrolloff = 4
vim.o.termguicolors = true

vim.cmd('set nobackup')
vim.cmd('set nocompatible')
vim.cmd('set wildmenu wildmode=list:longest,full')
vim.cmd('set noswapfile')
vim.cmd('set visualbell t_vb=')
vim.cmd('set noerrorbells')

vim.cmd('set grepprg=rg\\ --vimgrep\\ --no-heading')
vim.cmd('set grepformat=%f:%l:%c:%m,%f:%l:%m')

vim.keymap.set('i', '<C-h>', '<BS>', {noremap = true, silent = true})
vim.keymap.set('i', '<C-d>', '<Del>', {noremap = true, silent = true})

vim.keymap.set('n', 'j', 'gj', {noremap = true, silent = true})
vim.keymap.set('n', 'k', 'gk', {noremap = true, silent = true})
vim.keymap.set('n', '<Down>', 'gj', {noremap = true, silent = true})
vim.keymap.set('n', '<Up>', 'gk', {noremap = true, silent = true})
vim.keymap.set('n', 'gj', 'j', {noremap = true, silent = true})
vim.keymap.set('n', 'gk', 'k', {noremap = true, silent = true})
vim.keymap.set('n', ';', ':', {noremap = true, silent = true})
vim.keymap.set('n', ':', ';', {noremap = true, silent = true})
vim.keymap.set('n', 'Q', 'gQ', {noremap = true, silent = true})
vim.keymap.set('n', 'Y', 'y$', {noremap = true, silent = true})
vim.keymap.set('v', 'y', 'y`]')
vim.keymap.set({ 'v', 'n' }, 'p', 'p`]')
vim.keymap.set('n', '<Tab>', ':bnext<CR>')
vim.keymap.set('n', '<S-Tab>', ':bprev<CR>')

vim.keymap.set('n', 'x', '"_x', {noremap = true, silent = true})
vim.keymap.set('n', 'X', '"_X', {noremap = true, silent = true})
vim.keymap.set('n', 's', '"_s', {noremap = true, silent = true})

vim.keymap.set('c', '<C-a>', '<Home>', {noremap = true, silent = false})
vim.keymap.set('c', '<C-b>', '<Left>', {noremap = true, silent = false})
vim.keymap.set('c', '<C-d>', '<Del>', {noremap = true, silent = false})
vim.keymap.set('c', '<C-e>', '<End>', {noremap = true, silent = false})
vim.keymap.set('c', '<C-f>', '<Right>', {noremap = true, silent = false})
vim.keymap.set('c', '<M-b>', '<S-Left>', {noremap = true, silent = false})
vim.keymap.set('c', '<M-f>', '<S-Right>', {noremap = true, silent = false})

vim.keymap.set('c', '%s/', '%s/\v', {noremap = true, silent = false})

vim.keymap.set('i', '<C-b>', '<Left>', {noremap = true, silent = false})
vim.keymap.set('i', '<C-f>', '<Right>', {noremap = true, silent = false})
vim.keymap.set('i', '<C-a>', '<Home>', {noremap = true, silent = false})
vim.keymap.set('i', '<C-e>', '<End>', {noremap = true, silent = false})
vim.keymap.set('i', '<C-d>', '<Del>', {noremap = true, silent = false})

vim.keymap.set('v', ';', ':', {noremap = true, silent = false})
vim.keymap.set('v', ':', ';', {noremap = true, silent = false})

vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', {noremap = true, silent = false})

vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

if vim.fn.has('wsl') == 1 then
    vim.g.clipboard = {
        name = "win32yank-wsl",
        copy = {
            ["+"] = "xsel -bi",
            ["*"] = "xsel -bi"
        },
        paste = {
            ["+"] = 'xsel -bo',
            ["*"] = 'xsel -bo'
        },
        cache_enable = 0,
    }
end

require('plugin')
