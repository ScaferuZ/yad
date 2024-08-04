let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/projects/little-steps-frontend
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +41 src/screens/onboarding-screen/index.tsx
badd +1 src/screens/onboarding-screen/items.tsx
badd +1 ~/Documents/projects/little-steps-frontend/src/screens/onboarding-screen/NextButton.tsx
badd +1 ~/Documents/projects/little-steps-frontend/src/screens/onboarding-screen/paginator.tsx
badd +1 ~/Documents/projects/little-steps-frontend/src/screens/onboarding-screen/slides.ts
badd +9 src/store/useOnboardingStroe.ts
badd +28 ~/Documents/projects/little-steps-frontend/src/screens/sign-in-screen/index.tsx
badd +19 ~/Documents/projects/little-steps-frontend/src/components/shared/input.tsx
argglobal
%argdel
$argadd .
edit ~/Documents/projects/little-steps-frontend/src/screens/sign-in-screen/index.tsx
argglobal
balt ~/Documents/projects/little-steps-frontend/src/components/shared/input.tsx
let s:l = 37 - ((29 * winheight(0) + 26) / 53)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 37
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
