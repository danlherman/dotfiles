
" alias leader in normal mode
" let mapleader = ','


" Set colorscheme
color  jellybeans

" Add line numbers
set nu

" Syntax hightlighting
syntax on

" Style for file tree (:E)
let g:netrw_liststyle=3

" Load plugins from plugin folder
" set runtimepath^=~/.vim/plugin/ctrlp.vim
" set runtimepath^=~/.vim/plugin/ag

" set tabs
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set shiftwidth=2

" Rename tmux window based on file in vim
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
autocmd BufEnter * call system("tmux rename-window " . expand("%"))
autocmd VimLeave * call system("tmux rename-window bash")
autocmd BufEnter * let &titlestring = ' ' . expand("%")                                                                 
set title

" Vimplug section
call plug#begin('~/.vim/plugged')

" Git-Gutter functionality
Plug 'mhinz/vim-signify'
" Type-ahead plugin
Plug 'valloric/YouCompleteMe'
" Togggle comments with gc
Plug 'tomtom/tcomment_vim'
" Run rspec from vim
Plug 'thoughtbot/vim-rspec'
" Util for running rspec to tmux window via vim
Plug 'jgdavey/tslime.vim'
" colorscheme jellybeans
Plug 'nanotech/jellybeans.vim'
" silver searcher search
Plug 'rking/ag.vim'
" Full path fuzzy file finder
Plug 'ctrlpvim/ctrlp.vim'

" End Vimplug section
call plug#end()

" initiate vim-signify for git-gutter
let g:signify_vcs_list = [ 'git' ]

" quickly edit/reload the vimrc file
let $MYVIMRC = '~/.vimrc'
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>re :so $MYVIMRC<CR>

" map :t to new tab
nmap <silent> <leader>t :tabnew<CR>

" Show col number in status bar
set ruler

" Show relative line numbers
set relativenumber

" Lock scroll to middle of screen
set scrolloff=3

" Fix delete not working some times
set backspace=indent,eol,start

" Rubocop plugin specifying where to get rubocop rules from
let g:vimrubocop_config = '.rubocop.yml'

" Supposed to fix slow ruby syntax hightlighting sluggish'ness -- see
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
" set re=1
set ttyfast
set lazyredraw

" Highlight entire cursor line
set cursorline
" hi Cursor ctermfg=White ctermbg=Yellow cterm=bold guifg=white guibg=yellow gui=bold
autocmd ColorScheme * highlight CursorLine ctermbg=233

" Map E to Explore
cabbrev E Explore

"Map W to write buffer
cabbrev W :w

" Fix tab completion for You-Complete-Me plugin
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" Use Send_To_Tmux to run selected specs
let g:rspec_command = 'call Send_to_Tmux("be spring rspec {spec}\n")'

" vim-rspec mappings
map <Leader>f :call RunCurrentSpecFile()<CR>
map <Leader>s :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctrl-p mapppings
nnoremap <silent> gb :CtrlPBuffer<CR>
nnoremap <silent> go :CtrlP<CR>
nnoremap <silent> gr :CtrlPMRU<CR>
let g:ctrlp_show_hidden = 1

" map spacebar to save buffer
nmap <space> :w<CR>

" ---------------------------------------------------------------------------
" Window Management
" ---------------------------------------------------------------------------
" opening and switching
function! WinMove(key)
  let t:curwin = winnr()
  exec "wincmd ".a:key
  if (t:curwin == winnr()) "we havent moved
    if (match(a:key,'[jk]')) "were we going up/down
      wincmd v
    else
      wincmd s
    endif
    exec "wincmd ".a:key
  endif
endfunction

" mappings to make window management easy 
set winminheight=0
nnoremap gz :wincmd _<cr>

" window navigation
nnoremap g<left> :call WinMove('h')<cr>
nnoremap g<right> :call WinMove('l')<cr>
nnoremap g<down> :call WinMove('j')<cr>
nnoremap g<up> :call WinMove('k')<cr>

" closing, rotating, and moving
nnoremap gH              :wincmd H<cr>
nnoremap gK              :wincmd K<cr>
nnoremap gL              :wincmd L<cr>
nnoremap gJ              :wincmd J<cr>

" Turn off swap file for vim
set noswapfile
