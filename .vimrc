set background=dark
colorscheme zenburn
set nocompatible
syntax on
set number
set noswapfile
set nobackup
set hlsearch
set incsearch
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo Plugin 'tpope/vim-fugitive' " plugin from http://vim-scripts.org/vim/scripts.html Plugin 'L9'
" Git plugin not hosted on GitHub
" git repos on your local machine (i.e. when working on your own plugin)
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" Avoid a name conflict with L9
Plugin 'kien/ctrlp.vim'
Plugin 'VundleVim/Vundle.vim'
Plugin 'exvim/ex-autocomplpop'
Plugin 'Shougo/neocomplcache.vim'
Plugin 'bling/vim-airline'
Plugin 'mbbill/undotree'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'flazz/vim-colorschemes'
Plugin 'sickill/vim-monokai'
Plugin 'Yggdroot/indentLine'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'Lokaltog/vim-easymotion'
Plugin 'jnurmine/Zenburn'
Plugin 'jmahler/hla.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'ervandew/supertab'
Plugin 'majutsushi/tagbar'
Plugin 'airblade/vim-gitgutter'
Plugin 'craigemery/vim-autotag'
Plugin 'brookhong/cscope.vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'tpope/vim-fugitive'
Plugin 'hari-rangarajan/CCTree'
Plugin 'mhinz/vim-grepper'
Plugin 'naseer/logcat'
Plugin 'vim-scripts/ZoomWin'
"Lokaltog/vim-easymotion
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

let g:airline#extensions#tabline#enabled=1
let g:airline_powerline_fonts=1


set tabstop=4
set shiftwidth=4
set expandtab
let g:indentLine_char='|'
let g:indentLine_color_term=239


let mapleader="\<Space>"
set autoread
"quicksave
map <Leader>w :w!<cr>
"nextbuffer
map <Leader>l :bnext<cr>
"prevbuffer
map <Leader>h :bprevious<cr>
let g:ctrlp_map = '<c-p>'

inoremap jj <Esc>
map <Leader>u :UndotreeToggle<cr>
map <Leader><Leader>u :NERDTreeToggle<cr>

let g:limelight_conceal_ctermfg = 'gray'
let g:goyo_linenr =1
let g:goyo_width=160
autocmd User GoyoEnter Limelight
autocmd User GoyoLeave Limelight!
map <Leader><Leader>g :Goyo<cr>
map <Leader><Leader>Q :q<cr>

set scrolloff=7


set showmatch
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

vnoremap // y/<C-R>"<CR>
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l
map Q <nop>
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
let g:lasttab=1
nmap <Leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()
    set undofile


"unmapping arrows, annoying error
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" generate tags for current folder
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q --exclude=.git --exclude=*.js --exclude=prebuilt --exclude=prebuilts --exclude=out .<CR><CR>
"sudo save files
map w!! w !sudo tee % >/dev/null
"toggling tagbar for file navigation
nmap <F8> :TagbarToggle<CR>



map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=0
    set cst
    set nocsverb
    " add any database in current directory
        if filereadable("cscope.out")
                 cs add cscope.out
                         " else add database pointed to by environment
        elseif $CSCOPE_DB != ""
            cs add $CSCOPE_DB
        endif
        nmap <C-\>s :cs find s <C-R>=expand("<cword>")<CR><CR>
     nmap <C-\>g :cs find g <C-R>=expand("<cword>")<CR><CR>
     nmap <C-\>c :cs find c <C-R>=expand("<cword>")<CR><CR>
     nmap <C-\>t :cs find t <C-R>=expand("<cword>")<CR><CR>
     nmap <C-\>e :cs find e <C-R>=expand("<cword>")<CR><CR>
     nmap <C-\>f :cs find f <C-R>=expand("<cfile>")<CR><CR>
     nmap <C-\>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
     nmap <C-\>d :cs find d <C-R>=expand("<cword>")<CR><CR>


     " Using 'CTRL-spacebar' (intepreted as CTRL-@ by vim) then a search type
     " makes the vim window split horizontally, with search result displayed in
     " the new window.
     "
     " (Note: earlier versions of vim may not have the :scs command, but it
     " can be simulated roughly via:
     "    nmap <C-@>s <C-W><C-S> :cs find s <C-R>=expand("<cword>")<CR><CR>

     nmap <C-@>s :scs find s <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@>g :scs find g <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@>c :scs find c <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@>t :scs find t <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@>e :scs find e <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@>f :scs find f <C-R>=expand("<cfile>")<CR><CR>
     nmap <C-@>i :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
     nmap <C-@>d :scs find d <C-R>=expand("<cword>")<CR><CR>


     " Hitting CTRL-space *twice* before the search type does a vertical
     " split instead of a horizontal one (vim 6 and up only)
     "
     " (Note: you may wish to put a 'set splitright' in your .vimrc
     " if you prefer the new window on the right instead of the left

     nmap <C-@><C-@>s :vert scs find s <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@><C-@>g :vert scs find g <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@><C-@>c :vert scs find c <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@><C-@>t :vert scs find t <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@><C-@>e :vert scs find e <C-R>=expand("<cword>")<CR><CR>
     nmap <C-@><C-@>f :vert scs find f <C-R>=expand("<cfile>")<CR><CR>
     nmap <C-@><C-@>i :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>
     nmap <C-@><C-@>d :vert scs find d <C-R>=expand("<cword>")<CR><CR>
endif
