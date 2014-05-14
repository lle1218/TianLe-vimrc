"+++++++++++++++++++++++++++++++++++=============
"
"By:    TianLe
"Date:  2014.4.12
"
"+++++++++++++++++++++++++++++++++++=============
"

"
"下面配置leader键
let nmapleader=","
"关闭vi的一致性模式 避免以前版本的一些Bug和局限
set nocompatible

"实时匹配查找，输什么找什么
set incsearch

"关闭声音
"set noeb
set vb t_vb=

"显示标尺
set ruler

colorscheme desert

"显示输入的命令
set showcmd

"显示中文帮助
if version >= 603
	set helplang=cn
	set encoding=utf-8
endif

"补全颜色设置
"highlight Pmenu   guibg=darkgrey guifg=black
"highlight PmenuSel guibg=lightgrey guifg=black

"设置ctags的快捷键为 Ctrl-F12
map <C-F12> :!ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>  
"set tags+=/root/cscope/common_tags
set tags+=tags

"cscope设置
if has("cscope")
	set csprg=/usr/bin/cscope
	set csto=1
	set cst

	if filereadable("cscope.out")
"		cs add /root/cscope/common_cs/cscope.out
		cs add /root/cscope.out
	elseif $CSCOPE_DB != ""
		cs add $CSCOPE_DB
	endif
endif
"用 ,s/,g ...来建立cscope的快捷操作
nmap <C-_>s :cs find s<C-R>=expand("<cword>")<CR><CR>
nmap <C-_>g :cs find g<C-R>=expand("<cword>")<CR><CR>
nmap <C-_>c :cs find c<C-R>=expand("<cword>")<CR><CR>
nmap <C-_>t :cs find t<C-R>=expand("<cword>")<CR><CR>
nmap <C-_>e :cs find e<C-R>=expand("<cword>")<CR><CR>
nmap <C-_>f :cs find f<C-R>=expand("<cfile>")<CR><CR>
nmap <C-_>i :cs find i^<C-R>=expand("<cfile>")<CR>$<CR>
nmap <C-_>d :cs find d<C-R>=expand("<cword>")<CR><CR>

"设定使用 quickfix 窗口显示 cscope 的查询结果
set cscopequickfix=s-,c-,d-,i-,t-,e-
"切换到下一个查询结果
nmap <F6> :cn<CR>
"切换到上一个查询结果
nmap <F7> :cp<CR>

"显示行号
set number

"设置在编辑过程中右下角显示光标的行列信息
set ruler

"当一行文字很长时取消换行
"set nowrap

"设置C/C++方式自动对齐
set autoindent
set cindent

"设置Tab宽度
set tabstop=4
"设置自动对齐空格数
set shiftwidth=4

"指定配色方案为256色
set t_Co=256

"设置在Vim中可以使用鼠标 防止在Linux终端下无法拷贝
set mouse=a
set selection=exclusive
set selectmode=mouse,key

"开启语法高亮功能
syntax enable
syntax on

"设置编码方式
set encoding=utf-8
"自动判断编码时 依次尝试一下编码
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1

"检测文件类型
filetype on
"针对不同的文件采用不同的缩进方式
filetype indent on
"允许插件
filetype plugin on
"启动智能补全
filetype plugin indent on

"使用vundle管理vim插件的配置
set nocompatible              " be iMproved
filetype off                  " required!
set rtp+=~/.vim/bundle/vundle/    "这里写自己vim目录
"set rtp+=~/.vim/bundle/    "这里写自己vim目录
call vundle#rc()


Bundle 'gmarik/vundle'

"提供多文件同时编辑功能,操作缓存buffer窗口
Bundle 'minibufexplorerpp'         
let g:miniBufExplMapWindowNavVim = 1 "Ctrl-<hjkl> to move to window 
let g:miniBufExplTabWrap = 1 " make tabs show complete (no broken on two lines)

"提供源代码符号的结构化视图,这个插件需要tags文件的支持
Bundle 'Tagbar'          
"Tagbar configuration  
"{  
nmap <F8> :TagbarToggle<CR>   "设置快捷键,按下F8即可显示列表  
let g:tagbar_autofocus = 1    
let g:tagbar_width = 30       "设置宽度，默认为30  
"autocmd VimEnter * nested :call tagbar#autoopen(1)    "打开vim时自动打开tagbar  
let g:tagbar_left = 1         "在左侧  
"let g:tagbar_right = 1        "在右侧  
"}

"提供树形浏览文件系统的界面
Bundle 'The-NERD-tree'
let NERDTreeWinPos = 'right'
let NERDTreeWinSize = 31
let NERDTreeChDirMode = 1
nmap <F9> :NERDTreeToggle<CR>

Bundle 'supertab'
let g:SuperTabRetainCompletionType = 2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"

"PowerLine插件 状态栏增强展示
Bundle 'Lokaltog/vim-powerline'
"vim有一个状态栏 加上powline则有两个状态栏
set laststatus=2
set t_Co=256
let g:Powline_symbols='fancy'

"youcompleteme
"Bundle 'Valloric/YouCompleteMe'

"matrix.vim
Bundle 'matrix.vim--Yang'
filetype plugin indent on     " required!

"文件和函数注释
Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
let g:DoxygenToolkit_blockHeader="--------------------------------------------------------------------------"
let g:DoxygenToolkit_blockFooter="----------------------------------------------------------------------------"
let g:DoxygenToolkit_authorName="TianLe, tianle1218@126.com"
let g:goxygen_enhanced_color=1
let g:DoxygenToolkit_briefTag_funcName="yes"

let s:licenseTag="Copyright(C)\<enter>"
let s:licenseTag=s:licenseTag."For free\<enter>"
let s:lecenseTag=s:licenseTag."ALL right reserved\<enter>"
let g:DoxygenToolkit_licenseTag=s:licenseTag   





