let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/mfe/initial-sale
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 src/index.ejs
badd +31 webpack.config.js
badd +1 .env.local
badd +28 package.json
badd +1 ~/.local/state/lvim/lsp.log
badd +1 .env
badd +65 .gitignore
badd +11 .env.qa
badd +10 src/skyairline-root-config.js
argglobal
%argdel
$argadd ./
edit .env.qa
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
exe 'vert 1resize ' . ((&columns * 129 + 130) / 260)
exe 'vert 2resize ' . ((&columns * 130 + 130) / 260)
argglobal
balt src/index.ejs
let s:l = 10 - ((9 * winheight(0) + 27) / 54)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 10
normal! 0
wincmd w
argglobal
if bufexists(fnamemodify("src/index.ejs", ":p")) | buffer src/index.ejs | else | edit src/index.ejs | endif
if &buftype ==# 'terminal'
  silent file src/index.ejs
endif
balt webpack.config.js
let s:l = 85 - ((24 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 85
normal! 012|
wincmd w
2wincmd w
exe 'vert 1resize ' . ((&columns * 129 + 130) / 260)
exe 'vert 2resize ' . ((&columns * 130 + 130) / 260)
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
