" vim:set ts=2 sts=2 sw=2 expandtab:

set nocompatible " Not compatible with old VI

execute pathogen#infect()

let mapleader=","

:set t_Co=256
:color xoria256

set number
set ruler

set encoding=utf-8

syntax enable
filetype plugin indent on

set showcmd
set showmode

command! W :w
command! Q :q

set autoindent
set tabstop=2
set shiftwidth=2
set expandtab " Insert space for tab key
set laststatus=2
set showmatch
set hlsearch   " Highlight matches
set incsearch  " Incremental searching
set ignorecase " Searches are case insensitive
set smartcase  " Unless they contain at least one capital letter
set timeout timeoutlen=1000 ttimeoutlen=100 " Fix slow O inserts
set vb
set cursorline
set cmdheight=2
set history=10000
set colorcolumn=80
"set t_ti= t_te= " http://www.shallowsky.com/linux/noaltscreen.html
set autoread " If file changed outside of vim, auto reload it
set backspace=indent,eol,start " backspace through everything in insert mode

set list          " Show invisible characters
set listchars=""  " But hide them again
set listchars=tab:\ \
set listchars+=trail:.

if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif

set wildmode=longest,list

set wildignore+=*.o,*.out,*.obj,.git,*.rbc,*.rbo,*.class,.svn,*.gem
set wildignore+=*/vendor/gems/*,*/vendor/cache/*,*/.bundle/*,*/.sass-cache/*
set wildignore+=*/tmp/cache/assets/*/sprockets/*,*/tmp/cache/assets/*/sass/*
set wildignore+=*.swp,*~,._*

" Don't make backups at all
set nobackup
set nowritebackup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

highlight ColorColumn ctermbg=14
highlight Visual ctermbg=3 ctermfg=0
highlight Folded ctermbg=235 ctermfg=240
highlight FoldColumn ctermbg=237 ctermfg=white

au InsertEnter * hi StatusLine ctermfg=235 ctermbg=2
au InsertLeave * hi StatusLine ctermbg=240 ctermfg=white

" Don't update folds in insert mode
aug NoInsertFolding
  au!
  au InsertEnter * let b:oldfdm = &l:fdm | setl fdm=manual
  au InsertLeave * let &l:fdm = b:oldfdm
aug END

let g:ctrlp_max_height = 30
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

" Make RVM work
set shell=bash

autocmd FileType ruby setlocal foldmethod=syntax
autocmd FileType javascript setlocal foldmethod=syntax
autocmd FileType eruby setlocal foldmethod=indent shiftwidth=2 tabstop=2
autocmd FileType css setlocal foldmethod=indent shiftwidth=2 tabstop=2
set nofoldenable " Have fold, but do not do it when I open the file

" Space is zz
nmap <space> zz

" Clear the search buffer when hitting return
:nnoremap <CR> :nohlsearch<cr>
nnoremap <leader><leader> <c-^>

" Status line
set statusline=%<%f\ (%{&ft})\ %{fugitive#statusline()}\ %-4(%m%)%=%-19(%3l,%02c%03V%)
":set statusline=%<%f\ (%{&ft})\ %-4(%m%)%=%-19(%3l,%02c%03V%)

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_scss_checkers = ['scss_lint']

" Arrow keys are unacceptable
map <Left> :echo "HJKL only!"<cr>
map <Right> :echo "HJKL only!"<cr>
map <Up> :echo "HJKL only!"<cr>
map <Down> :echo "HJKL only!"<cr>

" Open files in directory of current file
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%

map <leader>rr :w\|:!clear && ruby %<cr>

" Tab mappings
map <leader>tt :tabnew<cr>
map <leader>te :tabedit<cr>
map <leader>tc :tabclose<cr>
map <leader>to :tabonly<cr>
map <leader>tn :tabnext<cr>
map <leader>tp :tabprevious<cr>
map <leader>tf :tabfirst<cr>
map <leader>tl :tablast<cr>

runtime macros/matchit.vim

" Only apply to .txt files for showing help in a new tab
augroup HelpInTabs
  autocmd!
  autocmd BufEnter *.txt call HelpInNewTab()
augroup END

function! HelpInNewTab()
  if &buftype == 'help'
    execute "normal \<C-W>T"
  endif
endfunction

" React JSX
let g:jsx_ext_required = 0
