let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/projects/expo-router-auth
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +1 app/login.tsx
badd +9 app/(auth)/(tabs)/index.tsx
badd +2 app/ctx.tsx
badd +22 app/_layout.tsx
badd +33 app/useStorageState.ts
badd +2 components/useClientOnlyValue.ts
badd +1 components/useClientOnlyValue.web.ts
badd +1 app/(auth)/(tabs)/_layout.tsx
badd +19 app/(auth)/_layout.tsx
badd +9 ~/Documents/projects/expo-router-auth/constants/Colors.ts
badd +30 ~/Documents/projects/expo-router-auth/app/+html.tsx
argglobal
%argdel
$argadd .
edit ~/Documents/projects/expo-router-auth/app/+html.tsx
argglobal
balt components/useClientOnlyValue.web.ts
let s:l = 30 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 30
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
nohlsearch
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
