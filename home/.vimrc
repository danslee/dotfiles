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
 
set cpoptions-=u
set expandtab
set gfn=Consolas:h13
set ic scs            
set smartcase ignorecase
set spell spelllang=en_us
set ts=2 sw=2
set vb
