-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
if should_profile then
  local hrtime = vim.loop.hrtime
  profile_info = {}
  time = function(chunk, start)
    if start then
      profile_info[chunk] = hrtime()
    else
      profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
    end
  end
else
  time = function(chunk, start) end
end

local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/skjkw/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?.lua;/home/skjkw/.cache/nvim/packer_hererocks/2.1.1692716794/share/lua/5.1/?/init.lua;/home/skjkw/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?.lua;/home/skjkw/.cache/nvim/packer_hererocks/2.1.1692716794/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/skjkw/.cache/nvim/packer_hererocks/2.1.1692716794/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  CamelCaseMotion = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/CamelCaseMotion",
    url = "https://github.com/bkad/CamelCaseMotion"
  },
  ["Comment.nvim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0ƒ\1\1\0\4\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0023\3\n\0=\3\v\2B\0\2\1K\0\1\0\rpre_hook\0\ropleader\1\0\2\tline\agc\nblock\agb\ftoggler\1\0\2\tline\bgcc\nblock\bgbc\rmappings\1\0\2\nbasic\2\nextra\1\1\0\1\fpadding\2\nsetup\fComment\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/Comment.nvim",
    url = "https://github.com/numToStr/Comment.nvim"
  },
  LuaSnip = {
    after = { "nvim-cmp" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/LuaSnip",
    url = "https://github.com/L3MON4D3/LuaSnip"
  },
  ["barbar.nvim"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    url = "https://github.com/romgrk/barbar.nvim"
  },
  ["browse.nvim"] = {
    config = { "\27LJ\2\nI\0\0\4\1\4\0\t6\0\0\0'\2\1\0B\0\2\0029\0\1\0005\2\2\0-\3\0\0=\3\3\2B\0\2\1K\0\1\0\0¿\14bookmarks\1\0\0\vbrowse\frequireè\2\1\0\6\0\f\0\0175\0\0\0006\1\1\0'\3\2\0B\1\2\0029\1\3\0015\3\4\0=\0\5\3B\1\2\0016\1\6\0009\1\a\0019\1\b\1'\3\t\0'\4\n\0003\5\v\0B\1\4\0012\0\0ÄK\0\1\0\0\15<leader>gb\6n\bset\vkeymap\bvim\14bookmarks\1\0\1\rprovider\vgoogle\nsetup\vbrowse\frequire\1\0\2\15php_manual,https://www.php.net/manual/ja/index.php\flaravel;https://readouble.com/laravel/9.x/ja/installation.html\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/browse.nvim",
    url = "https://github.com/lalitmee/browse.nvim"
  },
  ["cmp-buffer"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-buffer/after/plugin/cmp_buffer.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-buffer",
    url = "https://github.com/hrsh7th/cmp-buffer"
  },
  ["cmp-calc"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-calc/after/plugin/cmp_calc.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-calc",
    url = "https://github.com/hrsh7th/cmp-calc"
  },
  ["cmp-cmdline"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-cmdline/after/plugin/cmp_cmdline.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-cmdline",
    url = "https://github.com/hrsh7th/cmp-cmdline"
  },
  ["cmp-cmdline-history"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history/after/plugin/cmp_cmdline_history.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-cmdline-history",
    url = "https://github.com/dmitmel/cmp-cmdline-history"
  },
  ["cmp-dictionary"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-dictionary/after/plugin/cmp_dictionary.lua" },
    config = { "\27LJ\2\nÏ\1\0\0\5\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\2B\0\2\1K\0\1\0\bdic\1\0\b\nexact\3\2\ndebug\1\rcapacity\3\5\14max_items\3ˇˇˇˇ\15\nasync\1\21document_command\16wn %s -over\rdocument\1\27first_case_insensitive\1\6*\1\0\0\1\2\0\0 ~/.config/nvim/dict/en.dict\nsetup\19cmp_dictionary\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-dictionary",
    url = "https://github.com/uga-rosa/cmp-dictionary"
  },
  ["cmp-emoji"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-emoji/after/plugin/cmp_emoji.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-emoji",
    url = "https://github.com/hrsh7th/cmp-emoji"
  },
  ["cmp-git"] = {
    config = { "\27LJ\2\n3\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\3\0\18\n\1\0D\5\5\0\16get_commits\bgit5\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\4\0\18\n\1\0D\5\5\0\15get_issues\vgitlab7\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\4\0\18\n\1\0D\5\5\0\17get_mentions\vgitlab=\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\4\0\18\n\1\0D\5\5\0\23get_merge_requests\vgitlab=\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\4\0\18\n\1\0D\5\5\0\23get_issues_and_prs\vgithub7\0\5\v\0\2\0\a9\5\0\0\18\a\5\0009\5\1\5\18\b\2\0\18\t\4\0\18\n\1\0D\5\5\0\17get_mentions\vgithubø\t\1\0\b\0/\0m6\0\0\0'\2\1\0B\0\2\0026\1\0\0'\3\2\0B\1\2\0026\2\0\0'\4\3\0B\2\2\0029\2\4\0025\4\6\0005\5\5\0=\5\a\0045\5\b\0=\5\t\0045\5\15\0005\6\n\0009\a\v\0019\a\f\a=\a\r\0069\a\v\0009\a\f\a=\a\14\6=\6\f\5=\5\v\0045\5\21\0005\6\17\0005\a\16\0=\a\18\0069\a\19\0019\a\20\a=\a\r\0069\a\19\0009\a\20\a=\a\14\6=\6\20\0055\6\22\0009\a\19\0019\a\23\a=\a\r\0069\a\19\0009\a\23\a=\a\14\6=\6\23\0055\6\25\0005\a\24\0=\a\18\0069\a\19\0019\a\26\a=\a\r\0069\a\19\0009\a\26\a=\a\14\6=\6\26\5=\5\19\0045\5\29\0005\6\27\0009\a\28\0019\a\20\a=\a\r\0069\a\28\0009\a\20\a=\a\14\6=\6\20\0055\6\30\0009\a\28\0019\a\23\a=\a\r\0069\a\28\0009\a\23\a=\a\14\6=\6\23\0055\6\31\0009\a\28\0019\a \a=\a\r\0069\a\28\0009\a \a=\a\14\6=\6 \5=\5\28\0044\5\a\0005\6!\0003\a\"\0=\a#\6>\6\1\0055\6$\0003\a%\0=\a#\6>\6\2\0055\6&\0003\a'\0=\a#\6>\6\3\0055\6(\0003\a)\0=\a#\6>\6\4\0055\6*\0003\a+\0=\a#\6>\6\5\0055\6,\0003\a-\0=\a#\6>\6\6\5=\5.\4B\2\2\1K\0\1\0\20trigger_actions\0\1\0\2\15debug_name\20github_mentions\22trigger_character\6@\0\1\0\2\15debug_name\25github_issues_and_pr\22trigger_character\6#\0\1\0\2\15debug_name\15gitlab_mrs\22trigger_character\6!\0\1\0\2\15debug_name\20gitlab_mentions\22trigger_character\6@\0\1\0\2\15debug_name\18gitlab_issues\22trigger_character\6#\vaction\0\1\0\2\15debug_name\16git_commits\22trigger_character\6:\19merge_requests\1\0\2\nstate\vopened\nlimit\3d\1\0\1\nlimit\3d\1\0\0\vgitlab\1\0\2\nstate\vopened\nlimit\3d\18pull_requests\1\0\2\nstate\topen\nlimit\3d\1\6\0\0\ntitle\vnumber\tbody\14updatedAt\nstate\rmentions\1\0\1\nlimit\3d\1\0\0\vissues\vgithub\vfields\1\0\3\vfilter\ball\nstate\topen\nlimit\3d\1\6\0\0\ntitle\vnumber\tbody\14updatedAt\nstate\1\0\0\vformat\fsort_by\fcommits\bgit\1\0\1\nlimit\3d\fremotes\1\3\0\0\rupstream\vorigin\14filetypes\1\0\1\28enableRemoteUrlRewrites\1\1\3\0\0\14gitcommit\tocto\nsetup\fcmp_git\17cmp_git.sort\19cmp_git.format\frequire\0" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-git",
    url = "https://github.com/petertriho/cmp-git"
  },
  ["cmp-mocword"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-mocword/after/plugin/cmp_mocword.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-mocword",
    url = "https://github.com/yutkat/cmp-mocword"
  },
  ["cmp-nvim-lsp"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/cmp-nvim-lsp",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp"
  },
  ["cmp-nvim-lsp-document-symbol"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol/after/plugin/cmp_nvim_lsp_document_symbol.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-document-symbol",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-document-symbol"
  },
  ["cmp-nvim-lsp-signature-help"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help/after/plugin/cmp_nvim_lsp_signature_help.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lsp-signature-help",
    url = "https://github.com/hrsh7th/cmp-nvim-lsp-signature-help"
  },
  ["cmp-nvim-lua"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua/after/plugin/cmp_nvim_lua.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-lua",
    url = "https://github.com/hrsh7th/cmp-nvim-lua"
  },
  ["cmp-nvim-tags"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags/after/plugin/cmp_nvim_tags.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-nvim-tags",
    url = "https://github.com/quangnguyen30192/cmp-nvim-tags"
  },
  ["cmp-omni"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-omni/after/plugin/cmp_omni.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-omni",
    url = "https://github.com/hrsh7th/cmp-omni"
  },
  ["cmp-path"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-path/after/plugin/cmp_path.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-path",
    url = "https://github.com/hrsh7th/cmp-path"
  },
  ["cmp-rg"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-rg/after/plugin/cmp-rg.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-rg",
    url = "https://github.com/lukas-reineke/cmp-rg"
  },
  ["cmp-spell"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-spell/after/plugin/cmp-spell.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-spell",
    url = "https://github.com/f3fora/cmp-spell"
  },
  ["cmp-treesitter"] = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-treesitter/after/plugin/cmp_treesitter.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp-treesitter",
    url = "https://github.com/ray-x/cmp-treesitter"
  },
  cmp_luasnip = {
    after_files = { "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp_luasnip/after/plugin/cmp_luasnip.lua" },
    load_after = {
      ["nvim-cmp"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/cmp_luasnip",
    url = "https://github.com/saadparwaiz1/cmp_luasnip"
  },
  ["csv.vim"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/csv.vim",
    url = "https://github.com/chrisbra/csv.vim"
  },
  ["debugprint.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\topts\nsetup\15debugprint\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/debugprint.nvim",
    url = "https://github.com/andrewferrier/debugprint.nvim"
  },
  ["emmet-vim"] = {
    config = { "\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6a\20user_emmet_mode\6g\bvim\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/emmet-vim",
    url = "https://github.com/mattn/emmet-vim"
  },
  ["fidget.nvim"] = {
    config = { "\27LJ\2\nK\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fsources\1\0\0\nsetup\vfidget\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/fidget.nvim",
    url = "https://github.com/j-hui/fidget.nvim"
  },
  ["flit.nvim"] = {
    config = { "\27LJ\2\nv\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\2\14multiline\2\18labeled_modes\bnvo\1\0\4\6F\6F\6f\6f\6t\6t\6T\6T\nsetup\tflit\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/flit.nvim",
    url = "https://github.com/ggandor/flit.nvim"
  },
  ["focus.nvim"] = {
    config = { "\27LJ\2\nÅ\1\0\1\5\1\6\0\0196\1\0\0009\1\1\1-\3\0\0006\4\0\0009\4\2\0049\4\3\4B\1\3\2\15\0\1\0X\2\5Ä6\1\0\0009\1\4\1+\2\2\0=\2\5\1X\1\4Ä6\1\0\0009\1\4\1+\2\1\0=\2\5\1K\0\1\0\1¿\18focus_disable\6w\fbuftype\abo\17tbl_contains\bvimÇ\1\0\1\5\1\6\0\0196\1\0\0009\1\1\1-\3\0\0006\4\0\0009\4\2\0049\4\3\4B\1\3\2\15\0\1\0X\2\5Ä6\1\0\0009\1\4\1+\2\2\0=\2\5\1X\1\4Ä6\1\0\0009\1\4\1+\2\1\0=\2\5\1K\0\1\0\0¿\18focus_disable\6b\rfiletype\abo\17tbl_contains\bvimâ\3\1\0\b\0\19\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0005\1\4\0006\2\5\0009\2\6\0029\2\a\2'\4\b\0005\5\t\0B\2\3\0026\3\5\0009\3\6\0039\3\n\3'\5\v\0005\6\f\0=\2\r\0063\a\14\0=\a\15\6B\3\3\0016\3\5\0009\3\6\0039\3\n\3'\5\16\0005\6\17\0=\2\r\0063\a\18\0=\a\15\6B\3\3\0012\0\0ÄK\0\1\0\0\1\0\1\tdesc*Disable focus autoresize for FileType\rFileType\rcallback\0\ngroup\1\0\1\tdesc)Disable focus autoresize for BufType\rWinEnter\24nvim_create_autocmd\1\0\1\nclear\2\17FocusDisable\24nvim_create_augroup\bapi\bvim\1\4\0\0\vnofile\vprompt\npopup\1\2\0\0\rneo-tree\nsetup\nfocus\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/focus.nvim",
    url = "https://github.com/beauwilliams/focus.nvim"
  },
  ["friendly-snippets"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/friendly-snippets",
    url = "https://github.com/rafamadriz/friendly-snippets"
  },
  fzf = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf-lua"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/fzf-lua",
    url = "https://github.com/ibhagwan/fzf-lua"
  },
  ["garbage-day.nvim"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/garbage-day.nvim",
    url = "https://github.com/zeioth/garbage-day.nvim"
  },
  ["git-blame.nvim"] = {
    config = { '\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"gitblame_display_virtual_text\6g\bvim\0' },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/git-blame.nvim",
    url = "https://github.com/f-person/git-blame.nvim"
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\2\n6\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\rgitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim",
    url = "https://github.com/lewis6991/gitsigns.nvim"
  },
  ["hlargs.nvim"] = {
    config = { "\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/hlargs.nvim",
    url = "https://github.com/m-demare/hlargs.nvim"
  },
  ["laravel.nvim"] = {
    commands = { "Sail", "Artisan", "Composer", "Npm", "Yarn", "Laravel" },
    config = { "\27LJ\2\n∫\3\0\0\6\0\20\0%6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\0016\0\0\0'\2\4\0B\0\2\0029\0\5\0'\2\1\0B\0\2\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\t\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\6\0009\0\a\0009\0\b\0'\2\16\0'\3\17\0'\4\18\0005\5\19\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0028<cmd>require('laravel.tinker').send_to_tinker()<cr>\15<leader>lt\6v\1\0\2\fnoremap\2\vsilent\2\28<cmd>Laravel routes<cr>\15<leader>lr\1\0\2\fnoremap\2\vsilent\2\29<cmd>Laravel artisan<cr>\15<leader>la\6n\bset\vkeymap\bvim\19load_extension\14telescope\1\0\1\15lsp_server\17intelephense\nsetup\flaravel\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/laravel.nvim",
    url = "https://github.com/adalessa/laravel.nvim"
  },
  ["leap.nvim"] = {
    config = { "\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/leap.nvim",
    url = "https://github.com/ggandor/leap.nvim"
  },
  ["legendary.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14legendary\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/legendary.nvim",
    url = "https://github.com/mrjones2014/legendary.nvim"
  },
  ["lsp-colors.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/lsp-colors.nvim",
    url = "https://github.com/folke/lsp-colors.nvim"
  },
  ["lsp_lines.nvim"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/lsp_lines.nvim",
    url = "https://git.sr.ht/~whynothugo/lsp_lines.nvim"
  },
  ["lsp_signature.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/lsp_signature.nvim",
    url = "https://github.com/ray-x/lsp_signature.nvim"
  },
  ["lspkind-nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/lspkind-nvim",
    url = "https://github.com/onsails/lspkind-nvim"
  },
  ["lspsaga.nvim"] = {
    config = { "\27LJ\2\nÖ\14\0\0\a\0002\0á\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\2B\0\2\0015\0\r\0006\1\0\0'\3\1\0B\1\2\0029\1\14\1B\1\1\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\21\0'\5\22\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\0015\3\23\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\26\0'\5\27\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\28\0'\4\29\0'\5\30\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\31\0'\5 \0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4!\0'\5\"\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4#\0'\5$\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4%\0'\5&\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4'\0'\5(\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\0015\3)\0'\4*\0'\5+\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4,\0'\5-\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4.\0'\5/\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\0040\0'\0051\0\18\6\0\0B\1\5\1K\0\1\0E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>\n<C-f>F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>\n<C-b>\31<cmd>Lspsaga optutline<cr>\ago!<cmd>Lspsaga term_toggle<cr>\n<A-d>\1\3\0\0\6n\6t*<cmd>Lspsaga diagnostic_jump_prev<cr>\a]e*<cmd>Lspsaga diagnostic_jump_next<cr>\a[e-<cmd>Lspsaga show_cursor_diagnostics<cr>\15<leader>cd+<cmd>Lspsaga show_line_diagnostics<cr>\age\31<cmd>Lspsaga hover_doc<cr>\6K(:<c-u>Lspsaga range_code_action<cr>\6M\6x\28<cmd>Lspsaga rename<cr>\agr!<cmd>Lspsaga code_action<cr>\aga\1\3\0\0\6n\6v <cmd>Lspsaga lsp_finder<cr>\agh%<cmd>Lspsaga peek_definition<cr>\agp\6n\bset\vkeymap\bvim\18init_lsp_saga\1\0\2\vsilent\2\fnoremap\2\24server_filetype_map\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\topen\6o\vvsplit\6s\nsplit\6i\14scroll_up\n<C-b>\16scroll_down\n<C-f>\tquit\6q\23code_action_prompt\1\0\4\17virtual_text\2\venable\2\18sign_priority\3(\tsign\2\1\0\15\ndebug\1\21code_action_icon\tÔ†¥ \17border_style\vsingle\27diagnostic_header_icon\v ÔÜà  \25rename_prompt_prefix\b‚û§\15infor_sign\bÔëâ\14hint_sign\bÔ†µ\29diagnostic_prefix_format\t%d. \14warn_sign\bÔî©\15error_sign\bÔôô\29use_saga_diagnostic_sign\2\28definition_preview_icon\nÔî∏  \22max_preview_lines\3\n\26finder_reference_icon\nÔåë  \27finder_definition_icon\nÔåë  \nsetup\flspsaga\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/lspsaga.nvim",
    url = "https://github.com/tami5/lspsaga.nvim"
  },
  ["lualine.nvim"] = {
    config = { "\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rwinwidth\afn\bvimñ\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\vÄ\21\2\1\0)\3\0\0\1\3\2\0X\2\4Ä\21\2\1\0\21\3\0\0\0\2\3\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3¿\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3¿\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñä\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\bÔååí\3\0\0\4\1\"\0E5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0005\1 \0006\2\29\0009\2\30\0029\2\31\2B\2\1\0028\2\2\0=\2!\1L\1\2\0\1¿\afg\1\0\0\tmode\afn\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=ô\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14Ä9\b\t\a9\b\n\b\15\0\b\0X\t\nÄ6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2Ä9\t\r\aL\t\2\0E\6\3\3R\6\127L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31M\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\25current_session_name\25auto-session-library\frequire\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäò\14\1\0\f\0c\0Ã\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\22\0005\4\n\0005\5\16\0005\6\14\0005\a\f\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\17\0055\6\19\0005\a\18\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\20\5=\5\21\4=\4\23\0035\4\24\0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4!\0033\4\"\0003\5#\0\18\6\4\0005\b'\0003\t$\0>\t\1\b5\t&\0009\n%\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b+\0003\t)\0>\t\1\b3\t*\0=\t(\bB\6\2\1\18\6\4\0005\b,\0009\t\5\2=\t-\bB\6\2\1\18\6\4\0005\b.\0009\t\5\2=\t-\b5\t0\0009\n/\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b1\0B\6\2\1\18\6\4\0005\b2\0005\t3\0009\n\v\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b4\0005\t5\0=\t6\b5\t7\0=\t8\b5\t;\0005\n:\0009\v9\1=\v\v\n=\n<\t5\n>\0009\v=\1=\v\v\n=\n?\t5\nA\0009\v@\1=\v\v\n=\nB\t=\tC\bB\6\2\1\18\6\4\0004\b\3\0003\tD\0>\t\1\bB\6\2\1\18\6\4\0005\bF\0003\tE\0>\t\1\b5\tG\0=\t(\bB\6\2\1\18\6\4\0004\b\3\0003\tH\0>\t\1\bB\6\2\1\18\6\5\0005\bI\0006\tJ\0009\tK\t=\tL\b9\t\a\2=\t-\b5\tN\0009\nM\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bO\0006\tJ\0009\tK\t=\tL\b5\tP\0009\nM\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bQ\0005\tS\0009\nR\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bT\0005\tU\0=\t8\b5\tW\0005\nV\0009\vM\1=\v\v\n=\nX\t5\nZ\0009\vY\1=\v\v\n=\n[\t5\n\\\0009\v9\1=\v\v\n=\n]\t=\t^\b9\t\a\2=\t-\bB\6\2\1\18\6\5\0005\ba\0003\t_\0>\t\1\b5\t`\0009\n%\1=\n\v\t=\t(\bB\6\2\0019\6b\0\18\b\3\0B\6\2\0012\0\0ÄK\0\1\0\nsetup\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\nadded\tÔÉæ \fremoved\tÔÖÜ \rmodified\tÔßâ \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\bÔëø\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\0\1\0\2\bgui\tbold\afg\f#ffffff\1\0\1\ticon\rÔÇÖ LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\tinfo\tÔÅ™ \nerror\tÔÅó \twarn\tÔÅ± \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\0\0\0\ncolor\1\0\0\1\0\0\tblue\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\25component_separators\5\23section_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\fmagenta\f#c678dd\rdarkblue\f#081633\tblue\f#51afef\tcyan\f#008080\bred\f#ec5f67\vyellow\f#ECBE7B\afg\f#bbc2cf\abg\f#202328\vviolet\f#a9a1e1\vorange\f#FF8800\ngreen\f#98be65\flualine\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/lualine.nvim",
    url = "https://github.com/nvim-lualine/lualine.nvim"
  },
  ["markdown-preview.nvim"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/markdown-preview.nvim",
    url = "https://github.com/iamcco/markdown-preview.nvim"
  },
  markid = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/markid",
    url = "https://github.com/David-Kunz/markid"
  },
  ["mason-null-ls.nvim"] = {
    config = { "\27LJ\2\nS\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\rhandlers\1\0\0\nsetup\18mason-null-ls\frequire\0" },
    load_after = {
      ["mason.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/mason-null-ls.nvim",
    url = "https://github.com/jay-babu/mason-null-ls.nvim"
  },
  ["mason.nvim"] = {
    after = { "mason-null-ls.nvim" },
    commands = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
    config = { "\27LJ\2\nF\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\tPATH\vappend\nsetup\nmason\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/mason.nvim",
    url = "https://github.com/williamboman/mason.nvim"
  },
  ["memolist.vim"] = {
    config = { "\27LJ\2\n \1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\30~/.memolist/memotemplates\31memolist_template_dir_path\17memolist_fzf\amd\25memolist_memo_suffix\21~/.memolist/memo\18memolist_path\6g\bvim\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/memolist.vim",
    url = "https://github.com/glidenote/memolist.vim"
  },
  ["modes.nvim"] = {
    config = { "\27LJ\2\np\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\21ignore_filetypes\1\0\0\1\3\0\0\rNvimTree\20TelescopePrompt\nsetup\nmodes\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/modes.nvim",
    url = "https://github.com/mvllow/modes.nvim"
  },
  ["neo-tree.nvim"] = {
    commands = { "Neotree" },
    config = { "\27LJ\2\n§\2\0\0\5\0\f\0\0156\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\t\0005\4\b\0=\4\n\3=\3\v\2B\0\2\1K\0\1\0\vwindow\rmappings\1\0\0\1\0\1\6o\topen$open_files_do_not_replace_types\1\4\0\0\rterminal\ftrouble\aqf\23enable_diagnostics\tture\1\0\4\25sort_case_insenstive\1\22enable_git_status\2\23popup_border_style\frounded\25close_if_last_window\1\nsetup\rneo-tree\frequire\0" },
    load_after = {
      ["nvim-window-picker"] = true
    },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/neo-tree.nvim",
    url = "https://github.com/nvim-neo-tree/neo-tree.nvim"
  },
  neogit = {
    commands = { "Neogit" },
    config = { "\27LJ\2\nô\2\0\0\6\0\r\0\0176\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\3\0005\4\4\0=\4\5\0035\4\a\0005\5\6\0=\5\b\0045\5\t\0=\5\n\4=\4\v\0035\4\f\0=\4\5\3B\1\2\1K\0\1\0\1\0\3\rdiffview\2\ffzf_lua\2\14telescope\2\rsections\vrecent\1\0\1\vfolded\1\fstashes\1\0\0\1\0\1\vfolded\1\17integrations\1\0\1\rdiffview\2\1\0\4\17auto_refresh\2 disable_commit_confirmation\2\22auto_show_console\2\tkind\vvsplit\nsetup\vneogit\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/neogit",
    url = "https://github.com/NeogitOrg/neogit"
  },
  ["nightfox.nvim"] = {
    config = { "\27LJ\2\n¿\2\0\0\b\0\15\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\b\0006\5\3\0009\5\4\0059\5\5\5'\a\6\0B\5\2\2'\6\a\0&\5\6\5=\5\t\4=\4\v\3B\1\2\0016\1\3\0009\1\f\1'\3\r\0B\1\2\0016\1\3\0009\1\f\1'\3\14\0B\1\2\1K\0\1\0\25colorscheme nightfoxCautocmd ColorScheme * lua require('leap').init_highlight(true)\bcmd\foptions\1\0\0\17compile_path\1\0\3\16transparent\1\20terminal_colors\2\17dim_inactive\1\14/nightfox\ncache\fstdpath\afn\bvim\nsetup\rnightfox\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nightfox.nvim",
    url = "https://github.com/EdenEast/nightfox.nvim"
  },
  ["noice.nvim"] = {
    config = { "\27LJ\2\n…\4\0\0\5\0\20\0\0276\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\0\0'\2\3\0B\0\2\0029\0\4\0005\2\b\0005\3\6\0005\4\5\0=\4\a\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0=\3\17\0025\3\18\0=\3\19\2B\0\2\1K\0\1\0\nhover\1\0\2\fenabled\2\tview\nhover\vnotify\1\0\2\fenabled\2\tview\vnotify\fpresets\1\0\5\26long_message_to_split\2\20command_palette\2\18bottom_search\2\19lsp_doc_border\1\15inc_rename\1\rmessages\1\0\6\15view_error\tmini\fenabled\2\tview\vnotify\16view_search\16virtualtext\17view_history\rmessages\14view_warn\tmini\fcmdline\1\0\2\fenabled\2\tview\fcmdline\blsp\1\0\0\roverride\1\0\0\1\0\3 cmp.entry.get_documentation\2\"vim.lsp.util.stylize_markdown\0021vim.lsp.util.convert_input_to_markdown_lines\2\nsetup\nnoice\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/noice.nvim",
    url = "https://github.com/folke/noice.nvim"
  },
  ["none-ls.nvim"] = {
    config = { "\27LJ\2\n£\1\0\2\5\0\5\0\t9\2\0\0009\2\1\2\15\0\2\0X\3\4Ä6\2\2\0009\2\3\2'\4\4\0B\2\2\1K\0\1\0Eautocmd BufWritePost <buffer> lua vim.lsp.buf.format(nil, 10000)\bcmd\bvim\31documentFormattingProvider\24server_capabilities<\0\1\2\0\4\0\0066\1\1\0009\1\2\0019\1\0\0019\1\3\1=\1\0\0K\0\1\0\tWARN\15diagnostic\bvim\rseverity˝\4\1\0\n\0\30\1C6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\b\0049\4\t\0045\6\v\0005\a\n\0=\a\f\6B\4\2\2>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\r\0049\4\t\0045\6\15\0005\a\14\0=\a\f\0063\a\16\0=\a\17\0066\a\0\0'\t\1\0B\a\2\0029\a\18\a9\a\19\a=\a\20\6B\4\2\2>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\21\0049\4\t\0045\6\22\0B\4\2\2>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\23\0049\4\24\0049\4\t\0045\6\26\0005\a\25\0=\a\f\0065\a\27\0=\a\28\6B\4\2\0?\4\0\0=\3\29\2B\0\2\1K\0\1\0\fsources\targs\1\b\0\0\21--no-interaction\f--quiet\bfix\r--config\27.php-cs-fixer.idst.php\21--using-cache=no\14$FILENAME\1\0\0\1\2\0\0\bphp\15phpcsfixer\15formatting\1\0\1\23diagnostics_format\25[eslint] #{m}\n(#{c})\reslint_d\vmethod\24DIAGNOSTICS_ON_SAVE\fmethods\28diagnostics_postprocess\0\1\0\0\1\2\0\0\bphp\fphpstan\14filetypes\1\0\0\1\2\0\0\bphp\twith\bphp\16diagnostics\rbuiltins\14on_attach\1\0\0\0\nsetup\fnull-ls\frequire\tÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/none-ls.nvim",
    url = "https://github.com/nvimtools/none-ls.nvim"
  },
  ["nui.nvim"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nui.nvim",
    url = "https://github.com/MunifTanjim/nui.nvim"
  },
  ["nvim-autopairs"] = {
    after = { "nvim-cmp" },
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\vmap_cr\1\nsetup\19nvim-autopairs\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-autopairs",
    url = "https://github.com/windwp/nvim-autopairs"
  },
  ["nvim-bqf"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rfunc_map\1\0\0\1\0\2\16pscrolldown\n<C-d>\14pscrollup\n<C-u>\nsetup\bbqf\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-bqf",
    url = "https://github.com/kevinhwang91/nvim-bqf"
  },
  ["nvim-cmp"] = {
    after = { "cmp-cmdline", "cmp-cmdline-history", "cmp-dictionary", "cmp-emoji", "cmp-git", "cmp-nvim-lsp-document-symbol", "cmp-nvim-lsp-signature-help", "cmp-nvim-lua", "cmp-nvim-tags", "cmp-omni", "cmp-path", "cmp-treesitter", "cmp_luasnip", "cmp-buffer", "cmp-calc", "cmp-mocword", "cmp-rg", "cmp-spell" },
    config = { "\27LJ\2\nC\0\1\4\0\4\0\a6\1\0\0'\3\1\0B\1\2\0029\1\2\0019\3\3\0B\1\2\1K\0\1\0\tbody\15lsp_expand\fluasnip\frequire[\0\1\3\1\2\0\f-\1\0\0009\1\0\1B\1\1\2\15\0\1\0X\2\4Ä-\1\0\0009\1\1\1B\1\1\1X\1\2Ä\18\1\0\0B\1\1\1K\0\1\0\1¿\19expand_or_jump\23expand_or_jumpable‘\20\1\0\f\0e\0‡\0016\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\4\0+\1\2\0=\1\5\0006\0\0\0009\0\4\0005\1\a\0=\1\6\0006\0\b\0'\2\t\0B\0\2\0026\1\b\0'\3\n\0B\1\2\0029\2\v\0005\4\17\0005\5\15\0006\6\b\0'\b\f\0B\6\2\0029\6\r\0065\b\14\0B\6\2\2=\6\16\5=\5\18\0045\5\20\0003\6\19\0=\6\21\5=\5\22\0049\5\23\0009\5\24\0059\5\25\0055\a\27\0009\b\23\0009\b\26\b)\n¸ˇB\b\2\2=\b\28\a9\b\23\0009\b\26\b)\n\4\0B\b\2\2=\b\29\a9\b\23\0009\b\30\bB\b\1\2=\b\31\a9\b\23\0009\b \bB\b\1\2=\b!\a9\b\23\0009\b\"\b5\n#\0B\b\2\2=\b$\a9\b\23\0003\n%\0005\v&\0B\b\3\2=\b'\aB\5\2\2=\5\23\0049\5(\0009\5)\0054\a\t\0005\b*\0>\b\1\a5\b+\0>\b\2\a5\b,\0>\b\3\a5\b-\0>\b\4\a5\b.\0>\b\5\a5\b/\0>\b\6\a5\b0\0>\b\a\a5\b1\0>\b\b\a4\b\a\0005\t2\0>\t\1\b5\t3\0>\t\2\b5\t4\0>\t\3\b5\t5\0>\t\4\b5\t6\0>\t\5\b5\t7\0>\t\6\bB\5\3\2=\5)\4B\2\2\0019\2\v\0009\0028\0025\0049\0005\5G\0009\6(\0009\6)\0064\b\b\0005\t:\0>\t\1\b5\t;\0>\t\2\b5\t<\0>\t\3\b5\t=\0>\t\4\b5\t>\0>\t\5\b5\t?\0>\t\6\b5\t@\0>\t\a\b4\t\a\0005\nA\0>\n\1\t5\nB\0>\n\2\t5\nC\0>\n\3\t5\nD\0>\n\4\t5\nE\0>\n\5\t5\nF\0>\n\6\tB\6\3\2=\6)\5B\2\3\0019\2\v\0009\0028\0025\4H\0005\5V\0009\6(\0009\6)\0064\b\a\0005\tI\0>\t\1\b5\tJ\0>\t\2\b5\tK\0>\t\3\b5\tL\0>\t\4\b5\tM\0>\t\5\b5\tN\0>\t\6\b4\t\b\0005\nO\0>\n\1\t5\nP\0>\n\2\t5\nQ\0>\n\3\t5\nR\0>\n\4\t5\nS\0>\n\5\t5\nT\0>\n\6\t5\nU\0>\n\a\tB\6\3\2=\6)\5B\2\3\0016\2\b\0'\4W\0B\2\2\0029\2X\0025\4\\\0004\5\3\0006\6\0\0009\6Y\0069\6Z\6'\b(\0B\6\2\2'\a[\0&\6\a\6>\6\1\5=\5]\4B\2\2\0016\2\b\0'\4W\0B\2\2\0029\2X\0025\4`\0004\5\3\0006\6\0\0009\6Y\0069\6Z\6'\b^\0B\6\2\2'\a_\0&\6\a\6>\6\1\5=\5]\4B\2\2\0016\2\b\0'\4W\0B\2\2\0029\2X\0025\4b\0005\5a\0=\5]\4B\2\2\0016\2\b\0'\4c\0B\2\2\0029\2X\0025\4d\0B\2\2\0012\0\0ÄK\0\1\0\1\0\1\npaths\29~/.config/nvim/snipmates\"luasnip.loaders.from_snipmate\1\0\0\1\2\0\0$~/.config/nvim/vscode_snippets/\1\0\0//site/pack/packer/start/friendly-snippets/\tdata\npaths\1\0\0\23/luasnip_snippets/\fstdpath\afn\14lazy_load luasnip.loaders.from_vscode\1\0\0\1\0\3\rpriority\3\n\19keyword_length\3\2\tname\15dictionary\1\0\2\rpriority\3<\tname\fmocword\1\0\2\rpriority\3\30\tname\15treesitter\1\0\2\rpriority\0032\tname\tcalc\1\0\2\rpriority\3(\tname\nspell\1\0\2\rpriority\3(\tname\tomni\1\0\2\rpriority\0032\tname\vbuffer\1\0\2\rpriority\3d\tname\tpath\1\0\2\rpriority\3F\tname\arg\1\0\2\rpriority\3d\tname\fluasnip\1\0\2\rpriority\3d\tname\fcmp_git\1\0\2\rpriority\3d\tname\rnvim_lsp\1\0\2\rpriority\3d\tname\26vim-dadbod-completion\1\4\0\0\bsql\nmysql\tpsql\1\0\0\1\0\3\rpriority\3\n\19keyword_length\3\2\tname\15dictionary\1\0\2\rpriority\3<\tname\fmocword\1\0\2\rpriority\0032\tname\tcalc\1\0\2\rpriority\3(\tname\nspell\1\0\2\rpriority\3(\tname\tomni\1\0\2\rpriority\0032\tname\vbuffer\1\0\2\rpriority\3\30\tname\15treesitter\1\0\3\vinsert\2\rpriority\3<\tname\nemoji\1\0\2\rpriority\3d\tname\tpath\1\0\2\rpriority\3F\tname\arg\1\0\2\rpriority\3d\tname\fluasnip\1\0\2\rpriority\3d\tname\fcmp_git\1\0\2\rpriority\3d\tname\rnvim_lsp\1\3\0\0\14gitcommit\rmarkdown\rfiletype\1\0\3\rpriority\3\n\19keyword_length\3\2\tname\15dictionary\1\0\2\rpriority\3\30\tname\15treesitter\1\0\2\rpriority\0032\tname\tcalc\1\0\2\rpriority\3(\tname\nspell\1\0\2\rpriority\3(\tname\tomni\1\0\2\rpriority\0032\tname\vbuffer\1\0\2\rpriority\3F\tname\ttags\1\0\2\rpriority\3F\tname\arg\1\0\2\rpriority\3P\tname\28nvim_lsp_signature_help\1\0\2\rpriority\0032\tname\rnvim_lua\1\0\3\vinsert\2\rpriority\3<\tname\nemoji\1\0\2\rpriority\3d\tname\tpath\1\0\2\rpriority\3d\tname\fluasnip\1\0\2\rpriority\3d\tname\rnvim_lsp\fsources\vconfig\n<C-K>\1\3\0\0\6i\6s\0\t<CR>\1\0\1\vselect\2\fconfirm\n<C-e>\nabort\14<C-Space>\rcomplete\n<C-f>\n<C-b>\1\0\0\16scroll_docs\vinsert\vpreset\fmapping\fsnippet\vexpand\1\0\0\0\15formatting\1\0\0\vformat\1\0\0\1\0\1\tmode\vsymbol\15cmp_format\flspkind\nsetup\fluasnip\bcmp\frequire\1\3\0\0\nen_us\bcjk\14spelllang\nspell\bopt\26menu,menuone,noselect\16completeopt\6g\bvim\0" },
    load_after = {
      LuaSnip = true,
      ["nvim-autopairs"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-cmp",
    url = "https://github.com/hrsh7th/nvim-cmp"
  },
  ["nvim-colorizer.lua"] = {
    config = { "\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\2B\0\2\1K\0\1\0\thtml\1\0\1\tmode\15foreground\1\3\0\0\bcss\15javascript\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua",
    url = "https://github.com/norcalli/nvim-colorizer.lua"
  },
  ["nvim-hlslens"] = {
    after = { "nvim-scrollbar" },
    config = { "\27LJ\2\nÿ\5\0\0\a\0\18\0W6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0006\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\a\0'\5\b\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\t\0'\5\n\0\18\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\v\0'\5\f\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\r\0'\5\14\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\15\0'\4\v\0'\5\f\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\15\0'\4\r\0'\5\14\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\16\0'\5\14\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\15\0'\4\16\0'\5\14\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\a\0'\4\17\0'\5\14\0004\6\0\0B\1\5\0016\1\4\0009\1\5\0019\1\6\1'\3\15\0'\4\17\0'\5\14\0004\6\0\0B\1\5\1K\0\1\0\bgz*\az*\6x@<Plug>(asterisk-gz*)<Cmd>lua require('hlslens').start()<CR>\ag*?<Plug>(asterisk-z*)<Cmd>lua require('hlslens').start()<CR>\6*Y<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>\6NY<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>\6n\20nvim_set_keymap\bapi\bvim\1\0\2\fnoremap\2\vsilent\2\nsetup\fhlslens\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-hlslens",
    url = "https://github.com/kevinhwang91/nvim-hlslens"
  },
  ["nvim-lightbulb"] = {
    config = { "\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-lightbulb",
    url = "https://github.com/kosayoda/nvim-lightbulb"
  },
  ["nvim-lsp-smag"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-lsp-smag",
    url = "https://github.com/weilbith/nvim-lsp-smag"
  },
  ["nvim-lspconfig"] = {
    after = { "nvim-lsp-smag" },
    config = { "\27LJ\2\n±\5\0\2\t\0\29\0k6\2\0\0009\2\1\0029\2\2\0025\4\3\0B\2\2\0015\2\4\0=\1\5\0026\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0006\a\0\0009\a\n\a9\a\v\a9\a\f\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0006\a\0\0009\a\n\a9\a\v\a9\a\14\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0006\a\0\0009\a\n\a9\a\v\a9\a\16\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0006\a\0\0009\a\n\a9\a\v\a9\a\18\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\19\0006\a\0\0009\a\n\a9\a\v\a9\a\20\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\21\0006\a\0\0009\a\n\a9\a\v\a9\a\22\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\23\0006\a\0\0009\a\n\a9\a\v\a9\a\24\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\25\0006\a\0\0009\a\n\a9\a\v\a9\a\26\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\27\0006\a\0\0009\a\n\a9\a\v\a9\a\28\a\18\b\2\0B\3\5\1K\0\1\0\vformat\15<leader>gF\15references\agr\16code_action\15<leader>ca\vrename\15<leader>rn\20type_definition\14<leader>D\19signature_help\n<C-k>\19implementation\agi\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\2\vsilent\2\fnoremap\2\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvimC\0\2\6\1\1\0\t-\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1¿\26enable_format_on_saveﬁ\19\1\0\14\0i\0◊\0015\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\1\0009\5\6\0059\5\a\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0006\5\1\0009\5\6\0059\5\t\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0006\5\1\0009\5\6\0059\5\v\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\1\0009\5\6\0059\5\r\5\18\6\0\0B\1\5\0013\1\14\0006\2\1\0009\2\15\0029\2\16\0029\2\17\2B\2\1\0029\3\18\0025\4\20\0=\4\19\0039\3\18\0029\3\21\0039\3\22\3+\4\2\0=\4\23\0039\3\18\0029\3\21\0039\3\22\0035\4\26\0005\5\25\0=\5\27\4=\4\24\0036\3\28\0'\5\29\0B\3\2\0029\4\30\0039\4\31\0045\6 \0=\2!\0063\a\"\0=\a#\0065\a3\0005\b%\0005\t$\0=\t&\b5\t(\0005\n'\0=\n)\t=\t*\b5\t.\0006\n\1\0009\n+\n9\n,\n'\f-\0+\r\2\0B\n\3\2=\n/\t=\t0\b5\t1\0=\t2\b=\b4\a=\a5\6B\4\2\0019\0046\0039\4\31\0045\0067\0=\2!\6=\1#\0065\aB\0005\b9\0005\t8\0=\t:\b5\t;\0=\t*\b5\t=\0005\n<\0=\n>\t=\t?\b5\t@\0=\tA\b=\b6\a=\a5\6B\4\2\0019\4C\0039\4\31\0045\6D\0=\1#\6=\2!\0065\aE\0=\aF\6B\4\2\0019\4G\0039\4\31\0045\6H\0=\1#\6=\2!\6B\4\2\0019\4I\0039\4\31\0045\6K\0005\aJ\0=\aL\6=\1#\6=\2!\6B\4\2\0019\4M\0039\4\31\0045\6N\0=\1#\6=\2!\6B\4\2\0019\4O\0039\4\31\0045\6P\0=\1#\6=\2!\0065\aQ\0=\aF\0065\aR\0=\aS\6B\4\2\0019\4T\0039\4\31\0045\6U\0=\1#\6=\2!\6B\4\2\0019\4V\0039\4\31\0045\6W\0=\1#\6=\2!\6B\4\2\0019\4X\0039\4\31\0045\6Y\0=\1#\6=\2!\0065\aZ\0=\a[\6B\4\2\0019\4\\\0039\4\31\0045\6]\0=\1#\6=\2!\6B\4\2\0019\4^\0039\4\31\0045\6_\0=\1#\6=\2!\6B\4\2\0019\4`\0039\4\31\0045\6a\0=\1#\6=\2!\6B\4\2\0019\4b\0039\4\31\0045\6c\0=\1#\6=\2!\6B\4\2\0019\4d\0039\4\31\0045\6e\0=\1#\6=\2!\6B\4\2\0019\4f\0039\4\31\0045\6g\0=\1#\6=\2!\6B\4\2\0019\4X\0039\4\31\0045\6h\0=\1#\6=\2!\6B\4\2\0012\0\0ÄK\0\1\0\1\0\0\1\0\0\18rust_analyzer\1\0\0\frubocop\1\0\0\15solargraph\1\0\0\veslint\1\0\0\thtml\1\0\0\ncssls\nflags\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\16tailwindcss\1\0\0\vjsonls\1\0\0\rmarksman\bcmd\1\3\0\0\31typescript-language-server\f--stdio\1\4\0\0\15typescript\20typescriptreact\19typescript.tsx\1\0\0\rtsserver\1\0\0\nsqlls\15typescript\1\0\0\1\0\1\ttsdka/home/skjkw/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib\nvolar\1\0\0\25jedi_language_server\14filetypes\1\n\0\0\thtml\20typescriptreact\20javascriptreact\bcss\tsass\tscss\tless\tvime\nblade\1\0\0\remmet_ls\1\0\0\nfiles\1\0\1\fmaxSize\3¿ñ±\2\16environment\17includePaths\1\0\0\1\2\0\0003/home/skjkw/.config/composer/vendor/php-stubs/\1\0\1\venable\2\nstubs\1\0\0\1@\0\0\vbcmath\bbz2\rcalendar\tCore\tcurl\tdate\bdba\bdom\fenchant\rfileinfo\vfilter\bftp\agd\fgettext\thash\niconv\timap\tintl\tjson\tldap\vlibxml\rmbstring\vmcrypt\nmysql\vmysqli\rpassword\npcntl\tpcre\bPDO\14pdo_mysql\tPhar\rreadline\vrecode\15Reflection\nregex\fsession\14SimpleXML\tsoap\fsockets\vsodium\bSPL\rstandard\17superglobals\fsysvsem\fsysvshm\14tokenizer\bxml\vxdebug\14xmlreader\14xmlwriter\tyaml\bzip\tzlib\14wordpress\16woocommerce\facf-pro\14acf-stubs\20wordpress-stubs\22wordpress-globals\17wp-cli-stubs\fgenesis\rpolylang\bsbi\1\0\0\17intelephense\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\14on_attach\0\17capabilities\1\0\0\nsetup\vlua_ls\14lspconfig\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupoort\19snippetSupport\19completionItem\15completion\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\0\15setloclist\15<leader>lq\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\15<leader>le\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0" },
    loaded = true,
    only_config = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-lspconfig",
    url = "https://github.com/neovim/nvim-lspconfig"
  },
  ["nvim-lspupdate"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-lspupdate",
    url = "https://github.com/alexaandru/nvim-lspupdate"
  },
  ["nvim-neoclip.lua"] = {
    config = { "\27LJ\2\n˙\4\0\0\a\0\29\0-6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0006\3\4\0009\3\5\0039\3\6\3'\5\a\0B\3\2\2'\4\b\0&\3\4\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\20\0005\4\16\0005\5\14\0004\6\0\0=\6\15\5=\5\17\0045\5\18\0004\6\0\0=\6\15\5=\5\19\4=\4\21\3=\3\22\2B\0\2\0016\0\0\0'\2\21\0B\0\2\0029\0\23\0'\2\1\0B\0\2\0016\0\4\0009\0\24\0009\0\25\0'\2\19\0'\3\26\0'\4\27\0005\5\28\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\31<Cmd>Telescope neoclip<CR>\15<leader>gp\20nvim_set_keymap\bapi\19load_extension\tkeys\14telescope\1\0\0\6n\1\0\4\vselect\t<cr>\vreplay\n<c-q>\17paste_behind\amP\npaste\amp\6i\1\0\0\vcustom\1\0\4\vselect\t<cr>\vreplay\n<c-q>\17paste_behind\n<c-k>\npaste\n<c-p>\14on_replay\1\0\1\fset_reg\1\ron_paste\1\0\1\fset_reg\1\fdb_path\31/databases/neoclip.sqlite3\tdata\fstdpath\afn\bvim\1\0\5\24content_spec_column\1\21default_register\6\"\30enable_persistent_history\2\fpreview\2\fhistory\3êN\nsetup\fneoclip\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-neoclip.lua",
    url = "https://github.com/AckslD/nvim-neoclip.lua"
  },
  ["nvim-notify"] = {
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-notify",
    url = "https://github.com/rcarriga/nvim-notify"
  },
  ["nvim-numbertoggle"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-numbertoggle",
    url = "https://github.com/sitiom/nvim-numbertoggle"
  },
  ["nvim-scrollbar"] = {
    config = { "\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14scrollbar\frequire\0" },
    load_after = {
      ["nvim-hlslens"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-scrollbar",
    url = "https://github.com/petertriho/nvim-scrollbar"
  },
  ["nvim-spectre"] = {
    config = { "\27LJ\2\nâ\4\0\0\6\0\19\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0026viw:lua require('spectre').open_file_search()<CR>\15<leader>sp\1\0\2\fnoremap\2\vsilent\0023<esc>:lua require('spectre').open_visual()<CR>\14<leader>s\1\0\2\fnoremap\2\vsilent\2@<cmd>lua require('spectre').open_visual({select_word=true})\15<leader>sw\1\0\2\fnoremap\2\vsilent\2'<cmd>lua require('spectre').open()\14<leader>S\6n\20nvim_set_keymap\bapi\bvim\nsetup\fspectre\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-spectre",
    url = "https://github.com/windwp/nvim-spectre"
  },
  ["nvim-surround"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-surround",
    url = "https://github.com/kylechui/nvim-surround"
  },
  ["nvim-tree-docs"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-tree-docs",
    url = "https://github.com/nvim-treesitter/nvim-tree-docs"
  },
  ["nvim-treesitter"] = {
    after = { "hlargs.nvim", "treesitter-unit", "nvim-ts-context-commentstring", "rainbow-delimiters.nvim", "nvim-tree-docs", "nvim-ts-autotag", "nvim-treesitter-refactor", "nvim_context_vt" },
    config = { "\27LJ\2\nê\5\0\0\5\0 \0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\6\0035\4\f\0=\4\r\3=\3\14\0025\3\15\0005\4\16\0=\4\6\3=\3\17\0025\3\18\0004\4\0\0=\4\6\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\6\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\14tree_docs\1\0\1\venable\2\vmarkid\1\0\1\venable\2\tyati\1\0\1\venable\2\fmatchup\1\0\1\venable\1\npairs\fkeymaps\1\0\1\17goto_partner\a'%\26highlight_pair_events\1\2\0\0\16CursorMoved\1\0\4\venable\1\24fallback_cmd_normal)call matchit#Match_wrapper('',1,'n')\19goto_right_end\1\19highlight_self\2\frainbow\1\2\0\0\bcpp\1\0\2\venable\2\18extended_mode\2\14highlight&additional_vim_regex_highlighting\1\2\0\0\borg\1\0\0\1\2\0\0\thelp\19ignore_install\1\2\0\0\6d\vindent\fdisable\1\2\0\0\vpython\1\0\1\venable\1\1\0\2\17auto_install\2\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    only_config = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["nvim-treesitter-context"] = {
    commands = { "TSContextEnable" },
    config = { "\27LJ\2\nH\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\18go_to_context\23treesitter-context\frequireÄ\1\1\0\6\0\n\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0003\4\b\0005\5\t\0B\0\5\1K\0\1\0\1\0\1\vsilent\2\0\a[c\6n\bset\vkeymap\bvim\nsetup\23treesitter-context\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-context",
    url = "https://github.com/romgrk/nvim-treesitter-context"
  },
  ["nvim-treesitter-refactor"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-treesitter-refactor",
    url = "https://github.com/nvim-treesitter/nvim-treesitter-refactor"
  },
  ["nvim-ts-autotag"] = {
    config = { "\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-ts-autotag",
    url = "https://github.com/windwp/nvim-ts-autotag"
  },
  ["nvim-ts-context-commentstring"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-ts-context-commentstring",
    url = "https://github.com/JoosepAlviste/nvim-ts-context-commentstring"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-web-devicons",
    url = "https://github.com/nvim-tree/nvim-web-devicons"
  },
  ["nvim-window-picker"] = {
    after = { "neo-tree.nvim" },
    config = { "\27LJ\2\n\30\0\2\5\0\1\0\5'\2\0\0\18\3\0\0'\4\0\0&\2\4\2L\2\2\0\a%=n\0\0\5\0\6\0\n6\0\0\0009\0\1\0009\0\2\0006\2\3\0'\4\4\0B\2\2\0029\2\5\2B\2\1\0A\0\0\1K\0\1\0\16pick_window\18window-picker\frequire\25nvim_set_current_win\bapi\bvim∞\5\1\0\6\0$\0+6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\a\0005\4\5\0003\5\4\0=\5\6\4=\4\b\3=\3\t\0025\3\n\0005\4\f\0005\5\v\0=\5\r\0045\5\14\0=\5\15\4=\4\16\0034\4\0\0=\4\17\0034\4\0\0=\4\18\0034\4\0\0=\4\19\3=\3\20\0025\3\26\0005\4\22\0005\5\21\0=\5\23\0045\5\24\0=\5\25\4=\4\27\3=\3\28\2B\0\2\0016\0\29\0009\0\30\0009\0\31\0'\2 \0'\3!\0003\4\"\0005\5#\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\0\14<Leader>-\6n\bset\vkeymap\bvim\15highlights\15statusline\1\0\0\14unfocused\1\0\3\tbold\2\abg\f#44cc41\afg\f#ededed\ffocused\1\0\0\1\0\3\tbold\2\abg\f#e35e4f\afg\f#ededed\17filter_rules\23file_name_contains\23file_path_contains\awo\abo\fbuftype\1\3\0\0\rterminal\rquickfix\rfiletype\1\0\0\1\5\0\0\rNvimTree\19neo-tree-popup\rneo-tree\vnotify\1\0\2\24include_current_win\1\19autoselect_one\2\18picker_config\29statusline_winbar_picker\1\0\0\22selection_display\1\0\1\15use_winbar\nnever\0\1\0\2\thint\22statusline-winbar\20selection_chars\23FJDKSLA;CMRUEIWOQP\nsetup\18window-picker\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim-window-picker",
    url = "https://github.com/s1n7ax/nvim-window-picker"
  },
  ["nvim-yati"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/nvim-yati",
    url = "https://github.com/yioneko/nvim-yati"
  },
  nvim_context_vt = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/nvim_context_vt",
    url = "https://github.com/haringsrob/nvim_context_vt"
  },
  orgmode = {
    config = { "\27LJ\2\n∞\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\22~/work/refile.org\1\2\0\0\r~/work/*\nsetup\21setup_ts_grammar\forgmode\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/orgmode",
    url = "https://github.com/nvim-orgmode/orgmode"
  },
  ["pantran.nvim"] = {
    config = { "\27LJ\2\nÚ\3\0\0\n\0\29\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\0025\3\18\0005\4\16\0005\5\t\0005\6\b\0=\6\n\0055\6\v\0006\a\0\0'\t\f\0B\a\2\0029\a\r\a=\a\14\6=\6\15\5=\5\17\4=\4\19\3=\3\20\2B\0\2\0015\0\21\0006\1\22\0009\1\23\0019\1\24\1'\3\n\0'\4\25\0006\5\0\0'\a\1\0B\5\2\0029\5\26\5\18\6\0\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\27\0'\4\28\0006\5\0\0'\a\1\0B\5\2\0029\5\26\5\18\6\0\0B\1\5\1K\0\1\0\15<leader>tr\6x\21motion_translate\15<leader>te\bset\vkeymap\bvim\1\0\3\vsilent\2\fnoremap\2\texpr\2\rcontrols\rmappings\1\0\0\tedit\1\0\0\6i\n<C-a>\27yank_close_translation\23pantran.ui.actions\1\0\1\n<C-y>\1\6n\1\0\0\1\0\2\6j\agj\6k\agk\fengines\vyandex\1\0\0\1\0\2\19default_source\tauto\19default_target\aen\1\0\1\19default_engine\vgoogle\nsetup\fpantran\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/pantran.nvim",
    url = "https://github.com/potamides/pantran.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/plenary.nvim",
    url = "https://github.com/nvim-lua/plenary.nvim"
  },
  ["prettier.nvim"] = {
    config = { "\27LJ\2\n§\4\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16cli_options\1\0\17\tsemi\2\16quote_props\14as-needed\15prose_wrap\rpreserve\16print_width\3P\21jsx_single_quote\1 html_whitespace_sensitivity\bcss\16end_of_line\alf!embedded_language_formatting\tauto\22bracket_same_line\1\20bracket_spacing\2\17arrow_parens\valways vue_indent_script_and_style\1\ruse_tabs\1\19trailing_comma\bes5\14tab_width\3\2\17single_quote\1\30single_attribute_per_line\1\14filetypes\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\1\0\1\bbin\14prettierd\nsetup\rprettier\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["rainbow-delimiters.nvim"] = {
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/rainbow-delimiters.nvim",
    url = "https://github.com/hiphish/rainbow-delimiters.nvim"
  },
  ["sidebar.nvim"] = {
    commands = { "SidebarNvimToggle" },
    config = { "\27LJ\2\n:\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nclose\17sidebar-nvim\frequireÍ\3\1\0\6\0\24\0\0296\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0003\4\4\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\0025\3\14\0=\3\15\0025\3\16\0004\4\3\0005\5\17\0>\5\1\4=\4\18\3=\3\19\0025\3\21\0005\4\20\0=\4\22\3=\3\23\2B\0\2\1K\0\1\0\ntodos\18ignored_paths\1\0\0\1\2\0\0\6~\rdatetime\vclocks\1\0\1\tname\nlocal\1\0\1\vformat\20%a %b %d, %H:%M\15containers\1\0\3\rinterval\3à'\rshow_all\2\17attach_shell\r/bin/zsh\28section_title_separator\1\2\0\0\5\22section_separator\1\4\0\0\5\n-----\5\rsections\1\4\0\0\rdatetime\bgit\16diagnostics\rbindings\6q\1\0\0\0\1\0\5\tside\nright\20update_interval\3Ë\a\18initial_width\3#\topen\1 disable_default_keybindings\3\0\nsetup\17sidebar-nvim\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/sidebar.nvim",
    url = "https://github.com/sidebar-nvim/sidebar.nvim"
  },
  ["snippet-converter.nvim"] = {
    config = { "\27LJ\2\n¨\3\0\0\6\0\21\0-5\0\t\0005\1\5\0004\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\3\0B\3\2\2'\4\4\0&\3\4\3>\3\1\2=\2\6\0014\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\3\0B\3\2\2'\4\a\0&\3\4\3>\3\1\2=\2\b\1=\1\n\0005\1\r\0004\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3>\3\1\2=\2\14\1=\1\15\0006\1\16\0'\3\17\0B\1\2\0029\1\18\0015\3\19\0004\4\3\0>\0\1\4=\4\20\3B\1\2\1K\0\1\0\14templates\1\0\0\nsetup\22snippet_converter\frequire\voutput\19vscode_luasnip\1\0\0\22/luasnip_snippets\vconfig\fsources\1\0\0\rsnipmate2/site/pack/packer/start/vim-snippets/snippets\14ultisnips\1\0\0003/site/pack/packer/start/vim-snippets/UltiSnips\tdata\fstdpath\afn\bvim\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/snippet-converter.nvim",
    url = "https://github.com/smjonas/snippet-converter.nvim"
  },
  ["sqlite.lua"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/sqlite.lua",
    url = "https://github.com/tami5/sqlite.lua"
  },
  ["surround-ui.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\1\rroot_key\6S\nsetup\16surround-ui\frequire\0" },
    load_after = {
      ["which-key.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/surround-ui.nvim",
    url = "https://github.com/roobert/surround-ui.nvim"
  },
  ["swagger-preview.nvim"] = {
    config = { "\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\thost\14localhost\tport\3ê?\nsetup\20swagger-preview\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/swagger-preview.nvim",
    url = "https://github.com/vinnymeller/swagger-preview.nvim"
  },
  ["telescope-changes.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fchanges\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-changes.nvim",
    url = "https://github.com/LinArcX/telescope-changes.nvim"
  },
  ["telescope-file-browser.nvim"] = {
    config = { "\27LJ\2\nQ\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\17file_browser\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-file-browser.nvim",
    url = "https://github.com/nvim-telescope/telescope-file-browser.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-frecency.nvim",
    url = "https://github.com/nvim-telescope/telescope-frecency.nvim"
  },
  ["telescope-github.nvim"] = {
    config = { "\27LJ\2\nG\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\agh\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-github.nvim",
    url = "https://github.com/nvim-telescope/telescope-github.nvim"
  },
  ["telescope-heading.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fheading\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-heading.nvim",
    url = "https://github.com/crispgm/telescope-heading.nvim"
  },
  ["telescope-live-grep-args.nvim"] = {
    config = { "\27LJ\2\nS\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\19live_grep_args\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-live-grep-args.nvim",
    url = "https://github.com/nvim-telescope/telescope-live-grep-args.nvim"
  },
  ["telescope-luasnip.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fluasnip\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-luasnip.nvim",
    url = "https://github.com/benfowler/telescope-luasnip.nvim"
  },
  ["telescope-memo.nvim"] = {
    config = { "\27LJ\2\nô\2\0\0\6\0\14\0\0236\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\b\0'\4\t\0005\5\n\0B\0\5\0016\0\4\0009\0\5\0009\0\6\0'\2\a\0'\3\v\0'\4\f\0005\5\r\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2&<cmd>Telescope memo live_grep<cr>\16<leader>fmg\1\0\2\fnoremap\2\vsilent\2!<cmd>Telescope memo list<cr>\16<leader>fml\6n\bset\vkeymap\bvim\tmemo\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-memo.nvim",
    url = "https://github.com/delphinus/telescope-memo.nvim"
  },
  ["telescope-packer.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vpacker\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-packer.nvim",
    url = "https://github.com/nvim-telescope/telescope-packer.nvim"
  },
  ["telescope-project.nvim"] = {
    config = { "\27LJ\2\nL\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\fproject\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-project.nvim",
    url = "https://github.com/nvim-telescope/telescope-project.nvim"
  },
  ["telescope-repo.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-repo.nvim",
    url = "https://github.com/cljoly/telescope-repo.nvim"
  },
  ["telescope-smart-history.nvim"] = {
    config = { "\27LJ\2\nR\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\18smart_history\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-smart-history.nvim",
    url = "https://github.com/nvim-telescope/telescope-smart-history.nvim"
  },
  ["telescope-symbols.nvim"] = {
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-symbols.nvim",
    url = "https://github.com/nvim-telescope/telescope-symbols.nvim"
  },
  ["telescope-ui-select.nvim"] = {
    config = { "\27LJ\2\nN\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\14ui-select\19load_extension\14telescope\frequire\0" },
    load_after = {
      ["telescope.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope-ui-select.nvim",
    url = "https://github.com/nvim-telescope/telescope-ui-select.nvim"
  },
  ["telescope.nvim"] = {
    after = { "telescope-frecency.nvim", "telescope-github.nvim", "telescope-heading.nvim", "telescope-live-grep-args.nvim", "telescope-luasnip.nvim", "telescope-memo.nvim", "telescope-packer.nvim", "telescope-project.nvim", "telescope-repo.nvim", "telescope-smart-history.nvim", "telescope-symbols.nvim", "noice.nvim", "browse.nvim", "nvim-neoclip.lua", "telescope-changes.nvim", "telescope-file-browser.nvim", "telescope-ui-select.nvim" },
    commands = { "Telescope" },
    config = { "\27LJ\2\n˜\1\0\1\t\0\14\0\0266\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\0026\2\3\0009\2\4\0029\2\5\0029\4\6\1'\5\a\0B\2\3\0026\3\0\0'\5\b\0B\3\2\0029\3\t\3\18\5\0\0B\3\2\0016\3\3\0009\3\n\0036\5\v\0009\5\f\5'\a\r\0\18\b\2\0B\5\3\0A\3\0\1K\0\1\0\18silent lcd %s\vformat\vstring\bcmd\nclose\22telescope.actions\t:p:h\tpath\16fnamemodify\afn\bvim\23get_selected_entry\28telescope.actions.state\frequire˜\1\0\1\t\0\14\0\0266\1\0\0'\3\1\0B\1\2\0029\1\2\1B\1\1\0026\2\3\0009\2\4\0029\2\5\0029\4\6\1'\5\a\0B\2\3\0026\3\0\0'\5\b\0B\3\2\0029\3\t\3\18\5\0\0B\3\2\0016\3\3\0009\3\n\0036\5\v\0009\5\f\5'\a\r\0\18\b\2\0B\5\3\0A\3\0\1K\0\1\0\18silent lcd %s\vformat\vstring\bcmd\nclose\22telescope.actions\t:p:h\tpath\16fnamemodify\afn\bvim\23get_selected_entry\28telescope.actions.state\frequire‚\6\1\0\b\0/\0A6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\4\0005\4\3\0=\4\5\3=\3\a\0025\3\f\0005\4\n\0006\5\0\0'\a\b\0B\5\2\0029\5\t\5=\5\v\4=\4\r\0035\4\14\0006\5\0\0'\a\b\0B\5\2\0029\5\t\5=\5\v\4=\4\15\3=\3\16\0025\3\24\0005\4\18\0005\5\17\0=\5\19\0045\5\23\0005\6\21\0003\a\20\0=\a\22\6=\6\r\5=\5\16\4=\4\25\0035\4\27\0005\5\26\0=\5\19\4=\4\28\3=\3\29\0025\3!\0005\4\31\0004\5\3\0005\6\30\0>\6\1\5=\5 \4=\4\"\0035\4#\0005\5$\0=\5%\0045\5(\0005\6'\0003\a&\0=\a\22\6=\6\r\5=\5\16\4=\4)\0035\4*\0=\4+\0035\4,\0=\4-\3=\3.\2B\0\2\1K\0\1\0\15extensions\15workspaces\1\0\1\16keep_insert\2\19live_grep_args\1\0\1\17auto_quoting\2\rfrecency\1\0\0\1\0\0\0\20ignore_patterns\1\3\0\0\f*.git/*\f*/tmp/*\1\0\2\19show_unindexed\2\16show_scores\2\fproject\1\0\0\14base_dirs\1\0\4\24sync_with_nvim_tree\2\rorder_by\tdesc\ntheme\rdropdown\17hidden_files\2\1\0\2\tpath\16/mnt/e/work\14max_depth\3\5\fpickers\14live_grep\1\0\0\1\a\0\0\arg\a-i\f--files\r--hidden\v--glob\f!.git/*\15find_files\1\0\0\1\0\0\acd\1\0\0\0\17find_command\1\0\0\1\a\0\0\arg\a-i\f--files\r--hidden\v--glob\f!.git/*\rmappings\6i\1\0\0\6n\1\0\0\n<c-d>\1\0\0\18delete_buffer\22telescope.actions\rdefaults\1\0\0\fhistory\1\0\0\1\0\2\tpath<~/.local/share/nvim/databases/telescope_history.sqlite3\nlimit\3Ë\a\nsetup\14telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/telescope.nvim",
    url = "https://github.com/nvim-telescope/telescope.nvim"
  },
  ["todo-comments.nvim"] = {
    config = { "\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/todo-comments.nvim",
    url = "https://github.com/folke/todo-comments.nvim"
  },
  ["toggleterm.nvim"] = {
    after = { "toolwindow.nvim" },
    config = { "\27LJ\2\n©\1\0\1\4\0\t\2\0219\1\0\0\a\1\1\0X\1\tÄ6\1\2\0009\1\3\0019\1\4\0016\3\2\0009\3\5\0039\3\6\3\24\3\0\3D\1\2\0X\1\bÄ9\1\0\0\a\1\a\0X\1\5Ä6\1\2\0009\1\5\0019\1\b\1\24\1\1\1L\1\2\0K\0\1\0\fcolumns\rvertical\nlines\6o\rfloat2nr\afn\bvim\15horizontal\14direction\1ÄÄ¿˛\3µÊÃô\19ô≥Ê˛\3\20\0\1\2\0\1\0\0029\1\0\0L\1\2\0\tname/\0\0\3\0\3\0\0056\0\0\0009\0\1\0'\2\2\0B\0\2\1K\0\1\0\16startinsert\bcmd\bvimx\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\3\vsilent\2\fnoremap\2\vbuffer\2\30<Cmd>exe 'ToggleTerm'<CR>\n<Esc>\6n\bset\vkeymap\bvim~\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\3\vsilent\2\fnoremap\2\vbuffer\2$<C-\\><C-n>:exe 'ToggleTerm'<CR>\n<C-z>\6t\bset\vkeymap\bvimÏ\2\0\0\t\0\b\1J6\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\0016\3\0\0009\3\1\0039\3\2\3\18\5\0\0B\3\2\0A\1\0\2\b\1\0\0X\1\1ÄL\0\2\0006\1\0\0009\1\5\1'\3\6\0B\1\2\0016\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\4\0026\4\0\0009\4\1\0049\4\2\4\18\6\0\0\18\a\1\0&\6\a\6B\4\2\0A\2\0\2\b\2\0\0X\2\4Ä\18\2\0\0\18\3\1\0&\2\3\2L\2\2\0006\2\0\0009\2\5\2'\4\a\0B\2\2\0016\2\0\0009\2\1\0029\2\2\2'\4\3\0B\2\2\0026\3\0\0009\3\1\0039\3\4\0036\5\0\0009\5\1\0059\5\2\5\18\a\2\0\18\b\0\0&\a\b\aB\5\2\0A\3\0\2\b\3\0\0X\3\4Ä\18\3\2\0\18\4\0\0&\3\4\3L\3\2\0006\3\0\0009\3\5\3'\5\6\0B\3\2\1L\0\2\0\15normal! 2k\14normal! j\bcmd\17filereadable\f<cfile>\vexpand\afn\bvim\0˜\2\0\2\n\0\15\1E6\2\0\0009\2\1\0029\2\2\2\18\4\0\0B\2\2\0026\3\0\0009\3\1\0039\3\3\3\18\5\1\0\18\6\0\0'\a\4\0'\b\5\0&\6\b\6B\3\3\0026\4\0\0009\4\1\0049\4\6\4\18\6\2\0B\4\2\2\b\4\0\0X\4/Ä6\4\0\0009\4\a\4'\6\b\0B\4\2\0016\4\0\0009\4\1\0049\4\t\4'\6\n\0\18\a\2\0&\6\a\6B\4\2\0016\4\0\0009\4\1\0049\4\6\4\18\6\3\0B\4\2\2\b\4\0\0X\4\29Ä6\4\0\0009\4\1\0049\4\t\4\18\6\3\0B\4\2\0016\4\0\0009\4\1\0049\4\3\4\18\6\1\0\18\a\0\0'\b\v\0'\t\f\0&\a\t\aB\4\3\0026\5\0\0009\5\1\0059\5\6\5\18\a\4\0B\5\2\2\b\5\0\0X\5\bÄ6\5\0\0009\5\1\0059\5\t\5'\a\r\0\18\b\4\0'\t\14\0&\a\t\aB\5\2\1K\0\1\0\6|\rnormal! \14\\zs\\d*\\ze\n:\\d*:\ae \fexecute\15 wincmd p \bcmd\nempty\tsd*e\6:\rmatchstr\rfindfile\afn\bvim\2ﬁ\1\0\0\b\2\v\1\31-\0\0\0B\0\1\0026\1\0\0009\1\1\0019\1\2\1'\3\3\0B\1\2\0026\2\0\0009\2\1\0029\2\4\0026\4\0\0009\4\5\0049\4\6\0046\6\0\0009\6\1\0069\6\a\6B\6\1\0A\4\0\2'\5\b\0B\2\3\2\b\2\0\0X\2\4Ä6\2\0\0009\2\t\2'\4\n\0B\2\2\1-\2\1\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\0¿\1¿\15ToggleTerm\bcmd\vanchor\14win_getid\24nvim_win_get_config\bapi\fhas_key\f<cWORD>\vexpand\afn\bvim\0&\1\0\5\0\3\0\a3\0\0\0003\1\1\0003\2\2\0\18\3\2\0B\3\1\0012\0\0ÄK\0\1\0\0\0\0\\\1\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0003\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\3\vsilent\2\fnoremap\2\vbuffer\2\0\agf\6n\bset\vkeymap\bvimí\n\1\0\a\0004\1a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\0\0=\3\6\0026\3\a\0009\3\b\0039\3\t\3=\3\t\0025\3\n\0006\4\v\0009\4\f\0046\6\a\0009\6\b\0069\6\r\6\24\6\0\6B\4\2\2=\4\14\0036\4\v\0009\4\f\0046\6\a\0009\6\b\0069\6\15\6\24\6\0\6B\4\2\2=\4\16\0035\4\17\0=\4\18\3=\3\19\0025\3\20\0003\4\21\0=\4\22\3=\3\23\2B\0\2\0016\0\a\0009\0\24\0009\0\25\0'\2\26\0'\3\27\0'\4\28\0005\5\29\0B\0\5\0016\0\a\0009\0\30\0006\1\a\0009\1 \0019\1!\1B\1\1\2=\1\31\0'\0\"\0006\1\a\0009\1\24\0019\1#\1\18\3\0\0005\4$\0B\1\3\0016\1\a\0009\1\24\0019\1%\0015\3&\0005\4'\0=\0(\0043\5)\0=\5*\4B\1\3\0016\1\a\0009\1\24\0019\1%\0015\3+\0005\4,\0=\0(\0043\5-\0=\5*\4B\1\3\0016\1\a\0009\1\24\0019\1%\0015\3.\0005\4/\0=\0(\0043\0050\0=\5*\4B\1\3\0016\1\a\0009\1\24\0019\1%\0015\0031\0005\0042\0=\0(\0043\0053\0=\5*\4B\1\3\1K\0\1\0\0\1\0\2\tonce\1\fpattern\26term://*#toggleterm#*\1\3\0\0\rTermOpen\14TermEnter\0\1\0\2\tonce\1\fpattern\29term://*#toggleterm#[^9]\1\3\0\0\rTermOpen\14TermEnter\0\1\0\2\tonce\1\fpattern\29term://*#toggleterm#[^9]\1\3\0\0\rTermOpen\14TermEnter\rcallback\0\ngroup\1\0\2\tonce\1\fpattern\31term://*/zsh;#toggleterm#*\1\4\0\0\rTermOpen\14TermEnter\rBufEnter\24nvim_create_autocmd\1\0\1\nclear\2\24nvim_create_augroup\21vimrc_toggleterm\nwinnr\afn\23toglleterm_win_num\6g\1\0\2\fnoremap\2\vsilent\2B<Cmd>execute v:count1 . \"ToggleTerm direction=horizontal\"<CR>\15<leader>tt\6n\20nvim_set_keymap\bapi\vwinbar\19name_formatter\0\1\0\1\fenabled\1\15float_opts\15highlights\1\0\2\15background\16ColorColumn\vborder\16ColorColumn\vheight\nlines\nwidth\fcolumns\nfloor\tmath\1\0\2\rwinblend\3\3\vborder\vsingle\nshell\6o\bvim\20shade_filetypes\tsize\1\0\n\20start_in_insert\1\19shading_factor\0061\20shade_terminals\2\17hide_numbers\2\18close_on_exit\1\17open_mapping\n<c-z>\16auto_scroll\1\14direction\15horizontal\17persist_size\1\20insert_mappings\2\0\nsetup\15toggleterm\frequireõ≥ÊÃ\25Ãô≥ˇ\3\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/toggleterm.nvim",
    url = "https://github.com/akinsho/toggleterm.nvim"
  },
  ["toolwindow.nvim"] = {
    config = { "\27LJ\2\n˘\4\0\0\6\0\19\0)6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2@<Cmd>lua require('toolwindow').open_window('todo', nil)<CR>\15<leader>bn\1\0\2\fnoremap\2\vsilent\2C<Cmd>lua require('toolwindow').open_window('trouble', nil)<CR>\15<leader>bd\1\0\2\fnoremap\2\vsilent\2@<Cmd>lua require('toolwindow').open_window('term', nil)<CR>\15<leader>bt\1\0\2\fnoremap\2\vsilent\2D<Cmd>lua require('toolwindow').open_window('quickfix', nil)<CR>\15<leader>bq\1\0\2\fnoremap\2\vsilent\2/<Cmd>lua require('toolwindow').close()<CR>\15<leader>bc\6n\bset\vkeymap\bvim\0" },
    load_after = {
      ["toggleterm.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/toolwindow.nvim",
    url = "https://github.com/EthanJWright/toolwindow.nvim"
  },
  ["treesitter-indent-object.nvim"] = {
    config = { "\27LJ\2\n≠\4\0\0\5\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\f\0'\3\r\0'\4\14\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\15\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0U<cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<cr>\aiI\1\3\0\0\6x\6oQ<cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<cr>\aii\1\3\0\0\6x\6oU<cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<cr>\aaI\1\3\0\0\6x\6oQ<cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<cr>\aai\1\3\0\0\6x\6o\bset\vkeymap\bvim\nsetup\29treesitter_indent_object\frequire\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/treesitter-indent-object.nvim",
    url = "https://github.com/kiyoon/treesitter-indent-object.nvim"
  },
  ["treesitter-unit"] = {
    config = { "\27LJ\2\nı\3\0\0\6\0\18\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\4\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\a\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\5\0005\5\16\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\15\0'\4\v\0005\5\17\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\1\0\1\fnoremap\2\6/\1\0\1\fnoremap\0028:<c-u>lua require\"treesitter-unit\".select(true)<CR>\1\0\1\fnoremap\0024:<c-u>lua require\"treesitter-unit\".select()<CR>\6o\1\0\1\fnoremap\0023:lua require\"treesitter-unit\".select(true)<CR>\aau\1\0\1\fnoremap\2/:lua require\"treesitter-unit\".select()<CR>\aiu\6x\20nvim_set_keymap\bapi\bvim\0" },
    load_after = {},
    loaded = true,
    needs_bufread = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/treesitter-unit",
    url = "https://github.com/David-Kunz/treesitter-unit"
  },
  ["vim-abolish"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-abolish",
    url = "https://github.com/tpope/vim-abolish"
  },
  ["vim-asterisk"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/vim-asterisk",
    url = "https://github.com/haya14busa/vim-asterisk"
  },
  ["vim-blade"] = {
    config = { "\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-blade",
    url = "https://github.com/jwalton512/vim-blade"
  },
  ["vim-endwise"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-endwise",
    url = "https://github.com/tpope/vim-endwise"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-fugitive",
    url = "https://github.com/tpope/vim-fugitive"
  },
  ["vim-illuminate"] = {
    config = { "\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1,\1=\1\2\0K\0\1\0\21Illuminate_delay\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/vim-illuminate",
    url = "https://github.com/RRethy/vim-illuminate"
  },
  ["vim-ipmotion"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-ipmotion",
    url = "https://github.com/justinmk/vim-ipmotion"
  },
  ["vim-log-highlighting"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-log-highlighting",
    url = "https://github.com/MTDL9/vim-log-highlighting"
  },
  ["vim-partedit"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-partedit",
    url = "https://github.com/thinca/vim-partedit"
  },
  ["vim-rhubarb"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-rhubarb",
    url = "https://github.com/tpope/vim-rhubarb"
  },
  ["vim-rooter"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-rooter",
    url = "https://github.com/airblade/vim-rooter"
  },
  ["vim-sleuth"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-sleuth",
    url = "https://github.com/tpope/vim-sleuth"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  },
  ["vim-test"] = {
    config = { "\27LJ\2\nú\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\21php artisan test test#php#phpunit#executable\29test#neovim#start_normal\vneovim\18test#strategy\6g\bvim\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-test",
    url = "https://github.com/vim-test/vim-test"
  },
  ["vim-toggle-quickfix"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-toggle-quickfix",
    url = "https://github.com/drmingdrmer/vim-toggle-quickfix"
  },
  ["vim-wordmotion"] = {
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/vim-wordmotion",
    url = "https://github.com/chaoren/vim-wordmotion"
  },
  ["which-key.nvim"] = {
    after = { "surround-ui.nvim" },
    config = { "\27LJ\2\nã\5\0\0\6\0#\0'6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\6\0005\3\3\0005\4\4\0=\4\5\3=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0025\3\f\0005\4\r\0=\4\14\0035\4\15\0=\4\16\3=\3\17\0025\3\19\0005\4\18\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0=\3\25\0025\3\26\0=\3\27\2B\0\2\0016\0\28\0009\0\29\0009\0\30\0'\2\31\0'\3 \0'\4!\0005\5\"\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\25<Cmd>WhichKey \\ <CR>\17<Leader><CR>\6n\20nvim_set_keymap\bapi\bvim\rtriggers\1\2\0\0\r<Leader>\vhidden\1\t\0\0\r<silent>\n<cmd>\n<Cmd>\t<CR>\tcall\blua\a^:\a^ \vlayout\nwidth\1\0\2\bmax\0032\bmin\3\20\vheight\1\0\1\fspacing\3\3\1\0\2\bmax\3\25\bmin\3\4\vwindow\fpadding\1\5\0\0\3\2\3\2\3\2\3\2\vmargin\1\5\0\0\3\1\3\0\3\1\3\0\1\0\2\rposition\vbottom\vborder\tnone\nicons\1\0\3\ngroup\6+\14separator\b‚ûú\15breadcrumb\a¬ª\14operators\1\0\1\agc\rComments\fplugins\1\0\1\14show_help\2\fpresets\1\0\a\fwindows\1\17text_objects\1\fmotions\1\14operators\1\6g\1\6z\1\bnav\1\1\0\2\14registers\1\nmarks\1\nsetup\14which-key\frequire\0" },
    loaded = false,
    needs_bufread = false,
    only_cond = false,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/opt/which-key.nvim",
    url = "https://github.com/folke/which-key.nvim"
  },
  ["wilder.nvim"] = {
    config = { "\27LJ\2\nª\4\0\0\f\0\25\2.6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\1\6\0'\3\a\0004\4\3\0009\5\b\0009\a\t\0B\a\1\0029\b\n\0B\b\1\0A\5\1\0?\5\0\0B\1\3\0019\1\6\0'\3\v\0009\4\f\0009\6\r\0005\b\15\0005\t\14\0=\t\16\b9\t\17\0B\t\1\2=\t\18\b5\t\19\0009\n\20\0B\n\1\0?\n\1\0=\t\21\b5\t\22\0009\n\23\0B\n\1\0?\n\1\0=\t\24\bB\6\2\0A\4\0\0A\1\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \16highlighter\22basic_highlighter\15highlights\1\0\2\rpumblend\3\20\vborder\frounded\1\0\1\vborder\vNormal\27popupmenu_border_theme\23popupmenu_renderer\rrenderer\20search_pipeline\21cmdline_pipeline\vbranch\rpipeline\15set_option\nmodes\1\0\4\15accept_key\v<Down>\17previous_key\n<C-p>\rnext_key\n<C-n>\15reject_key\t<Up>\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0" },
    loaded = true,
    path = "/home/skjkw/.local/share/nvim/site/pack/packer/start/wilder.nvim",
    url = "https://github.com/gelguy/wilder.nvim"
  }
}

time([[Defining packer_plugins]], false)
local module_lazy_loads = {
  ["^lsp%-colors"] = "lsp-colors.nvim",
  ["^lspkind"] = "lspkind-nvim",
  ["^notify"] = "nvim-notify"
}
local lazy_load_called = {['packer.load'] = true}
local function lazy_load_module(module_name)
  local to_load = {}
  if lazy_load_called[module_name] then return nil end
  lazy_load_called[module_name] = true
  for module_pat, plugin_name in pairs(module_lazy_loads) do
    if not _G.packer_plugins[plugin_name].loaded and string.match(module_name, module_pat) then
      to_load[#to_load + 1] = plugin_name
    end
  end

  if #to_load > 0 then
    require('packer.load')(to_load, {module = module_name}, _G.packer_plugins)
    local loaded_mod = package.loaded[module_name]
    if loaded_mod then
      return function(modname) return loaded_mod end
    end
  end
end

if not vim.g.packer_custom_loader_enabled then
  table.insert(package.loaders, 1, lazy_load_module)
  vim.g.packer_custom_loader_enabled = true
end

-- Setup for: telescope.nvim
time([[Setup for telescope.nvim]], true)
try_loadstring("\27LJ\2\nÚ\n\0\0\6\0003\0Å\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\16\0'\4\17\0005\5\18\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\19\0'\4\20\0005\5\21\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\4\23\0005\5\24\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\25\0'\4\26\0005\5\27\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\28\0'\4\29\0005\5\30\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\31\0'\4 \0005\5!\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\"\0'\4#\0005\5$\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3%\0'\4&\0005\5'\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3(\0'\4)\0005\5*\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3+\0'\4,\0005\5-\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3.\0'\4/\0005\0050\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\22\0'\0041\0005\0052\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2&<cmd>Telescope live_grep_args<cr>\1\0\1\fnoremap\2\"<cmd>Telescope treesitter<cr>\15<leader>gt\1\0\1\fnoremap\2\31<cmd>Telescope pickers<cr>\15<leader>xp\1\0\2\fnoremap\2\vsilent\2\31<cmd>Telescope project<cr>\15<leader>fp\1\0\1\fnoremap\2!<cmd>Telescope registers<cr>\15<leader>gr\1\0\1\fnoremap\2&<cmd>Telescope search_history<cr>\15<leader>gs\1\0\1\fnoremap\2'<cmd>Telescope command_history<cr>\15<leader>gc\1\0\1\fnoremap\2&<cmd>Telescope lsp_references<cr>\15<leader>lr\1\0\1\fnoremap\2'<cmd>Telescope lsp_definitions<cr>\15<leader>ld\1\0\1\fnoremap\2!<cmd>Telescope live_grep<cr>\15<leader>ge\1\0\1\fnoremap\2#<cmd>Telescope grep_string<cr>\15<leader>gw\1\0\1\fnoremap\2!<cmd>Telescope git_files<cr>\15<leader>gf\1\0\1\fnoremap\2 <cmd>Telescope frecency<cr>\15<leader>fr\1\0\1\fnoremap\2!<cmd>Telescope help_tags<cr>\15<leader>fh\1\0\1\fnoremap\2\31<cmd>Telescope buffers<cr>\15<leader>fb\1\0\1\fnoremap\2\"<cmd>Telescope find_files<cr>\15<leader>ff\6n\bset\vkeymap\bvim\0", "setup", "telescope.nvim")
time([[Setup for telescope.nvim]], false)
-- Setup for: neo-tree.nvim
time([[Setup for neo-tree.nvim]], true)
try_loadstring("\27LJ\2\nr\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\21<Cmd>Neotree<CR>\21<leader><leader>\6n\bset\vkeymap\bvim\0", "setup", "neo-tree.nvim")
time([[Setup for neo-tree.nvim]], false)
-- Setup for: sidebar.nvim
time([[Setup for sidebar.nvim]], true)
try_loadstring("\27LJ\2\nn\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\31<Cmd>SidebarNvimToggle<CR>\ags\6n\bset\vkeymap\bvim\0", "setup", "sidebar.nvim")
time([[Setup for sidebar.nvim]], false)
-- Setup for: markdown-preview.nvim
time([[Setup for markdown-preview.nvim]], true)
try_loadstring("\27LJ\2\n=\0\0\2\0\4\0\0056\0\0\0009\0\1\0005\1\3\0=\1\2\0K\0\1\0\1\2\0\0\rmarkdown\19mkdp_filetypes\6g\bvim\0", "setup", "markdown-preview.nvim")
time([[Setup for markdown-preview.nvim]], false)
-- Setup for: neogit
time([[Setup for neogit]], true)
try_loadstring("\27LJ\2\nt\0\0\6\0\a\0\t6\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\2\20<Cmd>Neogit<CR>\15<leader>gg\6n\20nvim_set_keymap\bapi\bvim\0", "setup", "neogit")
time([[Setup for neogit]], false)
-- Config for: orgmode
time([[Config for orgmode]], true)
try_loadstring("\27LJ\2\n∞\1\0\0\4\0\a\0\0146\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\0\0'\2\1\0B\0\2\0029\0\3\0005\2\5\0005\3\4\0=\3\6\2B\0\2\1K\0\1\0\21org_agenda_files\1\0\1\27org_default_notes_file\22~/work/refile.org\1\2\0\0\r~/work/*\nsetup\21setup_ts_grammar\forgmode\frequire\0", "config", "orgmode")
time([[Config for orgmode]], false)
-- Config for: treesitter-indent-object.nvim
time([[Config for treesitter-indent-object.nvim]], true)
try_loadstring("\27LJ\2\n≠\4\0\0\5\0\18\0\"6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0005\2\6\0'\3\a\0'\4\b\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\t\0'\3\n\0'\4\v\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\f\0'\3\r\0'\4\14\0B\0\4\0016\0\3\0009\0\4\0009\0\5\0005\2\15\0'\3\16\0'\4\17\0B\0\4\1K\0\1\0U<cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner(true)<cr>\aiI\1\3\0\0\6x\6oQ<cmd>lua require'treesitter_indent_object.textobj'.select_indent_inner()<cr>\aii\1\3\0\0\6x\6oU<cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer(true)<cr>\aaI\1\3\0\0\6x\6oQ<cmd>lua require'treesitter_indent_object.textobj'.select_indent_outer()<cr>\aai\1\3\0\0\6x\6o\bset\vkeymap\bvim\nsetup\29treesitter_indent_object\frequire\0", "config", "treesitter-indent-object.nvim")
time([[Config for treesitter-indent-object.nvim]], false)
-- Config for: lualine.nvim
time([[Config for lualine.nvim]], true)
try_loadstring("\27LJ\2\n\\\0\0\5\0\5\1\0156\0\0\0009\0\1\0009\0\2\0006\2\0\0009\2\1\0029\2\3\2'\4\4\0B\2\2\0A\0\0\2\t\0\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\b%:t\vexpand\nempty\afn\bvim\2G\0\0\3\0\3\0\f6\0\0\0009\0\1\0009\0\2\0)\2\0\0B\0\2\2)\1P\0\0\1\0\0X\0\2Ä+\0\1\0X\1\1Ä+\0\2\0L\0\2\0\rwinwidth\afn\bvimñ\1\0\0\6\0\a\0\0276\0\0\0009\0\1\0009\0\2\0'\2\3\0B\0\2\0026\1\0\0009\1\1\0019\1\4\1'\3\5\0\18\4\0\0'\5\6\0&\4\5\4B\1\3\2\r\2\1\0X\2\vÄ\21\2\1\0)\3\0\0\1\3\2\0X\2\4Ä\21\2\1\0\21\3\0\0\0\2\3\0X\2\2Ä+\2\1\0X\3\1Ä+\2\2\0L\2\2\0\6;\t.git\ffinddir\n%:p:h\vexpand\afn\bvimI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3¿\14lualine_c\rsections\vinsert\ntableI\0\1\5\1\4\0\b6\1\0\0009\1\1\1-\3\0\0009\3\2\0039\3\3\3\18\4\0\0B\1\3\1K\0\1\0\3¿\14lualine_x\rsections\vinsert\ntable\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñä\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\bÔååí\3\0\0\4\1\"\0E5\0\1\0-\1\0\0009\1\0\1=\1\2\0-\1\0\0009\1\3\1=\1\4\0-\1\0\0009\1\5\1=\1\6\0-\1\0\0009\1\5\1=\1\a\0-\1\0\0009\1\5\1=\1\b\0-\1\0\0009\1\t\1=\1\n\0-\1\0\0009\1\0\1=\1\v\0-\1\0\0009\1\f\1=\1\r\0-\1\0\0009\1\f\1=\1\14\0-\1\0\0009\1\f\1=\1\15\0-\1\0\0009\1\16\1=\1\17\0-\1\0\0009\1\18\1=\1\19\0-\1\0\0009\1\18\1=\1\20\0-\1\0\0009\1\0\1=\1\21\0-\1\0\0009\1\0\1=\1\22\0-\1\0\0009\1\23\1=\1\24\0-\1\0\0009\1\23\1=\1\25\0-\1\0\0009\1\23\1=\1\26\0-\1\0\0009\1\0\1=\1\27\0-\1\0\0009\1\0\1=\1\28\0005\1 \0006\2\29\0009\2\30\0029\2\31\2B\2\1\0028\2\2\0=\2!\1L\1\2\0\1¿\afg\1\0\0\tmode\afn\bvim\6t\6!\ar?\arm\6r\tcyan\ace\acv\aRv\6R\vviolet\aic\vyellow\6\19\6S\6s\vorange\ano\6c\fmagenta\6V\6\22\6v\tblue\6i\ngreen\6n\1\0\0\bred\18\0\0\1\0\1\0\2'\0\0\0L\0\2\0\a%=ô\2\0\0\r\0\14\1&'\0\0\0006\1\1\0009\1\2\0019\1\3\1)\3\0\0'\4\4\0B\1\3\0026\2\1\0009\2\5\0029\2\6\2B\2\1\0026\3\a\0\18\5\2\0B\3\2\2\v\3\0\0X\3\1ÄL\0\2\0006\3\b\0\18\5\2\0B\3\2\4X\6\14Ä9\b\t\a9\b\n\b\15\0\b\0X\t\nÄ6\t\1\0009\t\v\t9\t\f\t\18\v\b\0\18\f\1\0B\t\3\2\b\t\0\0X\t\2Ä9\t\r\aL\t\2\0E\6\3\3R\6\127L\0\2\0\tname\nindex\afn\14filetypes\vconfig\vipairs\tnext\23get_active_clients\blsp\rfiletype\24nvim_buf_get_option\bapi\bvim\18No Active Lsp˛ˇˇˇ\31M\0\0\3\0\3\0\0056\0\0\0'\2\1\0B\0\2\0029\0\2\0D\0\1\0\25current_session_name\25auto-session-library\frequire\19\0\0\1\0\1\0\2'\0\0\0L\0\2\0\b‚ñäò\14\1\0\f\0c\0Ã\0016\0\0\0'\2\1\0B\0\2\0025\1\2\0005\2\4\0003\3\3\0=\3\5\0023\3\6\0=\3\a\0023\3\b\0=\3\t\0025\3\22\0005\4\n\0005\5\16\0005\6\14\0005\a\f\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\17\0055\6\19\0005\a\18\0009\b\v\1=\b\v\a9\b\r\1=\b\r\a=\a\15\6=\6\20\5=\5\21\4=\4\23\0035\4\24\0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4\31\0035\4 \0004\5\0\0=\5\25\0044\5\0\0=\5\26\0044\5\0\0=\5\27\0044\5\0\0=\5\28\0044\5\0\0=\5\29\0044\5\0\0=\5\30\4=\4!\0033\4\"\0003\5#\0\18\6\4\0005\b'\0003\t$\0>\t\1\b5\t&\0009\n%\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b+\0003\t)\0>\t\1\b3\t*\0=\t(\bB\6\2\1\18\6\4\0005\b,\0009\t\5\2=\t-\bB\6\2\1\18\6\4\0005\b.\0009\t\5\2=\t-\b5\t0\0009\n/\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b1\0B\6\2\1\18\6\4\0005\b2\0005\t3\0009\n\v\1=\n\v\t=\t(\bB\6\2\1\18\6\4\0005\b4\0005\t5\0=\t6\b5\t7\0=\t8\b5\t;\0005\n:\0009\v9\1=\v\v\n=\n<\t5\n>\0009\v=\1=\v\v\n=\n?\t5\nA\0009\v@\1=\v\v\n=\nB\t=\tC\bB\6\2\1\18\6\4\0004\b\3\0003\tD\0>\t\1\bB\6\2\1\18\6\4\0005\bF\0003\tE\0>\t\1\b5\tG\0=\t(\bB\6\2\1\18\6\4\0004\b\3\0003\tH\0>\t\1\bB\6\2\1\18\6\5\0005\bI\0006\tJ\0009\tK\t=\tL\b9\t\a\2=\t-\b5\tN\0009\nM\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bO\0006\tJ\0009\tK\t=\tL\b5\tP\0009\nM\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bQ\0005\tS\0009\nR\1=\n\v\t=\t(\bB\6\2\1\18\6\5\0005\bT\0005\tU\0=\t8\b5\tW\0005\nV\0009\vM\1=\v\v\n=\nX\t5\nZ\0009\vY\1=\v\v\n=\n[\t5\n\\\0009\v9\1=\v\v\n=\n]\t=\t^\b9\t\a\2=\t-\bB\6\2\1\18\6\5\0005\ba\0003\t_\0>\t\1\b5\t`\0009\n%\1=\n\v\t=\t(\bB\6\2\0019\6b\0\18\b\3\0B\6\2\0012\0\0ÄK\0\1\0\nsetup\1\0\0\1\0\0\0\15diff_color\fremoved\1\0\0\rmodified\1\0\0\vorange\nadded\1\0\0\1\0\0\1\0\3\nadded\tÔÉæ \fremoved\tÔÖÜ \rmodified\tÔßâ \1\2\0\0\tdiff\1\0\1\bgui\tbold\vviolet\1\2\1\0\vbranch\ticon\bÔëø\1\0\1\bgui\tbold\1\2\1\0\15fileformat\18icons_enabled\1\1\0\1\bgui\tbold\ngreen\bfmt\nupper\vstring\1\2\0\0\15o:encoding\0\1\0\2\bgui\tbold\afg\f#ffffff\1\0\1\ticon\rÔÇÖ LSP:\0\0\22diagnostics_color\15color_info\1\0\0\tcyan\15color_warn\1\0\0\vyellow\16color_error\1\0\0\1\0\0\bred\fsymbols\1\0\3\tinfo\tÔÅ™ \nerror\tÔÅó \twarn\tÔÅ± \fsources\1\2\0\0\20nvim_diagnostic\1\2\0\0\16diagnostics\1\0\1\bgui\tbold\1\2\0\0\rprogress\1\2\0\0\rlocation\1\0\1\bgui\tbold\fmagenta\1\2\0\0\rfilename\tcond\1\2\0\0\rfilesize\1\0\0\0\0\ncolor\1\0\0\1\0\0\tblue\0\0\0\22inactive_sections\1\0\0\rsections\14lualine_x\14lualine_c\14lualine_z\14lualine_y\14lualine_b\14lualine_a\1\0\0\foptions\1\0\0\ntheme\rinactive\1\0\0\1\0\0\vnormal\1\0\0\6c\1\0\0\abg\1\0\0\afg\1\0\2\25component_separators\5\23section_separators\5\24check_git_workspace\0\18hide_in_width\0\21buffer_not_empty\1\0\0\0\1\0\v\fmagenta\f#c678dd\rdarkblue\f#081633\tblue\f#51afef\tcyan\f#008080\bred\f#ec5f67\vyellow\f#ECBE7B\afg\f#bbc2cf\abg\f#202328\vviolet\f#a9a1e1\vorange\f#FF8800\ngreen\f#98be65\flualine\frequire\0", "config", "lualine.nvim")
time([[Config for lualine.nvim]], false)
-- Config for: fidget.nvim
time([[Config for fidget.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\4\0\5\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0004\3\0\0=\3\4\2B\0\2\1K\0\1\0\fsources\1\0\0\nsetup\vfidget\frequire\0", "config", "fidget.nvim")
time([[Config for fidget.nvim]], false)
-- Config for: flit.nvim
time([[Config for flit.nvim]], true)
try_loadstring("\27LJ\2\nv\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\tkeys\1\0\2\14multiline\2\18labeled_modes\bnvo\1\0\4\6F\6F\6f\6f\6t\6t\6T\6T\nsetup\tflit\frequire\0", "config", "flit.nvim")
time([[Config for flit.nvim]], false)
-- Config for: vim-blade
time([[Config for vim-blade]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "vim-blade")
time([[Config for vim-blade]], false)
-- Config for: snippet-converter.nvim
time([[Config for snippet-converter.nvim]], true)
try_loadstring("\27LJ\2\n¨\3\0\0\6\0\21\0-5\0\t\0005\1\5\0004\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\3\0B\3\2\2'\4\4\0&\3\4\3>\3\1\2=\2\6\0014\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\3\0B\3\2\2'\4\a\0&\3\4\3>\3\1\2=\2\b\1=\1\n\0005\1\r\0004\2\3\0006\3\0\0009\3\1\0039\3\2\3'\5\v\0B\3\2\2'\4\f\0&\3\4\3>\3\1\2=\2\14\1=\1\15\0006\1\16\0'\3\17\0B\1\2\0029\1\18\0015\3\19\0004\4\3\0>\0\1\4=\4\20\3B\1\2\1K\0\1\0\14templates\1\0\0\nsetup\22snippet_converter\frequire\voutput\19vscode_luasnip\1\0\0\22/luasnip_snippets\vconfig\fsources\1\0\0\rsnipmate2/site/pack/packer/start/vim-snippets/snippets\14ultisnips\1\0\0003/site/pack/packer/start/vim-snippets/UltiSnips\tdata\fstdpath\afn\bvim\0", "config", "snippet-converter.nvim")
time([[Config for snippet-converter.nvim]], false)
-- Config for: csv.vim
time([[Config for csv.vim]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "csv.vim")
time([[Config for csv.vim]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\nê\5\0\0\5\0 \0)6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0005\4\5\0=\4\6\3=\3\a\0025\3\b\0=\3\t\0025\3\v\0005\4\n\0=\4\6\0035\4\f\0=\4\r\3=\3\14\0025\3\15\0005\4\16\0=\4\6\3=\3\17\0025\3\18\0004\4\0\0=\4\6\0035\4\19\0=\4\20\0035\4\21\0=\4\22\3=\3\23\0025\3\24\0004\4\0\0=\4\6\3=\3\25\0025\3\26\0=\3\27\0025\3\28\0=\3\29\0025\3\30\0=\3\31\2B\0\2\1K\0\1\0\14tree_docs\1\0\1\venable\2\vmarkid\1\0\1\venable\2\tyati\1\0\1\venable\2\fmatchup\1\0\1\venable\1\npairs\fkeymaps\1\0\1\17goto_partner\a'%\26highlight_pair_events\1\2\0\0\16CursorMoved\1\0\4\venable\1\24fallback_cmd_normal)call matchit#Match_wrapper('',1,'n')\19goto_right_end\1\19highlight_self\2\frainbow\1\2\0\0\bcpp\1\0\2\venable\2\18extended_mode\2\14highlight&additional_vim_regex_highlighting\1\2\0\0\borg\1\0\0\1\2\0\0\thelp\19ignore_install\1\2\0\0\6d\vindent\fdisable\1\2\0\0\vpython\1\0\1\venable\1\1\0\2\17auto_install\2\21ensure_installed\ball\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: leap.nvim
time([[Config for leap.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\25add_default_mappings\tleap\frequire\0", "config", "leap.nvim")
time([[Config for leap.nvim]], false)
-- Config for: none-ls.nvim
time([[Config for none-ls.nvim]], true)
try_loadstring("\27LJ\2\n£\1\0\2\5\0\5\0\t9\2\0\0009\2\1\2\15\0\2\0X\3\4Ä6\2\2\0009\2\3\2'\4\4\0B\2\2\1K\0\1\0Eautocmd BufWritePost <buffer> lua vim.lsp.buf.format(nil, 10000)\bcmd\bvim\31documentFormattingProvider\24server_capabilities<\0\1\2\0\4\0\0066\1\1\0009\1\2\0019\1\0\0019\1\3\1=\1\0\0K\0\1\0\tWARN\15diagnostic\bvim\rseverity˝\4\1\0\n\0\30\1C6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0003\3\3\0=\3\5\0024\3\5\0006\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\b\0049\4\t\0045\6\v\0005\a\n\0=\a\f\6B\4\2\2>\4\1\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\r\0049\4\t\0045\6\15\0005\a\14\0=\a\f\0063\a\16\0=\a\17\0066\a\0\0'\t\1\0B\a\2\0029\a\18\a9\a\19\a=\a\20\6B\4\2\2>\4\2\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\a\0049\4\21\0049\4\t\0045\6\22\0B\4\2\2>\4\3\0036\4\0\0'\6\1\0B\4\2\0029\4\6\0049\4\23\0049\4\24\0049\4\t\0045\6\26\0005\a\25\0=\a\f\0065\a\27\0=\a\28\6B\4\2\0?\4\0\0=\3\29\2B\0\2\1K\0\1\0\fsources\targs\1\b\0\0\21--no-interaction\f--quiet\bfix\r--config\27.php-cs-fixer.idst.php\21--using-cache=no\14$FILENAME\1\0\0\1\2\0\0\bphp\15phpcsfixer\15formatting\1\0\1\23diagnostics_format\25[eslint] #{m}\n(#{c})\reslint_d\vmethod\24DIAGNOSTICS_ON_SAVE\fmethods\28diagnostics_postprocess\0\1\0\0\1\2\0\0\bphp\fphpstan\14filetypes\1\0\0\1\2\0\0\bphp\twith\bphp\16diagnostics\rbuiltins\14on_attach\1\0\0\0\nsetup\fnull-ls\frequire\tÄÄ¿ô\4\0", "config", "none-ls.nvim")
time([[Config for none-ls.nvim]], false)
-- Config for: debugprint.nvim
time([[Config for debugprint.nvim]], true)
try_loadstring("\27LJ\2\nA\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0006\2\3\0B\0\2\1K\0\1\0\topts\nsetup\15debugprint\frequire\0", "config", "debugprint.nvim")
time([[Config for debugprint.nvim]], false)
-- Config for: markid
time([[Config for markid]], true)
try_loadstring("\27LJ\2\n\v\0\0\1\0\0\0\1K\0\1\0\0", "config", "markid")
time([[Config for markid]], false)
-- Config for: todo-comments.nvim
time([[Config for todo-comments.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18todo-comments\frequire\0", "config", "todo-comments.nvim")
time([[Config for todo-comments.nvim]], false)
-- Config for: nvim-lspconfig
time([[Config for nvim-lspconfig]], true)
try_loadstring("\27LJ\2\n±\5\0\2\t\0\29\0k6\2\0\0009\2\1\0029\2\2\0025\4\3\0B\2\2\0015\2\4\0=\1\5\0026\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\t\0006\a\0\0009\a\n\a9\a\v\a9\a\f\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\r\0006\a\0\0009\a\n\a9\a\v\a9\a\14\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\15\0006\a\0\0009\a\n\a9\a\v\a9\a\16\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\17\0006\a\0\0009\a\n\a9\a\v\a9\a\18\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\19\0006\a\0\0009\a\n\a9\a\v\a9\a\20\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\21\0006\a\0\0009\a\n\a9\a\v\a9\a\22\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\23\0006\a\0\0009\a\n\a9\a\v\a9\a\24\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\25\0006\a\0\0009\a\n\a9\a\v\a9\a\26\a\18\b\2\0B\3\5\0016\3\0\0009\3\6\0039\3\a\3'\5\b\0'\6\27\0006\a\0\0009\a\n\a9\a\v\a9\a\28\a\18\b\2\0B\3\5\1K\0\1\0\vformat\15<leader>gF\15references\agr\16code_action\15<leader>ca\vrename\15<leader>rn\20type_definition\14<leader>D\19signature_help\n<C-k>\19implementation\agi\15definition\agd\16declaration\bbuf\blsp\agD\6n\bset\vkeymap\vbuffer\1\0\2\vsilent\2\fnoremap\2\1\0\1\17virtual_text\1\vconfig\15diagnostic\bvimC\0\2\6\1\1\0\t-\2\0\0\18\4\0\0\18\5\1\0B\2\3\0016\2\0\0\18\4\0\0\18\5\1\0B\2\3\1K\0\1\0\1¿\26enable_format_on_saveﬁ\19\1\0\14\0i\0◊\0015\0\0\0006\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\5\0006\5\1\0009\5\6\0059\5\a\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\b\0006\5\1\0009\5\6\0059\5\t\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\n\0006\5\1\0009\5\6\0059\5\v\5\18\6\0\0B\1\5\0016\1\1\0009\1\2\0019\1\3\1'\3\4\0'\4\f\0006\5\1\0009\5\6\0059\5\r\5\18\6\0\0B\1\5\0013\1\14\0006\2\1\0009\2\15\0029\2\16\0029\2\17\2B\2\1\0029\3\18\0025\4\20\0=\4\19\0039\3\18\0029\3\21\0039\3\22\3+\4\2\0=\4\23\0039\3\18\0029\3\21\0039\3\22\0035\4\26\0005\5\25\0=\5\27\4=\4\24\0036\3\28\0'\5\29\0B\3\2\0029\4\30\0039\4\31\0045\6 \0=\2!\0063\a\"\0=\a#\0065\a3\0005\b%\0005\t$\0=\t&\b5\t(\0005\n'\0=\n)\t=\t*\b5\t.\0006\n\1\0009\n+\n9\n,\n'\f-\0+\r\2\0B\n\3\2=\n/\t=\t0\b5\t1\0=\t2\b=\b4\a=\a5\6B\4\2\0019\0046\0039\4\31\0045\0067\0=\2!\6=\1#\0065\aB\0005\b9\0005\t8\0=\t:\b5\t;\0=\t*\b5\t=\0005\n<\0=\n>\t=\t?\b5\t@\0=\tA\b=\b6\a=\a5\6B\4\2\0019\4C\0039\4\31\0045\6D\0=\1#\6=\2!\0065\aE\0=\aF\6B\4\2\0019\4G\0039\4\31\0045\6H\0=\1#\6=\2!\6B\4\2\0019\4I\0039\4\31\0045\6K\0005\aJ\0=\aL\6=\1#\6=\2!\6B\4\2\0019\4M\0039\4\31\0045\6N\0=\1#\6=\2!\6B\4\2\0019\4O\0039\4\31\0045\6P\0=\1#\6=\2!\0065\aQ\0=\aF\0065\aR\0=\aS\6B\4\2\0019\4T\0039\4\31\0045\6U\0=\1#\6=\2!\6B\4\2\0019\4V\0039\4\31\0045\6W\0=\1#\6=\2!\6B\4\2\0019\4X\0039\4\31\0045\6Y\0=\1#\6=\2!\0065\aZ\0=\a[\6B\4\2\0019\4\\\0039\4\31\0045\6]\0=\1#\6=\2!\6B\4\2\0019\4^\0039\4\31\0045\6_\0=\1#\6=\2!\6B\4\2\0019\4`\0039\4\31\0045\6a\0=\1#\6=\2!\6B\4\2\0019\4b\0039\4\31\0045\6c\0=\1#\6=\2!\6B\4\2\0019\4d\0039\4\31\0045\6e\0=\1#\6=\2!\6B\4\2\0019\4f\0039\4\31\0045\6g\0=\1#\6=\2!\6B\4\2\0019\4X\0039\4\31\0045\6h\0=\1#\6=\2!\6B\4\2\0012\0\0ÄK\0\1\0\1\0\0\1\0\0\18rust_analyzer\1\0\0\frubocop\1\0\0\15solargraph\1\0\0\veslint\1\0\0\thtml\1\0\0\ncssls\nflags\1\0\1\26debounce_text_changes\3ñ\1\1\0\0\16tailwindcss\1\0\0\vjsonls\1\0\0\rmarksman\bcmd\1\3\0\0\31typescript-language-server\f--stdio\1\4\0\0\15typescript\20typescriptreact\19typescript.tsx\1\0\0\rtsserver\1\0\0\nsqlls\15typescript\1\0\0\1\0\1\ttsdka/home/skjkw/.local/share/nvim/mason/packages/vue-language-server/node_modules/typescript/lib\nvolar\1\0\0\25jedi_language_server\14filetypes\1\n\0\0\thtml\20typescriptreact\20javascriptreact\bcss\tsass\tscss\tless\tvime\nblade\1\0\0\remmet_ls\1\0\0\nfiles\1\0\1\fmaxSize\3¿ñ±\2\16environment\17includePaths\1\0\0\1\2\0\0003/home/skjkw/.config/composer/vendor/php-stubs/\1\0\1\venable\2\nstubs\1\0\0\1@\0\0\vbcmath\bbz2\rcalendar\tCore\tcurl\tdate\bdba\bdom\fenchant\rfileinfo\vfilter\bftp\agd\fgettext\thash\niconv\timap\tintl\tjson\tldap\vlibxml\rmbstring\vmcrypt\nmysql\vmysqli\rpassword\npcntl\tpcre\bPDO\14pdo_mysql\tPhar\rreadline\vrecode\15Reflection\nregex\fsession\14SimpleXML\tsoap\fsockets\vsodium\bSPL\rstandard\17superglobals\fsysvsem\fsysvshm\14tokenizer\bxml\vxdebug\14xmlreader\14xmlwriter\tyaml\bzip\tzlib\14wordpress\16woocommerce\facf-pro\14acf-stubs\20wordpress-stubs\22wordpress-globals\17wp-cli-stubs\fgenesis\rpolylang\bsbi\1\0\0\17intelephense\rsettings\bLua\1\0\0\14telemetry\1\0\1\venable\1\14workspace\flibrary\1\0\1\20checkThirdParty\1\5\26nvim_get_runtime_file\bapi\16diagnostics\fglobals\1\0\0\1\2\0\0\bvim\fruntime\1\0\0\1\0\1\fversion\vLuaJIT\14on_attach\0\17capabilities\1\0\0\nsetup\vlua_ls\14lspconfig\frequire\15properties\1\0\0\1\4\0\0\18documentation\vdetail\24additionalTextEdits\19resolveSupoort\19snippetSupport\19completionItem\15completion\1\0\2\24dynamicRegistration\1\20lineFoldingOnly\2\17foldingRange\17textDocument\29make_client_capabilities\rprotocol\blsp\0\15setloclist\15<leader>lq\14goto_next\a]d\14goto_prev\a[d\15open_float\15diagnostic\15<leader>le\6n\bset\vkeymap\bvim\1\0\2\fnoremap\2\vsilent\2\0", "config", "nvim-lspconfig")
time([[Config for nvim-lspconfig]], false)
-- Config for: emmet-vim
time([[Config for emmet-vim]], true)
try_loadstring("\27LJ\2\n3\0\0\2\0\4\0\0056\0\0\0009\0\1\0'\1\3\0=\1\2\0K\0\1\0\6a\20user_emmet_mode\6g\bvim\0", "config", "emmet-vim")
time([[Config for emmet-vim]], false)
-- Config for: swagger-preview.nvim
time([[Config for swagger-preview.nvim]], true)
try_loadstring("\27LJ\2\n[\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0B\0\2\1K\0\1\0\1\0\2\thost\14localhost\tport\3ê?\nsetup\20swagger-preview\frequire\0", "config", "swagger-preview.nvim")
time([[Config for swagger-preview.nvim]], false)
-- Config for: nightfox.nvim
time([[Config for nightfox.nvim]], true)
try_loadstring("\27LJ\2\n¿\2\0\0\b\0\15\0\0256\0\0\0'\2\1\0B\0\2\0029\1\2\0005\3\n\0005\4\b\0006\5\3\0009\5\4\0059\5\5\5'\a\6\0B\5\2\2'\6\a\0&\5\6\5=\5\t\4=\4\v\3B\1\2\0016\1\3\0009\1\f\1'\3\r\0B\1\2\0016\1\3\0009\1\f\1'\3\14\0B\1\2\1K\0\1\0\25colorscheme nightfoxCautocmd ColorScheme * lua require('leap').init_highlight(true)\bcmd\foptions\1\0\0\17compile_path\1\0\3\16transparent\1\20terminal_colors\2\17dim_inactive\1\14/nightfox\ncache\fstdpath\afn\bvim\nsetup\rnightfox\frequire\0", "config", "nightfox.nvim")
time([[Config for nightfox.nvim]], false)
-- Config for: nvim-surround
time([[Config for nvim-surround]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18nvim-surround\frequire\0", "config", "nvim-surround")
time([[Config for nvim-surround]], false)
-- Config for: memolist.vim
time([[Config for memolist.vim]], true)
try_loadstring("\27LJ\2\n \1\0\0\2\0\t\0\0176\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0'\1\5\0=\1\4\0006\0\0\0009\0\1\0)\1\1\0=\1\6\0006\0\0\0009\0\1\0'\1\b\0=\1\a\0K\0\1\0\30~/.memolist/memotemplates\31memolist_template_dir_path\17memolist_fzf\amd\25memolist_memo_suffix\21~/.memolist/memo\18memolist_path\6g\bvim\0", "config", "memolist.vim")
time([[Config for memolist.vim]], false)
-- Config for: lsp_lines.nvim
time([[Config for lsp_lines.nvim]], true)
try_loadstring("\27LJ\2\n7\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\14lsp_lines\frequire\0", "config", "lsp_lines.nvim")
time([[Config for lsp_lines.nvim]], false)
-- Config for: pantran.nvim
time([[Config for pantran.nvim]], true)
try_loadstring("\27LJ\2\nÚ\3\0\0\n\0\29\00016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\5\0005\4\4\0=\4\6\3=\3\a\0025\3\18\0005\4\16\0005\5\t\0005\6\b\0=\6\n\0055\6\v\0006\a\0\0'\t\f\0B\a\2\0029\a\r\a=\a\14\6=\6\15\5=\5\17\4=\4\19\3=\3\20\2B\0\2\0015\0\21\0006\1\22\0009\1\23\0019\1\24\1'\3\n\0'\4\25\0006\5\0\0'\a\1\0B\5\2\0029\5\26\5\18\6\0\0B\1\5\0016\1\22\0009\1\23\0019\1\24\1'\3\27\0'\4\28\0006\5\0\0'\a\1\0B\5\2\0029\5\26\5\18\6\0\0B\1\5\1K\0\1\0\15<leader>tr\6x\21motion_translate\15<leader>te\bset\vkeymap\bvim\1\0\3\vsilent\2\fnoremap\2\texpr\2\rcontrols\rmappings\1\0\0\tedit\1\0\0\6i\n<C-a>\27yank_close_translation\23pantran.ui.actions\1\0\1\n<C-y>\1\6n\1\0\0\1\0\2\6j\agj\6k\agk\fengines\vyandex\1\0\0\1\0\2\19default_source\tauto\19default_target\aen\1\0\1\19default_engine\vgoogle\nsetup\fpantran\frequire\0", "config", "pantran.nvim")
time([[Config for pantran.nvim]], false)
-- Config for: focus.nvim
time([[Config for focus.nvim]], true)
try_loadstring("\27LJ\2\nÅ\1\0\1\5\1\6\0\0196\1\0\0009\1\1\1-\3\0\0006\4\0\0009\4\2\0049\4\3\4B\1\3\2\15\0\1\0X\2\5Ä6\1\0\0009\1\4\1+\2\2\0=\2\5\1X\1\4Ä6\1\0\0009\1\4\1+\2\1\0=\2\5\1K\0\1\0\1¿\18focus_disable\6w\fbuftype\abo\17tbl_contains\bvimÇ\1\0\1\5\1\6\0\0196\1\0\0009\1\1\1-\3\0\0006\4\0\0009\4\2\0049\4\3\4B\1\3\2\15\0\1\0X\2\5Ä6\1\0\0009\1\4\1+\2\2\0=\2\5\1X\1\4Ä6\1\0\0009\1\4\1+\2\1\0=\2\5\1K\0\1\0\0¿\18focus_disable\6b\rfiletype\abo\17tbl_contains\bvimâ\3\1\0\b\0\19\0!6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0015\0\3\0005\1\4\0006\2\5\0009\2\6\0029\2\a\2'\4\b\0005\5\t\0B\2\3\0026\3\5\0009\3\6\0039\3\n\3'\5\v\0005\6\f\0=\2\r\0063\a\14\0=\a\15\6B\3\3\0016\3\5\0009\3\6\0039\3\n\3'\5\16\0005\6\17\0=\2\r\0063\a\18\0=\a\15\6B\3\3\0012\0\0ÄK\0\1\0\0\1\0\1\tdesc*Disable focus autoresize for FileType\rFileType\rcallback\0\ngroup\1\0\1\tdesc)Disable focus autoresize for BufType\rWinEnter\24nvim_create_autocmd\1\0\1\nclear\2\17FocusDisable\24nvim_create_augroup\bapi\bvim\1\4\0\0\vnofile\vprompt\npopup\1\2\0\0\rneo-tree\nsetup\nfocus\frequire\0", "config", "focus.nvim")
time([[Config for focus.nvim]], false)
-- Config for: lsp_signature.nvim
time([[Config for lsp_signature.nvim]], true)
try_loadstring("\27LJ\2\n;\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\18lsp_signature\frequire\0", "config", "lsp_signature.nvim")
time([[Config for lsp_signature.nvim]], false)
-- Config for: git-blame.nvim
time([[Config for git-blame.nvim]], true)
try_loadstring('\27LJ\2\n?\0\0\2\0\3\0\0056\0\0\0009\0\1\0)\1\1\0=\1\2\0K\0\1\0"gitblame_display_virtual_text\6g\bvim\0', "config", "git-blame.nvim")
time([[Config for git-blame.nvim]], false)
-- Config for: wilder.nvim
time([[Config for wilder.nvim]], true)
try_loadstring("\27LJ\2\nª\4\0\0\f\0\25\2.6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\0016\0\0\0'\2\1\0B\0\2\0029\1\6\0'\3\a\0004\4\3\0009\5\b\0009\a\t\0B\a\1\0029\b\n\0B\b\1\0A\5\1\0?\5\0\0B\1\3\0019\1\6\0'\3\v\0009\4\f\0009\6\r\0005\b\15\0005\t\14\0=\t\16\b9\t\17\0B\t\1\2=\t\18\b5\t\19\0009\n\20\0B\n\1\0?\n\1\0=\t\21\b5\t\22\0009\n\23\0B\n\1\0?\n\1\0=\t\24\bB\6\2\0A\4\0\0A\1\1\1K\0\1\0\nright\24popupmenu_scrollbar\1\2\0\0\6 \tleft\23popupmenu_devicons\1\2\0\0\6 \16highlighter\22basic_highlighter\15highlights\1\0\2\rpumblend\3\20\vborder\frounded\1\0\1\vborder\vNormal\27popupmenu_border_theme\23popupmenu_renderer\rrenderer\20search_pipeline\21cmdline_pipeline\vbranch\rpipeline\15set_option\nmodes\1\0\4\15accept_key\v<Down>\17previous_key\n<C-p>\rnext_key\n<C-n>\15reject_key\t<Up>\1\4\0\0\6:\6/\6?\nsetup\vwilder\frequire\3ÄÄ¿ô\4\5ÄÄ¿ô\4\0", "config", "wilder.nvim")
time([[Config for wilder.nvim]], false)
-- Config for: vim-test
time([[Config for vim-test]], true)
try_loadstring("\27LJ\2\nú\1\0\0\2\0\a\0\r6\0\0\0009\0\1\0'\1\3\0=\1\2\0006\0\0\0009\0\1\0)\1\1\0=\1\4\0006\0\0\0009\0\1\0'\1\6\0=\1\5\0K\0\1\0\21php artisan test test#php#phpunit#executable\29test#neovim#start_normal\vneovim\18test#strategy\6g\bvim\0", "config", "vim-test")
time([[Config for vim-test]], false)
-- Config for: nvim-bqf
time([[Config for nvim-bqf]], true)
try_loadstring("\27LJ\2\nn\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\rfunc_map\1\0\0\1\0\2\16pscrolldown\n<C-d>\14pscrollup\n<C-u>\nsetup\bbqf\frequire\0", "config", "nvim-bqf")
time([[Config for nvim-bqf]], false)
-- Config for: prettier.nvim
time([[Config for prettier.nvim]], true)
try_loadstring("\27LJ\2\n§\4\0\0\4\0\b\0\v6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\2B\0\2\1K\0\1\0\16cli_options\1\0\17\tsemi\2\16quote_props\14as-needed\15prose_wrap\rpreserve\16print_width\3P\21jsx_single_quote\1 html_whitespace_sensitivity\bcss\16end_of_line\alf!embedded_language_formatting\tauto\22bracket_same_line\1\20bracket_spacing\2\17arrow_parens\valways vue_indent_script_and_style\1\ruse_tabs\1\19trailing_comma\bes5\14tab_width\3\2\17single_quote\1\30single_attribute_per_line\1\14filetypes\1\r\0\0\bcss\fgraphql\thtml\15javascript\20javascriptreact\tjson\tless\rmarkdown\tscss\15typescript\20typescriptreact\tyaml\1\0\1\bbin\14prettierd\nsetup\rprettier\frequire\0", "config", "prettier.nvim")
time([[Config for prettier.nvim]], false)
-- Config for: nvim-spectre
time([[Config for nvim-spectre]], true)
try_loadstring("\27LJ\2\nâ\4\0\0\6\0\19\0&6\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\n\0'\4\v\0005\5\f\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\r\0'\4\14\0005\5\15\0B\0\5\0016\0\3\0009\0\4\0009\0\5\0'\2\6\0'\3\16\0'\4\17\0005\5\18\0B\0\5\1K\0\1\0\1\0\2\fnoremap\2\vsilent\0026viw:lua require('spectre').open_file_search()<CR>\15<leader>sp\1\0\2\fnoremap\2\vsilent\0023<esc>:lua require('spectre').open_visual()<CR>\14<leader>s\1\0\2\fnoremap\2\vsilent\2@<cmd>lua require('spectre').open_visual({select_word=true})\15<leader>sw\1\0\2\fnoremap\2\vsilent\2'<cmd>lua require('spectre').open()\14<leader>S\6n\20nvim_set_keymap\bapi\bvim\nsetup\fspectre\frequire\0", "config", "nvim-spectre")
time([[Config for nvim-spectre]], false)
-- Config for: lspsaga.nvim
time([[Config for lspsaga.nvim]], true)
try_loadstring("\27LJ\2\nÖ\14\0\0\a\0002\0á\0016\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\3\0005\3\4\0=\3\5\0025\3\6\0=\3\a\0025\3\b\0=\3\t\0025\3\n\0=\3\v\0024\3\0\0=\3\f\2B\0\2\0015\0\r\0006\1\0\0'\3\1\0B\1\2\0029\1\14\1B\1\1\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\19\0'\5\20\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\21\0'\5\22\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\0015\3\23\0'\4\24\0'\5\25\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\26\0'\5\27\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\28\0'\4\29\0'\5\30\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4\31\0'\5 \0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4!\0'\5\"\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4#\0'\5$\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4%\0'\5&\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4'\0'\5(\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\0015\3)\0'\4*\0'\5+\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4,\0'\5-\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\4.\0'\5/\0\18\6\0\0B\1\5\0016\1\15\0009\1\16\0019\1\17\1'\3\18\0'\0040\0'\0051\0\18\6\0\0B\1\5\1K\0\1\0E<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>\n<C-f>F<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>\n<C-b>\31<cmd>Lspsaga optutline<cr>\ago!<cmd>Lspsaga term_toggle<cr>\n<A-d>\1\3\0\0\6n\6t*<cmd>Lspsaga diagnostic_jump_prev<cr>\a]e*<cmd>Lspsaga diagnostic_jump_next<cr>\a[e-<cmd>Lspsaga show_cursor_diagnostics<cr>\15<leader>cd+<cmd>Lspsaga show_line_diagnostics<cr>\age\31<cmd>Lspsaga hover_doc<cr>\6K(:<c-u>Lspsaga range_code_action<cr>\6M\6x\28<cmd>Lspsaga rename<cr>\agr!<cmd>Lspsaga code_action<cr>\aga\1\3\0\0\6n\6v <cmd>Lspsaga lsp_finder<cr>\agh%<cmd>Lspsaga peek_definition<cr>\agp\6n\bset\vkeymap\bvim\18init_lsp_saga\1\0\2\vsilent\2\fnoremap\2\24server_filetype_map\23rename_action_keys\1\0\2\texec\t<CR>\tquit\n<C-c>\21code_action_keys\1\0\2\texec\t<CR>\tquit\6q\23finder_action_keys\1\0\6\topen\6o\vvsplit\6s\nsplit\6i\14scroll_up\n<C-b>\16scroll_down\n<C-f>\tquit\6q\23code_action_prompt\1\0\4\17virtual_text\2\venable\2\18sign_priority\3(\tsign\2\1\0\15\ndebug\1\21code_action_icon\tÔ†¥ \17border_style\vsingle\27diagnostic_header_icon\v ÔÜà  \25rename_prompt_prefix\b‚û§\15infor_sign\bÔëâ\14hint_sign\bÔ†µ\29diagnostic_prefix_format\t%d. \14warn_sign\bÔî©\15error_sign\bÔôô\29use_saga_diagnostic_sign\2\28definition_preview_icon\nÔî∏  \22max_preview_lines\3\n\26finder_reference_icon\nÔåë  \27finder_definition_icon\nÔåë  \nsetup\flspsaga\frequire\0", "config", "lspsaga.nvim")
time([[Config for lspsaga.nvim]], false)
-- Config for: nvim-lightbulb
time([[Config for nvim-lightbulb]], true)
try_loadstring("\27LJ\2\n_\0\0\4\0\6\0\t6\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\2B\0\2\1K\0\1\0\fautocmd\1\0\0\1\0\1\fenabled\2\nsetup\19nvim-lightbulb\frequire\0", "config", "nvim-lightbulb")
time([[Config for nvim-lightbulb]], false)
-- Load plugins in order defined by `after`
time([[Sequenced loading]], true)
vim.cmd [[ packadd rainbow-delimiters.nvim ]]
vim.cmd [[ packadd nvim-ts-context-commentstring ]]
vim.cmd [[ packadd nvim-tree-docs ]]
vim.cmd [[ packadd hlargs.nvim ]]

-- Config for: hlargs.nvim
try_loadstring("\27LJ\2\n4\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\vhlargs\frequire\0", "config", "hlargs.nvim")

vim.cmd [[ packadd treesitter-unit ]]

-- Config for: treesitter-unit
try_loadstring("\27LJ\2\nı\3\0\0\6\0\18\00016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\a\0'\4\b\0005\5\t\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\4\0'\4\v\0005\5\f\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\a\0'\4\r\0005\5\14\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\15\0'\4\5\0005\5\16\0B\0\5\0016\0\0\0009\0\1\0009\0\2\0'\2\n\0'\3\15\0'\4\v\0005\5\17\0B\0\5\1K\0\1\0\1\0\1\fnoremap\2\1\0\1\fnoremap\2\6/\1\0\1\fnoremap\0028:<c-u>lua require\"treesitter-unit\".select(true)<CR>\1\0\1\fnoremap\0024:<c-u>lua require\"treesitter-unit\".select()<CR>\6o\1\0\1\fnoremap\0023:lua require\"treesitter-unit\".select(true)<CR>\aau\1\0\1\fnoremap\2/:lua require\"treesitter-unit\".select()<CR>\aiu\6x\20nvim_set_keymap\bapi\bvim\0", "config", "treesitter-unit")

vim.cmd [[ packadd nvim-ts-autotag ]]

-- Config for: nvim-ts-autotag
try_loadstring("\27LJ\2\n=\0\0\3\0\3\0\0066\0\0\0'\2\1\0B\0\2\0029\0\2\0B\0\1\1K\0\1\0\nsetup\20nvim-ts-autotag\frequire\0", "config", "nvim-ts-autotag")

vim.cmd [[ packadd nvim-treesitter-refactor ]]
vim.cmd [[ packadd nvim_context_vt ]]
vim.cmd [[ packadd nvim-lsp-smag ]]
vim.cmd [[ packadd sqlite.lua ]]
time([[Sequenced loading]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.api.nvim_create_user_command, 'Artisan', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Artisan', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Artisan ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'SidebarNvimToggle', function(cmdargs)
          require('packer.load')({'sidebar.nvim'}, { cmd = 'SidebarNvimToggle', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'sidebar.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('SidebarNvimToggle ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Npm', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Npm', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Npm ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Yarn', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Yarn', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Yarn ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Laravel', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Laravel', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Laravel ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Mason', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'Mason', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Mason ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonInstall', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonInstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonInstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonInstallAll', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonInstallAll', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonInstallAll ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUninstall', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUninstall', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUninstall ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonUninstallAll', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonUninstallAll', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonUninstallAll ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'MasonLog', function(cmdargs)
          require('packer.load')({'mason.nvim'}, { cmd = 'MasonLog', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'mason.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('MasonLog ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neogit', function(cmdargs)
          require('packer.load')({'neogit'}, { cmd = 'Neogit', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neogit'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neogit ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Neotree', function(cmdargs)
          require('packer.load')({'neo-tree.nvim'}, { cmd = 'Neotree', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'neo-tree.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Neotree ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'TSContextEnable', function(cmdargs)
          require('packer.load')({'nvim-treesitter-context'}, { cmd = 'TSContextEnable', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'nvim-treesitter-context'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('TSContextEnable ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Telescope', function(cmdargs)
          require('packer.load')({'telescope.nvim'}, { cmd = 'Telescope', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'telescope.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Telescope ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Composer', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Composer', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Composer ', 'cmdline')
      end})
pcall(vim.api.nvim_create_user_command, 'Sail', function(cmdargs)
          require('packer.load')({'laravel.nvim'}, { cmd = 'Sail', l1 = cmdargs.line1, l2 = cmdargs.line2, bang = cmdargs.bang, args = cmdargs.args, mods = cmdargs.mods }, _G.packer_plugins)
        end,
        {nargs = '*', range = true, bang = true, complete = function()
          require('packer.load')({'laravel.nvim'}, {}, _G.packer_plugins)
          return vim.fn.getcompletion('Sail ', 'cmdline')
      end})
time([[Defining lazy-load commands]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'markdown-preview.nvim'}, { ft = "markdown" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'legendary.nvim', 'toggleterm.nvim', 'modes.nvim', 'Comment.nvim', 'nvim-colorizer.lua', 'vim-asterisk', 'vim-illuminate', 'nvim-hlslens', 'which-key.nvim', 'LuaSnip', 'nvim-autopairs', 'gitsigns.nvim', 'nvim-window-picker'}, { event = "VimEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
