syntax on
set backspace=indent,eol,start 
colorscheme darkblue
"------------use vundle manager plugin -------------
"
set nocompatible "be iMproved
filetype off "required
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" 使用Vundle管理插件
Bundle 'gmarik/vundle'
" 接下来是安装的插件
"taglist from vim-script
Bundle 'syhkiller/taglist.vim'
Bundle 'a.vim' 
Bundle 'code_complete'
Bundle 'scrooloose/syntastic'
Bundle 'Valloric/YouCompleteMe' 
Bundle 'Valloric/ListToggle'
Bundle 'Conque-Shell'
Bundle 'Yggdroot/indentLine'
Bundle 'pydave/vim-man'
Bundle 'Auto-Pairs'

filetype on "required 
"------------end of vundle manager plugin ---------

set foldmethod=manual


"-----------begin basic config of vim------------
set nu
set cindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set smartindent
set expandtab
set fileencodings=utf8,gbk
set ignorecase
set backspace=start,eol,indent
autocmd FileType python,cmake set nocindent
autocmd FileType make set noexpandtab
"-----------end basic config of vim------------

"---------------begin add ctags------------------
" configure tags - add additional tags here or comment out not-used ones
set tags+=./tags
set tags+=../tags
set tags+=~/.vim/tags/systags/tags
"set tags+=~/.vim/tags/cudatags
"autocmd FileType cpp set tags+=~/.vim/tags/cpp
"autocmd FileType cpp set tags+=~/.vim/tags/qt4
"set tags+=~/.vim/tags/gl
"set tags+=~/.vim/tags/moduletags
cs add .
set autochdir
map <F2> :tabprevious <CR>
map <F3> :tabnext <CR>
imap <F2> <Esc>:tabprevious<CR>
imap <F3> <Esc>:tabnext<CR>
"----------------end add tags--------------------


"---------------begin gui settings ------------------
if has("gui_running")
	"set guifont=Courier_New:h18 "set guifontwide=Courier_New:h18
	set guioptions-=T "关闭工具栏
	set guioptions-=l "关闭左边滚动条
	set guioptions-=r "关闭右边滚动条
	set guioptions-=R 
	set guioptions-=L
	set guifont=文泉驿等宽微米黑\ 12
	colorscheme koehler
	"set transparency=20
	set noimd
	au WinEnter * if &filetype == 'conque_term' | set imd | else | set noimd | endif
	au FileType conque_term set imd
endif
"----------------end gui settings -------------------

"-------------begin taglist setting"-------------------
let g:Tlist_Exit_OnlyWindow=1 "自动退出
let g:Tlist_Auto_Update=1
let g:Tlist_Auto_Open=1 "自动打开
let g:Tlist_Use_Right_Window=1 "靠右
let g:Tlist_Sort_Type="name"
let g:Tlist_Process_File_Always=1
let g:Tlist_Auto_Highlight_Tag=1
let g:Tlist_Show_One_File = 1
"let g:Tlist_Ctags_Cmd = '/usr/local/opt/ctags/bin/ctags' 
"let g:Tlist_Display_Prototype=1
"-------------end taglist setting-----------------  


""-----------build tags of your own project with Ctrl-F12------------
"map <F12> :!ctags -R -I "__THROW" --sort=yes --c++-kinds=+p --fields=+iaS --extra=+q . <CR>
"map <F12> :!ctags -R -I __THROW -I __THROWNL -I __attribute_pure__ -I __nonnull -I __attribute__ --file-scope=yes --langmap=c:+.h --languages=c,c++ --links=yes --c-kinds=+p --c++-kinds=+px --fields=+iaS --extra=+q --sort=yes . <CR>
map <F6> :!mkctags . <CR>
map <F7> :cs add . ../.<CR>
"--------------------------end----------------------------------

" automatically open and close the popup menu / preview window
"au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif

""----------------begin auto make----------------------
"set makeprg=make\ %<
"map <F5> :w <CR>:make<CR>
""map <F5> :w <CR>:!gcc % -o  %< -g -lm<CR>
"map <F6> :!./%<<CR>
""--------------end auto make ------------------------

"---------------code_complete-----
"let g:completekey = '<C-c>'
"---------------------------------

"---------------syntastic----------------
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_aggregate_errors = 1
"autocmd FileType c,cpp 
let syntastic_mode_map = {'passive_filetypes' : ['c', 'cpp','asm']}

"----------------YouCompleteMe-----------
let g:ycm_key_invoke_completion = '<C-j>'
let g:ycm_global_ycm_extra_conf = '~/.ycm_extra_conf.py'
let g:ycm_always_populate_location_list = 1
let g:ycm_error_symbol = '✗'
let g:ycm_warning_symbol = '⚠'
let g:ycm_confirm_extra_conf = 0
let g:ycm_seed_identifiers_with_syntax = 1

autocmd BufWrite * pclose 
imap <C-l> <Esc>:pclose<CR>a
map <C-l> :pclose<CR>
map <C-\> :YcmCompleter GoToDefinitionElseDeclaration<CR>

"-----------statusline--------------
set laststatus=2
set statusline=%<%F%m%r%w\ fmt=%{&ff}:%{&fenc!=''?&fenc:&enc},type=%Y,ascii=\%b(\%B)%=%v,%l\ of\ %L\ %P
autocmd FileType taglist,vundle setlocal statusline=%F

"-------------IndentLine--------------------
let g:indentLine_char = '꤯'


if has("cscope")
    set csto=0
    set cst
endif


map <leader><leader>c :cs f c <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>d :cs f d <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>e :cs f e <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>f :cs f f <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>g :cs f g <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>s :cs f s <C-R>=expand("<cword>")<CR><CR>

map <leader><leader>sc :scs f c <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>sd :scs f d <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>se :scs f e <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>sf :scs f f <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>sg :scs f g <C-R>=expand("<cword>")<CR><CR>
map <leader><leader>ss :scs f s <C-R>=expand("<cword>")<CR><CR>
