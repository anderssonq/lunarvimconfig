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
badd +14 package.json
badd +1 index.html
badd +13 .eslintrc.js
badd +3 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Button/button.css
badd +4 ~/Software/Option/OptionMicrofrontendsStoryBook/src/main.js
badd +1 src/components/button.css
badd +22 src/App.vue
badd +4 ~/Software/Option/OptionMicrofrontendsStoryBook/src/index.js
badd +1 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Card/Card.vue
badd +1 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue
badd +1 src/assets/main.scss
badd +1 \[Command\ Line]
badd +33 src/components/atoms/Button/Button.vue
badd +22 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue
argglobal
%argdel
$argadd .eslintrc.js
edit src/App.vue
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
wincmd _ | wincmd |
vsplit
wincmd _ | wincmd |
vsplit
2wincmd h
wincmd w
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
exe 'vert 1resize ' . ((&columns * 78 + 117) / 234)
exe 'vert 2resize ' . ((&columns * 77 + 117) / 234)
exe 'vert 3resize ' . ((&columns * 77 + 117) / 234)
argglobal
balt ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue
let s:l = 22 - ((19 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 055|
wincmd w
argglobal
if bufexists(fnamemodify("~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue", ":p")) | buffer ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue | else | edit ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue | endif
if &buftype ==# 'terminal'
  silent file ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue
endif
balt src/components/atoms/Button/Button.vue
let s:l = 20 - ((19 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 20
normal! 032|
wincmd w
argglobal
if bufexists(fnamemodify("~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue", ":p")) | buffer ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue | else | edit ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue | endif
if &buftype ==# 'terminal'
  silent file ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.vue
endif
balt ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue
let s:l = 4 - ((3 * winheight(0) + 25) / 51)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 4
normal! 012|
wincmd w
exe 'vert 1resize ' . ((&columns * 78 + 117) / 234)
exe 'vert 2resize ' . ((&columns * 77 + 117) / 234)
exe 'vert 3resize ' . ((&columns * 77 + 117) / 234)
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
