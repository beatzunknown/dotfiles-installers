set number

set expandtab
set autoindent
set softtabstop=4
set shiftwidth=4
set tabstop=4

"Wrap text visually
set textwidth=0
set wrapmargin=0
set wrap
set linebreak " (optional - breaks by word rather than character)

"Enable mouse click for nvim
set mouse=a
"Fix cursor replacement after closing nvim
set guicursor=
"Allow copy/paste from/to system clipboard
set clipboard+=unnamedplus
"Shift + Tab does inverse tab
inoremap <S-Tab> <C-d>

"See invisible characters
set list listchars=tab:>\ ,trail:+,eol:$

"wrap to next line when end of line is reached
set whichwrap+=<,>,[,]

source $HOME/.config/nvim/plugins.vim
source $HOME/.config/nvim/styling.vim

