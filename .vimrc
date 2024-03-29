" This is supposed to speed up vim start time
let g:vimsyn_embed='0'
" Vimplug section
"
" To install vim-plug do the following:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" then run :PlugInstall to install plugins
"
call plug#begin('~/.vim/plugged')

" Git-Gutter functionality
Plug 'mhinz/vim-signify'
" Type-ahead plugin
" This plugin is running really slow... commenting it out for now.
" Plug 'valloric/YouCompleteMe'
" Togggle comments with gc
Plug 'tomtom/tcomment_vim'
" Run rspec from vim
" Plug 'thoughtbot/vim-rspec'
" Util for running rspec to tmux window via vim
" Plug 'benmills/vimux'
" colorscheme jellybeans
Plug 'nanotech/jellybeans.vim'
" silver searcher search
Plug 'rking/ag.vim'
" Full path fuzzy file finder, and tjump for easier tag searching
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ivalkeen/vim-ctrlp-tjump'
" End Wise (adds end to block)
Plug 'tpope/vim-endwise'
" Surround code with pairs ("", {}, etc)
Plug 'tpope/vim-surround'
" Extends built-in dot repeat command to handle more complex motion
Plug 'tpope/vim-repeat'
" Nerd Tree file listing/selection
Plug 'scrooloose/nerdtree'
" DB support for VIM
" Plug 'tpope/vim-db'
" vimtags for ctag integration
" Plug 'szw/vim-tags'
" status bar plugin for cool looking status line
" Plug 'powerline/powerline'
" RuboCop plugin
" Plug 'ngmy/vim-rubocop'
" Fugitive git plugin
Plug 'tpope/vim-fugitive'
" Easymotion plugin
Plug 'easymotion/vim-easymotion'
" Emmet plugin for HTML shortcuts
" Plug 'mattn/emmet-vim'
" Automatic Syntax Checker
" Plug 'vim-syntastic/syntastic'
" Plug 'SirVer/ultisnips'
" Snippets are separated from the engine. Add this if you want them:
" Plug 'honza/vim-snippets'
" For ESLint integration
Plug 'w0rp/ale'
" Typescript syntax highlighting
" Plug 'leafgarland/typescript-vim'

" Black for Python formatting
Plug 'psf/black', { 'branch': 'stable' }

" Golang support for Vim
Plug 'fatih/vim-go'

" End Vimplug section
call plug#end()

" ESLint Integration wkth syntastic
let b:ale_linters = ['eslint']

" make YCM compatible with UltiSnips (using supertab)
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-p>', '<Up>']
let g:SuperTabDefaultCompletionType = '<C-n>'

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
let g:UltiSnipsSnippetDirectories = ['~/.vim/UltiSnips', 'UltiSnips']

" better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"         
let g:UltiSnipsJumpForwardTrigger = "<tab>"    
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>" 

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

" set tabs
set tabstop=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set shiftwidth=2

" Rename tmux window based on file in vim
" autocmd BufReadPost,FileReadPost,BufNewFile * call system("tmux rename-window " . expand("%"))
" autocmd BufEnter * call system("tmux rename-window " . expand("%"))
" autocmd VimLeave * call system("tmux rename-window bash")
" autocmd BufEnter * let &titlestring = ' ' . expand("%")
" set title

" initiate vim-signify for git-gutter
let g:signify_vcs_list = [ 'git' ]

" quickly edit/reload(source) the vimrc file
let $MYVIMRC = '~/.vimrc'
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <leader>sv :so $MYVIMRC<CR>

" quickly edit the tmux.conf file
let $MYTMUXCONF = '~/.tmux.conf'
nmap <silent> <leader>et :e ~/.tmux.conf<CR>

" Show col number in status bar
set ruler

" Show relative line numbers
" set relativenumber

" Lock scroll to middle of screen
" set scrolloff=3

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
autocmd ColorScheme * highlight CursorLine ctermbg=240

" Map E to Explore
cabbrev E Explore

" Map W to write buffer
cabbrev W :w

" Map Q to quit
cabbrev Q :q

" Fix tab completion for You-Complete-Me plugin
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']

" Use Send_To_Tmux to run selected specs
let g:rspec_command = ':call VimuxRunCommand("clear; be rspec {spec}")'

" vim-rspec mappings
map <Leader>t :call RunCurrentSpecFile()<CR>
map <Leader>f :call RunNearestSpec()<CR>
map <Leader>l :call RunLastSpec()<CR>
map <Leader>a :call RunAllSpecs()<CR>

" ctrl-p mapppings
nnoremap <silent> gb :CtrlPBuffer<CR>
nnoremap <silent> go :CtrlP<CR>
nnoremap <silent> gr :CtrlPMRU<CR>
nnoremap <silent> gt :CtrlPTag<CR>
nnoremap <silent> gf :CtrlPBufTag<CR>
nnoremap <c-]> :CtrlPtjump<cr>
vnoremap <c-]> :CtrlPtjumpVisual<cr>
let g:ctrlp_tjump_shortener = ['/Users/.*/gems/', '.../']
let g:ctrlp_show_hidden = 1

" map spacebar to save buffer
" nmap <space> :call StripWhitespace ()<CR> :w<CR>
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

" Show hidden characters
set list

" List chars
set listchars=""                  " Reset the listchars
" set listchars=tab:\ \             " a tab should display as "  ", trailing whitespace as "."
set listchars=tab:>-              " show tabs as ">-"
set listchars+=trail:.            " show trailing spaces as dots
set listchars+=extends:>          " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
set listchars+=precedes:<         " The character to show in the last column when wrap is
                                  " off and the line continues beyond the right of the screen
function! StripWhitespace ()
  " exec ':%s/ \+$//gc'
  exec ':%s/\s\+$//e'
endfunction
nnoremap <F5> :call StripWhitespace ()<CR>

" Add CMD-c / CMD-v for copying to Mac Clipboard
vnoremap <C-c> :w !pbcopy<CR><CR> noremap <C-v> :r !pbpaste<CR><CR>

" Add undo history
set undofile
" Prevent undo files from littering everywhere
set undodir=~/.vim/undo

" Nerd tree mappings
nnoremap <leader>nf :NERDTreeFind<CR>
nnoremap <leader>nn :NERDTree<CR>
let g:NERDTreeQuitOnOpen = 1
let g:NERDTreeShowHidden = 1
let g:NERDTreeWinSize = 50

" For VimTags 
nmap gn <C-]>
nmap gp <C-t>

set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" highlight last inserted text
nnoremap gV `[v`]

" Add the pry debug line with \bp
map <Leader>bp Orequire'pry';binding.pry<esc>:w<cr>

" Add a shortcut for ERB tags with \<
map <Leader>< <esc>a<%=   %><esc>bhhha

" Add shortcut to convert comma separated line to new-line delimited lines
nnoremap <Leader>, <esc>V:s/,/\r/g<cr>

" Add shortcut to format JSON via python json.tool
nnoremap <Leader>json <esc>:%!python -m json.tool<CR>

" Add shortcut to format XML
nnoremap <Leader>xml <esc>'<,'>!xmllint --format -

" Add shortcut to show git-blame for current file using Fugitive plugin
nnoremap <Leader>gb <esc>:Gblame<cr>
nnoremap <Leader>gs <esc>:Gstatus<cr>
nnoremap <Leader>gd <esc>:Gdiff<cr>

" map alternate ways to exit insert mode
" inoremap dk <ESC>
" inoremap kd <ESC>
" inoremap jj <ESC>

" map ctrl-a to select all
nmap <C-a> ggVG

" make selecting a line easier
nnoremap vv V

"  ############# IGNORES
" Disable output and VCS files
set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem

" Disable archive files
set wildignore+=*.zip,*.tar.gz,*.tar.bz2,*.rar,*.tar.xz

" Ignore bundler and sass cache
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*

" Ignore node files
set wildignore+=*/node_modules/*
set wildignore+=*/build/*

" Ignore coverage files
set wildignore+=*/coverage/*

set wildignore+=*/bower_components/*
set wildignore+=bower_components/*
set wildignore+=*/vendor/*
set wildignore+=*/public/*
set wildignore+=*/dist/*

" osx
set wildignore+=.DS_Store

" Disable temp and backup files

set wildignore+=*.swp,*~,._*

" Ignore tmp dirs
set wildignore+=*/tmp/*,*/servers/*,*/log/*

" Fix issue with slow O command
set timeout timeoutlen=3000 ttimeoutlen=100

" Add vim status line
set laststatus=2
hi StatusLine ctermbg=8 ctermfg=7
set statusline=
set statusline +=%1*\ b%n\ %*            "buffer number
set statusline +=%5*%{&ff}%*            "file format
set statusline +=%3*%y%*                "file type
set statusline +=%4*\ %<%t%*            "file
" set statusline +=\ %{fugitive#statusline()} " Git Branch
set statusline +=%2*%m%*                "modified flag
set statusline +=%1*%=%5l%*             "current line
set statusline +=%2*/%L%*               "total lines
set statusline +=%1*%4v\ %*             "virtual column number
set statusline +=%2*0x%04B\ %*          "character under cursor
" Syntastic statusline stettings
" set statusline +=%#warningmsg#
" set statusline +=%{SyntasticStatuslineFlag()}
" set statusline +=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

" ----------------------------------------------------------------------------
" easymotion
" ----------------------------------------------------------------------------
" let g:EasyMotion_leader_key = '<space>'
let g:EasyMotion_keys = 'abcdefghijklmnopqrstuvwxyz'
" let g:EasyMotion_do_mapping = 1 " Disable default mappings

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" Bi-directional find motion
" Jump to anywhere you want with minimal keystrokes, with just one key
" binding.
nmap f <Plug>(easymotion-bd-f)
omap f <Plug>(easymotion-bd-f)

nmap t <Plug>(easymotion-bd-t)
omap t <Plug>(easymotion-bd-t)

nmap s <Plug>(easymotion-bd-f)
omap s <Plug>(easymotion-bd-f)

" replace incremental search
nmap / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-sn)
" extend n/N with more features like auto-highlight
map n <Plug>(easymotion-next)
map N <Plug>(easymotion-prev)

" Set Gdiff split to be vertical instead of horizontal
if &diff
  set diffopt-=internal
  set diffopt+=vertical
endif
"set diffopt+=vertical

" https://nvd.nist.gov/vuln/detail/CVE-2019-12735
set nomodeline

" Run Black on Python files automatically on save
autocmd BufWritePre *.py execute ':Black'

" Show commit that introduced current line
map <silent><Leader>gb :call setbufvar(winbufnr(popup_atcursor(systemlist("cd " . shellescape(fnamemodify(resolve(expand('%:p')), ":h")) . " && git log --no-merges -n 1 -L " . shellescape(line("v") . "," . line(".") . ":" . resolve(expand("%:p")))), { "padding": [1,1,1,1], "pos": "botleft", "wrap": 0 })), "&filetype", "git")<CR>

" Add linting for Golang files"
set rtp+=$GOPATH/src/golang.org/x/lint/misc/vim
