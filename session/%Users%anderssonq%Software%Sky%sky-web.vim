let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/sky-web
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +123 ~/Software/Sky/sky-web/src/App.vue
badd +80 ~/Software/Sky/sky-web/src/main.js
badd +1 ~/Software/Sky/sky-web/src/services/homeMarket.js
badd +33 src/api/request/flights.js
badd +20 src/services/formattedDataLayer.js
badd +681 src/views/SelectFlight.vue
badd +0 src/components/FlightsList.vue
argglobal
%argdel
$argadd ./
edit src/views/SelectFlight.vue
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
exe 'vert 1resize ' . ((&columns * 120 + 120) / 241)
exe 'vert 2resize ' . ((&columns * 120 + 120) / 241)
argglobal
balt src/services/formattedDataLayer.js
let s:l = 687 - ((31 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 687
normal! 033|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/FlightsList.vue", ":p")) | buffer src/components/FlightsList.vue | else | edit src/components/FlightsList.vue | endif
if &buftype ==# 'terminal'
  silent file src/components/FlightsList.vue
endif
balt src/views/SelectFlight.vue
let s:l = 472 - ((21 * winheight(0) + 24) / 49)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 472
normal! 022|
wincmd w
exe 'vert 1resize ' . ((&columns * 120 + 120) / 241)
exe 'vert 2resize ' . ((&columns * 120 + 120) / 241)
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
