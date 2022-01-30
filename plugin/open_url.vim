if exists('g:loaded_open_url')
  finish
endif
let g:loaded_open_url = 1

function! s:SetGlobalOpt(opt, val)
  if !exists('g:'.a:opt)
    let g:{a:opt} = a:val
  endif
endfunction

call s:SetGlobalOpt('open_url_browser_default', 'xdg-open')
call s:SetGlobalOpt('open_url_default_mappings', '1')

command! -nargs=1 OpenURL call open_url#open(<q-args>)
command! -nargs=+ -complete=file OpenIn call open_url#open_in(<f-args>)
command! -nargs=1 -complete=file OpenInChrome OpenIn Google\ Chrome <q-args>
command! -nargs=1 -complete=file OpenInFirefox OpenIn Firefox <q-args>
command! -nargs=+ -complete=custom,open_url#engines#complete OpenSearchURL call open_url#engines#search(<f-args>)

nnoremap <Plug>(open-url-browser) :OpenURL <cfile><CR>
xnoremap <Plug>(open-url-browser) :<C-U>OpenURL <C-R>=open_url#get_selection()<CR><CR>

nnoremap <Plug>(open-url-search) :OpenSearchURL <cword><CR>
xnoremap <Plug>(open-url-search) :<C-U>OpenSearchURL <C-R>=open_url#get_selection()<CR><CR>

nnoremap <Plug>(open-url-search-baidu) :OpenSearchURL baidu <cword><CR>
xnoremap <Plug>(open-url-search-baidu) :<C-U>OpenSearchURL baidu <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-search-bing) :OpenSearchURL bing <cword><CR>
xnoremap <Plug>(open-url-search-bing) :<C-U>OpenSearchURL bing <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-search-translate) :OpenSearchURL translate <cword><CR>
xnoremap <Plug>(open-url-search-translate) :<C-U>OpenSearchURL translate <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-search-so) :OpenSearchURL so <cword><CR>
xnoremap <Plug>(open-url-search-so) :<C-U>OpenSearchURL so <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-search-google) :OpenSearchURL google <cword><CR>
xnoremap <Plug>(open-url-search-google) :<C-U>OpenSearchURL google <C-R>=open_url#get_selection()<CR><CR>
nnoremap <Plug>(open-url-search-wikipedia) :OpenSearchURL wikipedia <cword><CR>
xnoremap <Plug>(open-url-search-wikipedia) :<C-U>OpenSearchURL wikipedia <C-R>=open_url#get_selection()<CR><CR>

function! s:FindAndOpen() abort
  let url = open_url#find_url()
  if !empty(url)
    call open_url#open(url)
  else
    echo 'No URL Found'
  endif
endfunction
command! OpenURLFind call s:FindAndOpen()

if g:open_url_default_mappings
  if !hasmapto('<Plug>(open-url-browser)', 'n')
    nmap gB <Plug>(open-url-browser)
  endif
  if !hasmapto('<Plug>(open-url-browser)', 'x')
    xmap gB <Plug>(open-url-browser)
  endif
  " default
  if !hasmapto('<Plug>(open-url-search)', 'n')
    nmap s<CR> <Plug>(open-url-search)
  endif
  if !hasmapto('<Plug>(open-url-search)', 'x')
    xmap s<CR> <Plug>(open-url-search)
  endif
  " for baidu
  if !hasmapto('<Plug>(open-url-search-baidu)', 'n')
    nmap sb <Plug>(open-url-search-baidu)
  endif
  if !hasmapto('<Plug>(open-url-search)-baidu', 'x')
    xmap sb <Plug>(open-url-search-baidu)
  endif
  " for microsoft bing
  if !hasmapto('<Plug>(open-url-search-bing)', 'n')
    nmap sm <Plug>(open-url-search-bing)
  endif
  if !hasmapto('<Plug>(open-url-search-bing)', 'x')
    xmap sm <Plug>(open-url-search-bing)
  endif
  " for baidu translate
  if !hasmapto('<Plug>(open-url-search-translate)', 'n')
    nmap <leader>gt <Plug>(open-url-search-translate)
  endif
  if !hasmapto('<Plug>(open-url-search-translate)', 'x')
    xmap <leader>gt <Plug>(open-url-search-translate)
  endif
  if !hasmapto('<Plug>(open-url-search-wikipedia)', 'n')
    nmap sW <Plug>(open-url-search-wikipedia)
  endif
  if !hasmapto('<Plug>(open-url-search-wikipedia)', 'x')
    xmap sW <Plug>(open-url-search-wikipedia)
  endif
  if !hasmapto('<Plug>(open-url-search-google)', 'n')
    nmap sG <Plug>(open-url-search-google)
  endif
  if !hasmapto('<Plug>(open-url-search-google)', 'x')
    xmap sG <Plug>(open-url-search-google)
  endif
endif
