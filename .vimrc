" ============================================================================
" 基础显示设置
" ============================================================================
set number              " 显示行号
set relativenumber      " 显示相对行号（方便跳转，如 5j 向上跳5行）
set cursorline          " 高亮当前行
set wrap                " 自动折行
set showmatch           " 显示匹配的括号 ( ) [ ] { }
set scrolloff=5         " 光标移动到距离顶部或底部 5 行时开始滚动
set laststatus=2        " 总是显示状态栏
set ruler               " 在右下角显示光标位置

" ============================================================================
" 缩进与格式化 (针对你之前的需求)
" ============================================================================
set tabstop=4           " 一个 Tab 等于 4 个空格
set shiftwidth=4        " 自动缩进和 >> 命令使用的空格数
set softtabstop=4       " 编辑模式下按退格键时退回 4 个空格
set expandtab           " 将 Tab 自动转换为空格
set autoindent          " 继承前一行的缩进
set smartindent         " 智能缩进（识别 C/Python 等语法）

" ============================================================================
" 搜索设置
" ============================================================================
set hlsearch            " 高亮搜索结果
set incsearch           " 输入搜索内容时实时跳转
set ignorecase          " 搜索时忽略大小写
set smartcase           " 如果搜索词包含大写字母，则不忽略大小写

" ============================================================================
" 核心功能与编码
" ============================================================================
set encoding=utf-8      " 使用 UTF-8 编码
set nocompatible        " 禁用与 Vi 的兼容模式，启用 Vim 特性
set hidden              " 允许在有未保存修改时切换缓冲区
set backspace=indent,eol,start " 允许在所有情况下使用退格键
set nobackup            " 不产生备份文件
set noswapfile          " 不产生交换文件

" ============================================================================
" 常用快捷键映射 (Key Mappings)
" ============================================================================
" 将 Leader 键映射为空格（非常顺手）
let mapleader = "\<Space>"

" 快速保存和退出
nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

" 解决‘缩进后选区消失’的痛点 (Visual Mode 下连续缩进)
vnoremap < <gv
vnoremap > >gv

" 取消搜索高亮
nnoremap <Leader>nh :nohlsearch<CR>

" 窗口间快速切换 (Ctrl + hjkl)
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" ============================================================================
" 语法高亮
" ============================================================================
syntax on               " 开启语法高亮
filetype plugin indent on " 启用文件类型插件和缩进

" 为 JSON 文件单独设置 2 空格缩进
autocmd FileType json setlocal expandtab shiftwidth=2 tabstop=2 softtabstop=2
