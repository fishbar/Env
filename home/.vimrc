set nu
set ru
set list
set autoindent
set listchars=tab:»»
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif