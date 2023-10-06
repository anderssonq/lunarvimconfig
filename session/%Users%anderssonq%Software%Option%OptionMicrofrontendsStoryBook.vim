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
badd +3 src/components/atoms/Button/button.css
badd +4 src/main.js
badd +1 src/components/button.css
badd +35 src/App.vue
badd +4 src/index.js
badd +1 src/components/atoms/Card/Card.vue
badd +6 src/components/atoms/TextField/TextField.vue
badd +1 src/assets/main.scss
badd +1 \[Command\ Line]
badd +33 src/components/atoms/Button/Button.vue
badd +24 src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue
badd +8 src/components/atoms/Select/Select.vue
badd +13 ~/Software/Sky/mfe/flight-box/src/components/molecules/SearchBoxOriginDestination.vue
badd +519 ~/Software/Sky/mfe/flight-box/src/components/organisms/tabs/SearchFlight.vue
badd +78 ~/Software/Sky/mfe/flight-box/src/components/organisms/tabs/SearchFlightCardStretch.vue
badd +13 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.stories.js
badd +9 ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Select/Select.stories.js
argglobal
%argdel
$argadd .eslintrc.js
edit ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/TextField/TextField.stories.js
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
wincmd =
argglobal
balt ~/Software/Option/OptionMicrofrontendsStoryBook/src/components/atoms/Select/Select.stories.js
let s:l = 15 - ((14 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 15
normal! 02|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/atoms/Select/Select.vue", ":p")) | buffer src/components/atoms/Select/Select.vue | else | edit src/components/atoms/Select/Select.vue | endif
if &buftype ==# 'terminal'
  silent file src/components/atoms/Select/Select.vue
endif
balt ~/Software/Sky/mfe/flight-box/src/components/molecules/SearchBoxOriginDestination.vue
let s:l = 25 - ((24 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 25
normal! 018|
wincmd w
argglobal
if bufexists(fnamemodify("src/components/atoms/TextField/TextField.vue", ":p")) | buffer src/components/atoms/TextField/TextField.vue | else | edit src/components/atoms/TextField/TextField.vue | endif
if &buftype ==# 'terminal'
  silent file src/components/atoms/TextField/TextField.vue
endif
balt src/components/molecules/TextFieldWithLabel/TextFieldWithLabel.vue
let s:l = 6 - ((5 * winheight(0) + 24) / 48)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 6
normal! 0
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
