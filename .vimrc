" -------------------------------
" NeoBundle
" -------------------------------
if has('vim_starting')
  if &compatible
    set nocompatible
  endif

  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Vim-Rails
NeoBundle 'tpope/vim-rails'

" コード補完
NeoBundle 'Shougo/neocomplete.vim'
NeoBundle 'marcus/rsense'
NeoBundle 'supermomonga/neocomplete-rsense.vim'

" 静的解析
" NeoBundle 'scrooloose/syntastic'

" scala用syntax highlight
NeoBundle 'derekwyatt/vim-scala'

" ドキュメント参照
NeoBundle 'thinca/vim-ref'
NeoBundle 'yuku-t/vim-ref-ri'

" メソッド定義元へのジャンプ
NeoBundle 'szw/vim-tags'

" 自動で閉じる
NeoBundle 'tpope/vim-endwise'

" コードを\rで実行できるようにする
NeoBundle 'thinca/vim-quickrun'

" ツリー型のファイル表示 :NERDTree
NeoBundle 'scrooloose/nerdtree'

" コメントON/OFFを手軽に実行 gcc もしくは CTRL + -
NeoBundle 'tomtom/tcomment_vim'

" ul>li*3>a>img CTRL+Y
NeoBundle 'mattn/emmet-vim'

" Gitを楽に使うことができる
NeoBundle 'tpope/vim-fugitive'

" Node.jsの補完
NeoBundle 'myhere/vim-nodejs-complete'

" javascriptのsyntaxカラー
NeoBundle 'pangloss/vim-javascript'



call neobundle#end()

NeoBundleCheck

" -------------------------------
" Rsense
" -------------------------------
" let g:rsenseHome = '/usr/local/lib/rsense-0.3'
" let g:rsenseUseOmniFunc = 1

" --------------------------------
" neocomplete.vim
" --------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
if !exists('g:neocomplete#force_omni_input_patterns')
  let g:neocomplete#force_omni_input_patterns = {}
endif
" let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

" --------------------------------
" rubocop
" --------------------------------
" syntastic_mode_mapをactiveにするとバッファ保存時にsyntasticが走る
" active_filetypesに、保存時にsyntasticを走らせるファイルタイプを指定する
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': ['ruby'] }
let g:syntastic_ruby_checkers = ['rubocop']

" --------------------------------
" quickrun
" --------------------------------
let g:quickrun_config = {'_': {"outputter/buffer/split" : ":botright"},}

" --------------------------------
"          Node.js　補完
" --------------------------------

autocmd FileType javascript setlocal omnifunc=nodejscomplete#CompleteJS
if !exists('g:neocomplcache_omni_functions')
  let g:neocomplcache_omni_functions = {}
endif
let g:neocomplcache_omni_functions.javascript = 'nodejscomplete#CompleteJS'

let g:node_usejscomplete = 1
" Ctrl + fで補完できるようにした
imap <C-f> <C-x><C-o>











" --------------------------------
" 基本設定
" --------------------------------
" vim内部で使われる文字エンコーディングをutf-8に設定する
set encoding=utf-8

" 想定される改行コードの指定する
set fileformats=unix,dos,mac

" ハイライトを有効化する
syntax enable

" ファイル形式の検出の有効化する
" ファイル形式別プラグインのロードを有効化する
" ファイル形式別インデントのロードを有効化する
filetype plugin indent on

" バックスペースで各種消せるようにする
set backspace=indent,eol,start

" 対応括弧の表示秒数を3秒にする
set matchtime=3

"vim全般の設定
set number "行に番号をつける設定
set title "タイトルの表示
syntax on "コード色分け
set ignorecase "大文字/小文字の区別なく検索する
set smartcase "検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan "検索時に最後まで行ったら最初に戻る
set clipboard+=unnamed " クリップボードを他のと連帯する

"インデントに関する設定
set expandtab "タブを複数のスペースに変更する
set autoindent "改行時に前の行のインデントを継続する
setlocal tabstop=4 shiftwidth=4 softtabstop=4 "~/.vim/indentに存在する設定以外の言語のインデント調整

"文字の色を変える
colorscheme molokai
let g:molokai_original = 1
let g:rehash256 = 1
set background=dark

" ------------------------------
" vimのペイストの使い勝手を修正
" ------------------------------
if &term =~ "xterm"
    let &t_ti .= "\e[?2004h"
    let &t_te .= "\e[?2004l"
    let &pastetoggle = "\e[201~"

    function XTermPasteBegin(ret)
        set paste
        return a:ret
    endfunction

    noremap <special> <expr> <Esc>[200~ XTermPasteBegin("0i")
    inoremap <special> <expr> <Esc>[200~ XTermPasteBegin("")
    cnoremap <special> <Esc>[200~ <nop>
    cnoremap <special> <Esc>[201~ <nop>
endif

" ---------------------------------
" マジックコメントを##で展開できる
" ---------------------------------
" function! MagicComment()
"     return "# -*- coding: utf-8 -*-\<CR>"
" endfunction
"
" inoreabbrev <buffer> ## <C-R>=MagicComment()<CR>



