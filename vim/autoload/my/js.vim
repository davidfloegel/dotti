"
" Infer the tested object from a path
"
" Example:
"   stuff/__tests__/thing.spec.js -> thing
"
function! my#js#test_file_to_name()
  let filename = expand('%:t')
  return substitute(filename, '\v\.(spec|test)\.(js|ts)(x)?', '', '')
endfunction

function! my#js#jsx_filename_to_name()
  let filename = expand('%:t')
  return substitute(filename, '\v\.(js|ts)(x)?', '', '')
endfunction

