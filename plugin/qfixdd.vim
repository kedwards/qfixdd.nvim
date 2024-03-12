augroup qfixdd
  " Use map <buffer> to only map dd in the quickfix window. Requires +localmap
  autocmd FileType qf nmap <buffer> dd :call qfixdd#RemoveQFItem('n')<cr>
  autocmd FileType qf vmap <buffer> dd :call qfixdd#RemoveQFItem('v')<cr>
augroup end
