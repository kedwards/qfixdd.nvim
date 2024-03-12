" When using `dd` in the quickfix list, remove the item from the quickfix list.
function! qfixdd#RemoveQFItem(mode) range abort
  let l:qf_list = getqflist()

  " distinguish mode for getting delete index and delete count
  if a:mode == 'v'
    let l:del_qf_idx = getpos("'<")[1] - 1
    let l:del_ct = getpos("'>")[1] - l:del_qf_idx
  else
    let l:del_qf_idx = line('.') - 1
    let l:del_ct = v:count > 1 ? v:count : 1
  endif

  " delete lines and update quickfix
  for item in range(l:del_ct)
    call remove(l:qf_list, l:del_qf_idx)
  endfor
  call setqflist(l:qf_list, 'r')

  if len(l:qf_list) > 0
    execute l:del_qf_idx + 1 . 'cfirst'
    copen
  else
    cclose
  endif
endfunction
