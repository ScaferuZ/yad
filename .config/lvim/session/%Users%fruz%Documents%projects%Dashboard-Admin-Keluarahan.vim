let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/projects/Dashboard-Admin-Keluarahan
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +10 src/App.tsx
badd +15 src/routes/routes.tsx
badd +12 src/routes/Auth.route.tsx
badd +52 src/routes/Private.route.tsx
badd +1 src/pages/Dashboard/index.ts
badd +52 src/pages/Dashboard/Dashboard.tsx
badd +56 src/components/layout/CommonLayout/CommonLayout.tsx
badd +34 src/provider/AuthProvider.tsx
badd +5 src/main.tsx
badd +1 src/components/templates/UserDropdown/UserDropdown.tsx
badd +1 src/components/elements/Card/Card.tsx
badd +4 src/components/templates/InfoCard/InfoCard.tsx
badd +137 src/pages/DataPengajuan/DataPengajuan.tsx
badd +14 src/pages/DataPengajuan/constant.ts
badd +1 src/pages/DataPengajuan/columnConfig.tsx
badd +195 src/pages/DataRTRW/DataRTRW.tsx
badd +33 ~/Documents/projects/Dashboard-Admin-Keluarahan/src/components/forms/RegistRTRWForm/RegistRTRWForm.tsx
badd +8 ~/Documents/projects/Dashboard-Admin-Keluarahan/src/components/elements/Modal/Modal.tsx
badd +29 ~/Documents/projects/Dashboard-Admin-Keluarahan/src/components/forms/RegistRTRWForm/schema.ts
argglobal
%argdel
$argadd .
edit ~/Documents/projects/Dashboard-Admin-Keluarahan/src/components/forms/RegistRTRWForm/RegistRTRWForm.tsx
argglobal
balt ~/Documents/projects/Dashboard-Admin-Keluarahan/src/components/elements/Modal/Modal.tsx
let s:l = 59 - ((13 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 59
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
