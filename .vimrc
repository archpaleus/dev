set nocompatible
set showcmd
set ruler
set nowrap
set laststatus=2
set noexpandtab
set shiftwidth=2
set tabstop=8
set list
set listchars=eol:\ ,tab:»\ «,trail:·,extends:▷,precedes:◁

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

:set colorcolumn=100
:hi ColorColumn ctermbg=239 guibg=blue

syntax on

