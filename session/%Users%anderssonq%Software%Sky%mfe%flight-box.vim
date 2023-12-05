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
badd +1 ~/Software/Sky/mfe/flight-box/vue.config.js
badd +1 ~/Software/Sky/mfe/flight-box/Dockerfile
badd +5 ~/Software/Sky/mfe/flight-box/.env.local
badd +1 ~/Software/Sky/mfe/flight-box/.env.production
badd +1 ~/Software/Sky/mfe/flight-box/.env.stage
badd +1 ~/Software/Sky/mfe/flight-box/.env.standalone
badd +6 ~/Software/Sky/mfe/flight-box/package.json
badd +2 ~/Software/Sky/mfe/flight-box/.env.qa
argglobal
%argdel
$argadd ./
edit ~/Software/Sky/mfe/flight-box/vue.config.js
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
balt ~/Software/Sky/mfe/flight-box/.env.standalone
let s:l = 19 - ((18 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 19
normal! 049|
wincmd w
argglobal
if bufexists(fnamemodify("~/Software/Sky/mfe/flight-box/package.json", ":p")) | buffer ~/Software/Sky/mfe/flight-box/package.json | else | edit ~/Software/Sky/mfe/flight-box/package.json | endif
if &buftype ==# 'terminal'
  silent file ~/Software/Sky/mfe/flight-box/package.json
endif
balt ~/Software/Sky/mfe/flight-box/.env.local
let s:l = 6 - ((5 * winheight(0) + 19) / 38)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 01|
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
