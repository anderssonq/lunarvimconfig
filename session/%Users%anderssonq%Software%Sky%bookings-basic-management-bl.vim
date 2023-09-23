let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Software/Sky/bookings-basic-management-bl
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +94 src/microservice/application-core/booking/utils/handler-taxes-inhibition-booking.ts
badd +29 src/microservice/user-interface/controllers/booking.controller.ts
badd +35 src/microservice/application-core/booking/uses-cases/create-booking.interactor.ts
badd +25 src/microservice/infraestructure/cache-manager/gateways/cache.gateway.ts
badd +24 src/microservice/application-core/booking/uses-cases/get-cnx-rules-cache.interactor.ts
badd +34 src/microservice/infraestructure/microservice-clients/http/airport-route.client.ts
badd +33 src/microservice/infraestructure/microservice-clients/http/bookings-management-publisher-ms.client.ts
badd +44 src/test/infraestrucure/message-broker/amqp.intances.spec.ts
badd +149 src/test/infraestrucure/microservice-clients/http/booking-ms.client.spec.ts
badd +19 src/test/infraestrucure/message-broker/uses-cases/create-booking-mq.interactor.spec.ts
badd +0 changelog.md
badd +0 package.json
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
exe 'vert 1resize ' . ((&columns * 226 + 126) / 252)
exe 'vert 2resize ' . ((&columns * 25 + 126) / 252)
argglobal
balt src/microservice/infraestructure/cache-manager/gateways/cache.gateway.ts
let s:l = 39 - ((33 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 39
normal! 06|
wincmd w
argglobal
if bufexists(fnamemodify("changelog.md", ":p")) | buffer changelog.md | else | edit changelog.md | endif
if &buftype ==# 'terminal'
  silent file changelog.md
endif
balt src/microservice/application-core/booking/uses-cases/get-cnx-rules-cache.interactor.ts
let s:l = 22 - ((21 * winheight(0) + 21) / 42)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 22
normal! 027|
wincmd w
exe 'vert 1resize ' . ((&columns * 226 + 126) / 252)
exe 'vert 2resize ' . ((&columns * 25 + 126) / 252)
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
