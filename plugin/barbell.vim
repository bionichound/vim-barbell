" Title:        Vim Barbell
" Description:  Everyone knows the best curls are BARBELL CURLS! Vim Barbell
" simplifies making cURL requests
" Last Change:  17 May 2022
" Maintainer:   Bionichound <https://github.com/bionichound>

if exists("g:loaded_barbell")
    finish
endif
let g:loaded_barbell = 1

" Exposes the plugin's functions for use as commands in Vim.
" command! -nargs=0 PostJson call barbell#PostJson()
command! -range PostJson <line1>,<line2>call barbell#PostJson()

