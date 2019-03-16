set nu
syn on
set smartindent
set ts=4
set shiftwidth=2
set expandtab
set mouse=
set spelllang=en_us
set lazyredraw 
set ttyfast
set ruler

set foldmethod=indent
set foldnestmax=10
set nofoldenable
set foldlevel=1
set backspace=2

call pathogen#infect()

function EnableRubyDebug()
  noremap <leader>b  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.toggle_breakpoint()<CR>
  noremap <leader>v  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_variables()<CR>
  noremap <leader>m  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_breakpoints()<CR>
  noremap <leader>t  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.open_frames()<CR>
  noremap <leader>s  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.step()<CR>
  noremap <leader>f  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.finish()<CR>
  noremap <leader>n  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.next()<CR>
  noremap <leader>c  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.continue()<CR>
  noremap <leader>e  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.exit()<CR>
  noremap <leader>d  :call ruby_debugger#load_debugger() <bar> call g:RubyDebugger.remove_breakpoints()<CR>
endfunction

function! Tab_Or_Complete()
  if col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
    return "\<C-N>"
  else
    return "\<Tab>"
  endif
endfunction

autocmd Vimenter * NERDTree
autocmd Vimenter * wincmd p 

autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby,eruby let g:rubycomplete_buffer_loading = 1
autocmd FileType ruby,eruby let g:rubycomplete_rails = 1
autocmd FileType ruby,eruby let g:rubycomplete_classes_in_global = 1
autocmd FileType ruby,eruby call EnableRubyDebug()

let g:Powerline_symbols = 'fancy'
let g:NERDTreeDirArrows=0
hi Directory guifg=#FF0000 ctermfg=red

colors koehler
inoremap <Tab> <C-R>=Tab_Or_Complete()<CR>

let g:slime_target='tmux'

set noswapfile
set backupdir=~/tmp/vim
set directory=~/tmp/vim
set noesckeys
set undodir=~/tmp/vim
set undofile

nnoremap <C-n> :tabnext<CR>
nnoremap <C-p> :tabprev<CR>
nnoremap <C-c> :tabnew<CR>
