" .vimrc

set rnu nu
set smartcase

"indents
set autoindent
set shiftwidth=4 smarttab
set expandtab
set tabstop=8 softtabstop=0

set hlsearch
set title


" Toggle nerdtree
map <F2> :NERDTreeToggle<CR>


" ALE configurtion

" ALEFix bind
map <F3> :ALEFix<CR>

" go to next error keybind
nmap <silent> <C-e> <Plug>(ale_next_wrap)

" don't lint on enter
let g:ale_lint_on_enter = 0

" lint on save
let g:ale_lint_on_save = 1

" fix on save not working with nerdtree
let g:ale_fix_on_save = 1

" lint symbols
let g:ale_sign_error = '●'
let g:ale_sign_warning = '.'

" C/C++
let g:ale_fixers = {
\	'c':['astyle'],
\}


" display number of lint errors found
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))
    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors
    return l:counts.total == 0 ? 'OK' : printf(
        \   '%d⨉ %d⚠ ',
        \   all_non_errors,
        \   all_errors
        \)
endfunction
set statusline+=%=
set statusline+=\ %{LinterStatus()}
