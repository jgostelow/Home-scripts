syntax on
set bg=dark

"--------------------------------------------------
" This handles fancy Control-J and Control-K options to change windows when you
" have multiple windows open (vim -o <file1> <file2>)
"--------------------------------------------------
map <C-J> <C-W>j<C-W>_
map <C-K> <C-W>k<C-W>_
map <C-c> :tabnext<CR>
map <C-x> :tabprevious<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
set wmh=0
set tabstop=4
set smartindent  " nosi:  Smart indent useless when C-indent is on
set shiftwidth=4  " sw:  a healthy tab stop
set textwidth=75  " tw:  wrap at 75 characters
set autoindent  " ai:  indent to match previous line
set cindent  " cin:  Use C-indenting
set cinkeys=0{,0},!^F,o,O,e  " cink:  Perl-friendly reindent keys
set cinoptions=t0,+4,(0,)60,u0,*100  " cino:  all sorts of options
set cinwords=if,else,while,do,for,elsif,sub
set comments=n:#  " com:  Perlish comments
set formatoptions=crql  " fo:  word wrap, format comments
set showmatch  " show matches on parens, bracketc, etc.
set incsearch
set hlsearch
colorscheme delek

augroup filetypedetect
    au! BufRead,BufNewFile *.t       setfiletype perl " Auto detect the .t files as perl scripts.
augroup END

" Standard Perl Header
" ab #!perl #!/usr/bin/perl -w<CR>@(#) $Id$<CR>vim:sw=4:ts=4:<CR>use strict;<CR>use warnings;

" I like line separators in my code
ab #-- #---------------------------------------------------------------------------
ab ### ############################################################################
