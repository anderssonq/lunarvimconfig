let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Option/OptionMicroFrontends
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +7 ~/Software/Option/OptionMicroFrontends/src/App.vue
badd +10 ~/Software/Option/OptionMicroFrontends/src/views/HomeView.vue
badd +17 package.json
badd +2 ~/Software/Option/OptionMicroFrontends/src/main.js
argglobal
%argdel
$argadd ./
edit ~/Software/Option/OptionMicroFrontends/src/views/HomeView.vue
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
exe 'vert 1resize ' . ((&columns * 115 + 116) / 232)
exe 'vert 2resize ' . ((&columns * 116 + 116) / 232)
argglobal
balt ~/Software/Option/OptionMicroFrontends/src/App.vue
let s:l = 12 - ((11 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 011|
wincmd w
argglobal
if bufexists(fnamemodify("package.json", ":p")) | buffer package.json | else | edit package.json | endif
if &buftype ==# 'terminal'
  silent file package.json
endif
balt ~/Software/Option/OptionMicroFrontends/src/main.js
let s:l = 13 - ((12 * winheight(0) + 22) / 44)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 13
normal! 031|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 115 + 116) / 232)
exe 'vert 2resize ' . ((&columns * 116 + 116) / 232)
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