" ==========================================================
" Define hfvim user settings before sourcing hfvimrc
" ==========================================================
let g:hfvim_settings = {}
let g:hfvim_settings.expected_major_version = 1
"let g:hfvim_settings.bundle_groups_excluded = []
let g:hfvim_settings.bundle_groups_included = ['cpp', 'actionscript', 'haxe', 'javascript', 'python']
let g:hfvim_settings.disabled_bundles = []

" when training_mode is 1, certain mappings will be disabled and a more optimal alternative will be suggested
" through an echo statement. For example, training mode will disable arrow keys for cursor movement and remind
" you to use h,j,k,l
" let g:hfvim_settings.training_mode = 1
"
" ==========================================================
" Source hfvim to initialize the distribution
" ==========================================================
so ~/.vim.new/hfvim/hfvimrc.vim

" if has('gui_running')
"     set guifont=Inconsolata\ for\ Powerline:h14
" endif
