let SessionLoad = 1
let s:so_save = &g:so | let s:siso_save = &g:siso | setg so=0 siso=0 | setl so=-1 siso=-1
let v:this_session=expand("<sfile>:p")
silent only
silent tabonly
cd ~/.config/nvim
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
let s:shortmess_save = &shortmess
if &shortmess =~ 'A'
  set shortmess=aoOA
else
  set shortmess=aoO
endif
badd +40 lua/config/plugins.lua
badd +1 lua/plugins/dashboard.lua
argglobal
%argdel
edit lua/config/plugins.lua
argglobal
balt lua/plugins/dashboard.lua
setlocal fdm=indent
setlocal fde=0
setlocal fmr={{{,}}}
setlocal fdi=#
setlocal fdl=99
setlocal fml=1
setlocal fdn=20
setlocal fen
2
normal! zo
4
normal! zo
19
normal! zo
27
normal! zo
39
normal! zo
47
normal! zo
55
normal! zo
65
normal! zo
72
normal! zo
80
normal! zo
99
normal! zo
106
normal! zo
113
normal! zo
120
normal! zo
127
normal! zo
133
normal! zo
41
normal! zo
49
normal! zo
57
normal! zo
67
normal! zo
74
normal! zo
82
normal! zo
101
normal! zo
108
normal! zo
115
normal! zo
126
normal! zo
132
normal! zo
let s:l = 40 - ((36 * winheight(0) + 22) / 45)
if s:l < 1 | let s:l = 1 | endif
keepjumps exe s:l
normal! zt
keepjumps 40
normal! 016|
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
