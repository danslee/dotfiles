" using pathogen
"execute pathogen#infect()
"#filetype plugin indent on

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" Solarize me!
syntax on

try
  set background=dark
  colorscheme solarized
catch /E185:/
  colorscheme default
endtry

if exists('g:colors_name') && g:colors_name == 'solarized'
  " Text is unreadable with background transparency.
  if has('gui_macvim')
    set transparency=0
  endif
  " Highlighted text is unreadable in Terminal.app because it
  "     " does not support setting of the cursor foreground color.
  if !has('gui_running') && $TERM_PROGRAM == 'Apple_Terminal'
    let g:solarized_termcolors = &t_Co
    let g:solarized_termtrans = 1
    colorscheme solarized
  endif
  "call togglebg#map("<F2>")
endif

" indent-unindent
"nmap >> <Nop>
"nmap << <Nop>
"vmap >> <Nop>
"vmap << <Nop>

nnoremap <Tab>   >>
nnoremap <S-Tab> <<
vnoremap <Tab>   >><Esc>gv
vnoremap <S-Tab> <<<Esc>gv
inoremap <Tab>   <Esc>>>A
inoremap <S-Tab> <Esc><<A

"run q mapped macros simply
nnoremap Q @q

set cpoptions-=u
set expandtab
set gfn=Fira\ Code:h16
set ic scs            
set smartcase ignorecase
set spell spelllang=en_us
set ts=4 sw=4
set vb
