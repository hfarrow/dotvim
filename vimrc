" ==========================================================
" Define hfvim user settings before sourcing hfvimrc
" ==========================================================
" hfvim config {{{
    let g:hfvim_settings = {}
    let g:hfvim_settings.expected_major_version = 0
    "let g:hfvim_settings.plugin_groups_excluded = []
    let g:hfvim_settings.plugin_groups_included = []
    let g:hfvim_settings.disabled_plugins = []

    " not supported yet
    " let g:hfvim_settings.user_plugins = []

    " ==========================================================
    " Source hfvim to initialize the distrobution
    " ==========================================================
    so ~/.vim/hfvimrc
" }}}

" ==========================================================
" User config below here
" ==========================================================
