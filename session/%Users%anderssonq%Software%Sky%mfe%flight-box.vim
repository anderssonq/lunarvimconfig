let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/mfe/flight-box
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +17 src/routes/routes.js
badd +31 ~/Software/Sky/mfe/flight-box/src/views/CardStretch.vue
badd +4 src/views/FlightBox.vue
badd +1 src/constants/SearchFlight.js
badd +1 ~/Software/Sky/mfe/flight-box/src/components/organisms/CardStretchSearch.vue
badd +4 ~/Software/Sky/mfe/flight-box/src/components/organisms/SearchBoxBase.vue
badd +61 src/components/organisms/tabs/SearchFlight.vue
badd +6 package.json
badd +25 src/components/molecules/SearchBoxOriginDestination.vue
badd +637 src/components/organisms/tabs/SearchFlightCardStretch.vue
badd +23 src/components/atoms/TextField.vue
badd +15 src/components/molecules/CalendarDate.vue
badd +55 src/services/airports_routes.js
argglobal
%argdel
$argadd ./
edit package.json
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
balt src/components/molecules/SearchBoxOriginDestination.vue
let s:l = 6 - ((5 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 037|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/organisms/tabs/SearchFlight.vue", ":p")) | buffer src/components/organisms/tabs/SearchFlight.vue | else | edit src/components/organisms/tabs/SearchFlight.vue | endif
if &buftype ==# 'terminal'
  silent file src/components/organisms/tabs/SearchFlight.vue
endif
balt package.json
let s:l = 61 - ((11 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 61
normal! 0
wincmd w
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
