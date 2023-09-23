let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Option/OptionMicrofrontendsStoryBook
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +15 package.json
badd +1 index.html
badd +13 .eslintrc.js
badd +1 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css
badd +29 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/Button.vue
badd +9 src/assets/base.css
badd +9 ~/Software/Option/OptionMicrofrontendsStoryBook/tailwind.config.js
badd +1 ~/Software/Option/OptionMicrofrontendsStoryBook/src/main.js
badd +17 ~/Software/Option/OptionMicrofrontendsStoryBook/src/assets/main.css
badd +3 ~/Software/Option/OptionMicrofrontendsStoryBook/src/style.css
badd +6 ~/Software/Option/OptionMicrofrontendsStoryBook/postcss.config.js
badd +24 ~/Software/Option/OptionMicrofrontendsStoryBook/vite.config.js
argglobal
%argdel
$argadd .eslintrc.js
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
balt ~/Software/Option/OptionMicrofrontendsStoryBook/postcss.config.js
let s:l = 3 - ((2 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 3
normal! 020|
wincmd w
argglobal
if bufexists(fnamemodify("~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css", ":p")) | buffer ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css | else | edit ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css | endif
if &buftype ==# 'terminal'
  silent file ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css
endif
balt ~/Software/Option/OptionMicrofrontendsStoryBook/tailwind.config.js
let s:l = 20 - ((19 * winheight(0) + 21) / 43)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 033|
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
