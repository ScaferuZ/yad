let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/Documents/projects/sagara-student-project/sagara-student
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +62 src/pages/Students/Students.tsx
badd +82 src/pages/Students/columns.tsx
badd +83 src/components/forms/StudentRegisterForm/StudentRegisterForm.tsx
badd +16 src/components/elements/DateRangeSelector/DateRangeSelector.tsx
badd +70 src/components/forms/StudentEditForm/StudentEditForm.tsx
badd +1 src/components/layouts/PublicLayout/PublicLayout.tsx
badd +39 src/components/ui/sheet.tsx
badd +70 src/components/ui/calendar.tsx
badd +8 src/components/ui/chart.tsx
badd +17 src/pages/Redirect/Redirect.tsx
badd +13 ~/Documents/projects/sagara-student-project/sagara-student/src/routes/PublicRoutes.tsx
badd +180 src/components/ui/use-toast.ts
badd +30 ~/Documents/projects/sagara-student-project/sagara-student/src/components/ui/toast.tsx
argglobal
%argdel
$argadd .
edit src/components/forms/StudentEditForm/StudentEditForm.tsx
argglobal
balt src/components/forms/StudentRegisterForm/StudentRegisterForm.tsx
let s:l = 70 - ((19 * winheight(0) + 19) / 39)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 70
normal! 07|
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
