let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/designsystem
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +34 src/components/SearchBoxBase/SearchBoxBase.vue
badd +61 src/components/SearchBoxBase/SearchBoxBase.scss
badd +114 src/components/SearchBoxBase/SearchBoxBase.stories.js
badd +1 src/components/icons/IconHotels.vue
badd +15 src/components/SearchBoxBase/Mockups/CorpoContainerSlot.vue
badd +31 changelog.md
badd +28 src/components/Calendar/Calendar.vue
badd +194 src/components/Calendar/Calendar.scss
badd +52 node_modules/v-calendar/dist/types/src/components/DatePicker/DatePicker.vue.d.ts
badd +22 src/components/Calendar/Calendar.stories.js
badd +47 src/scss/_new_variables.scss
argglobal
%argdel
$argadd ./
edit src/components/Calendar/Calendar.vue
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
1wincmd h
wincmd w
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
wincmd =
argglobal
balt src/scss/_new_variables.scss
let s:l = 26 - ((17 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 26
normal! 039|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/Calendar/Calendar.scss", ":p")) | buffer src/components/Calendar/Calendar.scss | else | edit src/components/Calendar/Calendar.scss | endif
if &buftype ==# 'terminal'
  silent file src/components/Calendar/Calendar.scss
endif
balt src/components/Calendar/Calendar.stories.js
let s:l = 287 - ((29 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 287
normal! 016|
wincmd w
2wincmd w
wincmd =
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let &winminheight = s:save_winminheight
let &winminwidth = s:save_winminwidth
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
