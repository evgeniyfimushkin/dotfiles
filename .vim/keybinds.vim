let mapleader = " "
nnoremap <leader>cd :Ex<CR>

if has('mac')
  vnoremap <leader>y :w !pbcopy<CR><CR>
  nnoremap <leader>yy :w !pbcopy<CR><CR>
else
  vnoremap <leader>y :w !wl-copy<CR><CR>
  nnoremap <leader>yy :w !wl-copy<CR><CR>
endif
