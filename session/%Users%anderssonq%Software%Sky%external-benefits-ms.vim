let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/external-benefits-ms
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +28 src/microservice/user-interface/controllers/external-benefits.controller.ts
badd +16 ~/Software/Sky/external-benefits-ms/src/microservice/application-core/external-benefits/use-cases/bch/consult-benefits.interactor.ts
badd +42 ~/Software/Sky/external-benefits-ms/src/microservice/infraestructure/microservice-clients/http/apitravel.client.ts
badd +34 ~/Software/Sky/external-benefits-ms/src/microservice/application-core/external-benefits/use-cases/bch/dto/consult-benefits.dto.ts
badd +5 ~/Software/Sky/external-benefits-ms/src/test/data/external-benefits.controller.data.json
badd +1 src/microservice/application-core/external-benefits/use-cases/index.ts
badd +3 src/microservice/infraestructure/microservice-clients/http/dto/report-benefits.dto.ts
badd +28 src/microservice/infraestructure/microservice-clients/http/utils/transform-data/index.ts
argglobal
%argdel
$argadd ./
edit ~/Software/Sky/external-benefits-ms/src/test/data/external-benefits.controller.data.json
let s:save_splitbelow = &splitbelow
let s:save_splitright = &splitright
set splitbelow splitright
let &splitbelow = s:save_splitbelow
let &splitright = s:save_splitright
wincmd t
let s:save_winminheight = &winminheight
let s:save_winminwidth = &winminwidth
set winminheight=0
set winheight=1
set winminwidth=0
set winwidth=1
argglobal
balt src/microservice/infraestructure/microservice-clients/http/utils/transform-data/index.ts
let s:l = 5 - ((4 * winheight(0) + 30) / 61)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 5
normal! 014|
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
