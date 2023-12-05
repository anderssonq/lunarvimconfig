let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/fare-quote-ms
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +27 ~/Software/Sky/fare-quote-ms/src/microservice/app.module.ts
badd +203 ~/Software/Sky/fare-quote-ms/src/microservice/application-core/dto-module/cheapest-fare-by-seg-date-dto/cheapest-fare-by-seg-date-dto.service.ts
badd +29 ~/Software/Sky/fare-quote-ms/src/microservice/application-core/application-core.module.ts
badd +4 ~/Software/Sky/fare-quote-ms/src/microservice/user-interface/controllers/fare-shop.controller.ts
badd +13 ~/Software/Sky/fare-quote-ms/src/microservice/application-core/cheapest-fare-by-seg-date/cheapest-fare-by-seg-date.interactor.ts
argglobal
%argdel
$argadd ./
edit ~/Software/Sky/fare-quote-ms/src/microservice/application-core/application-core.module.ts
argglobal
balt ~/Software/Sky/fare-quote-ms/src/microservice/application-core/dto-module/cheapest-fare-by-seg-date-dto/cheapest-fare-by-seg-date-dto.service.ts
let s:l = 12 - ((11 * winheight(0) + 33) / 66)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 12
normal! 0
tabnext 1
if exists('s:wipebuf') && len(win_findbuf(s:wipebuf)) == 0 && getbufvar(s:wipebuf, '&buftype') isnot# 'terminal'
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20
let &shortmess = s:shortmess_save
let s:sx = expand("<sfile>:p:r")."x.vim"
if filereadable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &g:so = s:so_save | let &g:siso = s:siso_save
set hlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
