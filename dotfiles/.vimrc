" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Make sure you use single quotes
:set number 
Plug 'plasticboy/vim-markdown'

Plug 'pangloss/vim-javascript'

Plug 'sheerun/vim-polyglot'

Plug 'itchyny/lightline.vim'

Plug 'terryma/vim-multiple-cursors'

Plug 'tpope/vim-surround'

Plug 'editorconfig/editorconfig-vim'

Plug 'mattn/emmet-vim'

Plug 'w0rp/ale'

Plug 'tpope/vim-fugitive'

Plug 'scrooloose/syntastic'

Plug 'airblade/vim-gitgutter'

Plug 'ctrlpvim/ctrlp.vim'

Plug 'easymotion/vim-easymotion'

Plug 'nathanaelkane/vim-indent-guides'

Plug 'neoclide/coc.nvim'

Plug 'chiel92/vim-autoformat'

Plug 'janko-m/vim-test'

Plug 'wincent/command-t'

Plug 'thaerkh/vim-workspace'

Plug 'othree/html5.vim'


" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
Plug 'junegunn/vim-easy-align'

" Any valid git URL is allowed
Plug 'https://github.com/junegunn/vim-github-dashboard.git'

" Multiple Plug commands can be written in a single line using | separators


" On-demand loading
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }

" Using a non-default branch
Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }

" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
Plug 'fatih/vim-go', { 'tag': '*' }

" Plugin options
Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }

" Plugin outside ~/.vim/plugged with post-update hook
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }


" Initialize plugin system
call plug#end()

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" s{char}{char} to move to {char}{char}
nmap s <Plug>(easymotion-overwin-f2)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)
map <C-o> :NERDTreeToggle<CR>

"----------------------------------------------------------------
"            _
"     _   __(_)___ ___  __________
"    | | / / / __ `__ \/ ___/ ___/
"   _| |/ / / / / / / / /  / /__
"  (_)___/_/_/ /_/ /_/_/   \___/
"
"----------------------------------------------------------------
"  Version : 2.2.2
"  License : MIT
"  Author  : Gerard Bajona
"  URL     : https://github.com/gerardbm/vimrc
"----------------------------------------------------------------
"  Index:
"   1. General settings
"   2. Plugins (Plug)
"   3. Plugins settings
"   4. User interface
"   5. Scheme and colors
"   6. Files and backup
"   7. Buffers management
"   8. Tabs management
"   9. Multiple windows
"  10. Indentation tabs
"  11. Moving around lines
"  12. Paste mode
"  13. Search, vimgrep and grep
"  14. Text edition
"  15. Make settings
"  16. Filetype settings
"  17. Helper functions
"  18. External tools integration
"----------------------------------------------------------------

"----------------------------------------------------------------
" 1. General settings
"----------------------------------------------------------------
" Disable vi compatibility
if !has("nvim")
	set nocompatible
endif

" Reload .vimrc
nnoremap <F12> :so $MYVIMRC<CR>

" Lines of memory to remember
set history=10000

" Leader key to add extra key combinations
let mapleader = ','
let g:mapleader = ','

" Time delay on <Leader> key
set timeoutlen=3000 ttimeoutlen=100

" Update time
set updatetime=250

" Trigger InsertLeave autocmd
inoremap <C-c> <Esc>

" No need for Ex mode
nnoremap Q <NOP>

" Open help in a vertical window
cnoreabbrev help vert help

" Terminal (nvim)
if has("terminal") && has("nvim")
	nnoremap <silent> <F7> :call <SID>ToggleTerminal()<CR>
	tnoremap <silent> <F7> <C-\><C-n><Bar>:wincmd p<CR>
	tnoremap <Esc> <C-\><C-n>
endif

" Set inc/dec
set nrformats-=octal

"----------------------------------------------------------------
" 2. Plugins (Plug)
"----------------------------------------------------------------
" List of plugins installed
call plug#begin('~/.vim/plugged')

	" Statusbar
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'

	" Git tools
	Plug 'airblade/vim-gitgutter'
	Plug 'tpope/vim-fugitive'
	Plug 'junegunn/gv.vim'

	" Sessions
	Plug 'xolox/vim-session'
	Plug 'xolox/vim-misc'

	" Tools
	Plug 'scrooloose/nerdcommenter'
	Plug 'scrooloose/nerdtree'
	Plug 'valloric/listtoggle'
	Plug 'majutsushi/tagbar'
	Plug 'ctrlpvim/ctrlp.vim'
	Plug 'mbbill/undotree'
	Plug 'dense-analysis/ale'

	" Autocomplete	
	Plug 'Shougo/neosnippet.vim', { 'commit': '037b7a7' }
	Plug 'Shougo/neosnippet-snippets'
	Plug 'Shougo/context_filetype.vim'
	Plug 'ervandew/supertab'

	" C/C++ support
	Plug 'deoplete-plugins/deoplete-clang', { 'commit': '30f17cb' }

	" Go support
	Plug 'fatih/vim-go', { 'tag': 'v1.19' }
	Plug 'nsf/gocode', { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
	Plug 'deoplete-plugins/deoplete-go', { 'commit': 'fa73f06'}

	" Perl support
	Plug 'c9s/perlomni.vim'

	" Python support
	Plug 'deoplete-plugins/deoplete-jedi', { 'commit': '46121d9' }

	" Ruby support
	Plug 'vim-ruby/vim-ruby'
	Plug 'tpope/vim-rails'
	Plug 'tpope/vim-endwise'
	Plug 'tpope/vim-liquid'

	" PHP support
	Plug 'shawncplus/phpcomplete.vim'

	" Haskell support
	Plug 'eagletmt/neco-ghc'

	" Rust support
	Plug 'racer-rust/vim-racer'

	" Zsh support
	Plug 'deoplete-plugins/deoplete-zsh', { 'commit': '12141ad' }

	" JavaScript support
	Plug 'ternjs/tern_for_vim', { 'do': 'npm install' }
	Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
	Plug 'othree/jspc.vim'
	Plug 'maksimr/vim-jsbeautify'

	" VimL support
	Plug 'Shougo/neco-vim', { 'commit' : '4c0203b' }

	" Additional syntax files
	Plug 'othree/html5.vim'
	Plug 'vim-language-dept/css-syntax.vim'
	Plug 'hail2u/vim-css3-syntax'
	Plug 'pangloss/vim-javascript'
	Plug 'Shougo/neco-syntax', { 'commit': '98cba4a' }
	Plug 'mboughaba/i3config.vim'
	Plug 'aklt/plantuml-syntax'
	Plug 'gerardbm/asy.vim'
	Plug 'gerardbm/eukleides.vim'

	" Edition
	Plug 'junegunn/vim-easy-align'
	Plug 'godlygeek/tabular'
	Plug 'jiangmiao/auto-pairs'
	Plug 'alvan/vim-closetag'
	Plug 'tpope/vim-surround'
	Plug 'tpope/vim-repeat'
	Plug 'tpope/vim-capslock'
	Plug 'wellle/targets.vim'
	Plug 'christoomey/vim-sort-motion'
	Plug 'terryma/vim-expand-region'
	Plug 'Valloric/MatchTagAlways'
	Plug 'FooSoft/vim-argwrap'
	Plug 'gerardbm/vim-md-headings'
	Plug 'matze/vim-move'

	" Misc
	Plug 'christoomey/vim-tmux-navigator'
	Plug 'tpope/vim-characterize'
	Plug 'tyru/open-browser.vim'
	Plug 'junegunn/goyo.vim'
	Plug 'mattn/webapi-vim'
	Plug 'mattn/emmet-vim'
	Plug 'vimwiki/vimwiki', { 'branch': 'master' }

	" Color schemes
	Plug 'gerardbm/vim-atomic'

call plug#end()

"----------------------------------------------------------------
" 3. Plugins settings
"----------------------------------------------------------------
" --- Statusbar ---
" Airline settings
let g:airline_theme                       = 'atomic'
let g:airline_powerline_fonts             = 1
let g:airline#extensions#tabline#enabled  = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_section_z                   = airline#section#create([
			\ '%1p%% ',
			\ 'Ξ%l%',
			\ '\⍿%c'])
call airline#parts#define_accent('mode', 'black')

" --- Git tools ---
" Gitgutter settings
let g:gitgutter_max_signs             = 5000
let g:gitgutter_sign_added            = '+'
let g:gitgutter_sign_modified         = '»'
let g:gitgutter_sign_removed          = '_'
let g:gitgutter_sign_modified_removed = '»╌'
let g:gitgutter_map_keys              = 0
let g:gitgutter_diff_args             = '--ignore-space-at-eol'

nmap <Leader>j <Plug>(GitGutterNextHunk)zz
nmap <Leader>k <Plug>(GitGutterPrevHunk)zz
nnoremap <silent> <C-g> :call <SID>ToggleGGPrev()<CR>zz
nnoremap <Leader>gs :GitGutterStageHunk<CR>
nnoremap <Leader>gu :GitGutterUndoHunk<CR>

" Fugitive settings
nnoremap <C-s> :call <SID>ToggleGstatus()<CR>
nnoremap <Leader>gv :Gvdiffsplit<CR>:windo set wrap<CR>
nnoremap <Leader>gh :Gvdiffsplit HEAD<CR>:windo set wrap<CR>
nnoremap <Leader>gb :Gblame<CR>

" Searching for text added or removed by a commit
nnoremap <Leader>gg :call <SID>GrepWrapper('Glog', '-i -G', '--')<CR>

" GV settings
nnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>
vnoremap <silent> <Leader>gz :call <SID>PreventGV()<CR>

" --- Sessions ---
" Vim-session settings
let g:session_autosave  = 'no'
let g:session_autoload  = 'no'
let g:session_directory = '~/.vim/sessions/'

nnoremap <C-b> :OpenSession<CR>

" --- Tools ---
" NERDCommenter settings
let g:NERDDefaultAlign          = 'left'
let g:NERDSpaceDelims           = 1
let g:NERDCompactSexyComs       = 1
let g:NERDCommentEmptyLines     = 0
let g:NERDCreateDefaultMappings = 0
let g:NERDCustomDelimiters      = {
	\ 'python': {'left': '#'},
	\ }

nnoremap cc :call NERDComment(0,'toggle')<CR>
vnoremap cc :call NERDComment(0,'toggle')<CR>

" NERDTree settings
nnoremap <silent> <C-n> :call <SID>ToggleNERDTree()<CR>

" ALE settings
let g:ale_sign_column_always = 1
let g:ale_linters            = {
	\ 'c'          : ['clang'],
	\ 'python'     : ['pylint'],
	\ 'javascript' : ['jshint'],
	\ 'css'        : ['csslint'],
	\ 'tex'        : ['chktex'],
	\ }

" Navigate between errors
nnoremap <Leader>h :lprevious<CR>zz
nnoremap <Leader>l :lnext<CR>zz

" Listtoggle settings
let g:lt_location_list_toggle_map = '<leader>e'
let g:lt_quickfix_list_toggle_map = '<leader>q'

" Tagbar toggle (custom function)
nnoremap <silent> <C-t> :call <SID>ToggleTagbar()<CR>
let g:tagbar_autofocus        = 1
let g:tagbar_show_linenumbers = 2
let g:tagbar_sort             = 0

" CtrlP settings
let g:ctrlp_map                 = '<C-p>'
let g:ctrlp_cmd                 = 'CtrlPBuffer'
let g:ctrlp_working_path_mode   = 'rc'
let g:ctrlp_custom_ignore       = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_match_window        = 'bottom,order:btt,min:1,max:10,results:85'
let g:ctrlp_show_hidden         = 1
let g:ctrlp_follow_symlinks     = 1
let g:ctrlp_open_multiple_files = '0i'
let g:ctrlp_prompt_mappings     = {
	\ 'PrtHistory(1)'        : [''],
	\ 'PrtHistory(-1)'       : [''],
	\ 'ToggleType(1)'        : ['<C-l>', '<C-up>'],
	\ 'ToggleType(-1)'       : ['<C-h>', '<C-down>'],
	\ 'PrtCurLeft()'         : ['<C-b>', '<Left>'],
	\ 'PrtCurRight()'        : ['<C-f>', '<Right>'],
	\ 'PrtBS()'              : ['<C-s>', '<BS>'],
	\ 'PrtDelete()'          : ['<C-d>', '<DEL>'],
	\ 'PrtDeleteWord()'      : ['<C-w>'],
	\ 'PrtClear()'           : ['<C-u>'],
	\ 'ToggleByFname()'      : ['<C-g>'],
	\ 'AcceptSelection("e")' : ['<C-m>', '<CR>'],
	\ 'AcceptSelection("h")' : ['<C-x>'],
	\ 'AcceptSelection("t")' : ['<C-t>'],
	\ 'AcceptSelection("v")' : ['<C-v>'],
	\ 'OpenMulti()'          : ['<C-o>'],
	\ 'MarkToOpen()'         : ['<c-z>'],
	\ 'PrtExit()'            : ['<esc>', '<c-c>', '<c-p>'],
	\ }

" Undotree toggle
nnoremap <Leader>u :UndotreeToggle<CR>

" --- Languages ---
" Go settings
let g:go_highlight_functions         = 1
let g:go_highlight_methods           = 1
let g:go_highlight_fields            = 1
let g:go_highlight_types             = 1
let g:go_highlight_operators         = 1
let g:go_highlight_build_constraints = 1
let g:go_bin_path                    = expand('~/.gotools')
let g:go_list_type                   = 'quickfix'
let g:go_version_warning             = 0 " Keep until vim v8.0.1453, nvim v3.2

" CSS3 settings
augroup VimCSS3Syntax
	autocmd!
	autocmd FileType css setlocal iskeyword+=-
augroup END

" Javascript settings
let g:javascript_plugin_jsdoc = 1
let g:javascript_plugin_ngdoc = 1
let g:javascript_plugin_flow  = 1

" Tern_for_vim settings
let g:tern#command   = ['tern']
let g:tern#arguments = ['--persistent']

" JS-Beautify
let g:config_Beautifier = {}
let g:config_Beautifier['js'] = {}
let g:config_Beautifier['js'].indent_style = 'tab'
let g:config_Beautifier['jsx'] = {}
let g:config_Beautifier['jsx'].indent_style = 'tab'
let g:config_Beautifier['json'] = {}
let g:config_Beautifier['json'].indent_style = 'tab'
let g:config_Beautifier['css'] = {}
let g:config_Beautifier['css'].indent_style = 'tab'
let g:config_Beautifier['html'] = {}
let g:config_Beautifier['html'].indent_style = 'tab'

augroup beautify
	autocmd!
	autocmd FileType javascript nnoremap <buffer> <Leader>bf :call JsBeautify()<cr>
	autocmd FileType javascript vnoremap <buffer> <Leader>bf :call RangeJsBeautify()<cr>
	autocmd FileType json nnoremap <buffer> <Leader>bf :call JsonBeautify()<cr>
	autocmd FileType json vnoremap <buffer> <Leader>bf :call RangeJsonBeautify()<cr>
	autocmd FileType jsx nnoremap <buffer> <Leader>bf :call JsxBeautify()<cr>
	autocmd FileType jsx vnoremap <buffer> <Leader>bf :call RangeJsxBeautify()<cr>
	autocmd FileType html nnoremap <buffer> <Leader>bf :call HtmlBeautify()<cr>
	autocmd FileType html vnoremap <buffer> <Leader>bf :call RangeHtmlBeautify()<cr>
	autocmd FileType css nnoremap <buffer> <Leader>bf :call CSSBeautify()<cr>
	autocmd FileType css vnoremap <buffer> <Leader>bf :call RangeCSSBeautify()<cr>
augroup end

" --- Autocomplete ---
" SuperTab settings
let g:SuperTabDefaultCompletionType = '<TAB>'

" Deoplete settings
" - «Deoplete requires Neovim with Python3 enabled»
let g:python3_host_prog       = '/usr/bin/python3'
let g:python3_host_skip_check = 1

autocmd CompleteDone * if pumvisible() == 0 | pclose | endif
let g:deoplete#enable_at_startup = 1
let g:deoplete#enable_smart_case = 1
let g:deoplete#omni#functions    = {}


inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"

" Python autocompletion
let g:deoplete#sources#jedi#show_docstring = 1

" Go autocompletion
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
let g:deoplete#sources#go#sort_class    = ['package', 'func', 'type', 'var', 'const']
let g:deoplete#sources#go#use_cache     = 1

" Javascript autocompletion
let g:deoplete#omni#functions.javascript = [
	\ 'tern#Complete',
	\ 'jspc#omni',
	\ ]

" Clang autocompletion
let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-4.0/lib/libclang.so'
let g:deoplete#sources#clang#clang_header = '/usr/lib/clang'

" --- Snippets ---
" Neosnippet settings
imap <C-s> <Plug>(neosnippet_expand_or_jump)
smap <C-s> <Plug>(neosnippet_expand_or_jump)
xmap <C-s> <Plug>(neosnippet_expand_target)

" Behaviour like SuperTab
smap <expr><TAB>
	\ neosnippet#expandable_or_jumpable() ?
	\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" For conceal markers
if has('conceal')
	set conceallevel=0 concealcursor=niv
	nnoremap <silent> coi :set conceallevel=0<CR>:set concealcursor=niv<CR>
	nnoremap <silent> coo :set conceallevel=2<CR>:set concealcursor=vc<CR>
	nnoremap <silent> cop :set conceallevel=2<CR>:set concealcursor=niv<CR>
	nnoremap <silent> com :set conceallevel=3<CR>:set concealcursor=niv<CR>
endif

augroup all
	autocmd InsertLeave * NeoSnippetClearMarkers
augroup end

" --- Edition ---
" Easy align settings
xmap gi <Plug>(EasyAlign)
nmap gi <Plug>(EasyAlign)

" Tabularize (e.g. /= or /:)
vnoremap <Leader>x :Tabularize /

" Tabularize only the first match on the line (e.g. /=.*/)
vnoremap <Leader>X :Tabularize /.*/<Left><Left><Left>

" Auto-pairs settings
" Maps for normal and insert modes
let g:AutoPairsFlyMode        = 0
let g:AutoPairsMultilineClose = 0
let g:AutoPairsShortcutJump   = '<C-z>'
let g:AutoPairsShortcutToggle = '<C-q>'

" Workaround to fix an Auto-pairs bug until it gets fixed
if has("nvim")
	autocmd VimEnter,BufEnter,BufWinEnter * silent! iunmap <buffer> <M-">
endif

" Closetag settings
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.xml,*.html.erb'

" Surround settings
" Use 'yss?', 'yss%' or 'yss=' to surround a line
autocmd FileType php let b:surround_{char2nr('p')} = "<?php \r ?>"
autocmd FileType erb let b:surround_{char2nr('=')} = "<%= \r %>"
autocmd FileType erb let b:surround_{char2nr('-')} = "<% \r %>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('=')} = "{% \r %}"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('-')} = "{%- \r -%}"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('u')} = "<u>\r</u>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('d')} = "<del>\r</del>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('k')} = "<kbd>\r</kbd>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('n')} = "<sub>\r</sub>"
autocmd FileType html,markdown,liquid let b:surround_{char2nr('p')} = "<sup>\r</sup>"
autocmd FileType markdown,liquid let b:surround_{char2nr('i')} = "_\r_"
autocmd FileType markdown,liquid let b:surround_{char2nr('o')} = "**\r**"
autocmd FileType markdown,liquid let b:surround_{char2nr('h')} = "\[\r\]\(//\)"
autocmd FileType markdown,liquid let b:surround_{char2nr('c')} = "“\r”"
autocmd FileType markdown,liquid let b:surround_{char2nr('v')} = "‘\r’"
autocmd FileType markdown,liquid let b:surround_{char2nr('x')} = "«\r»"
autocmd FileType markdown,liquid let b:surround_{char2nr('e')} = "\[\r\]
			\\(\){:rel=\"nofollow noopener noreferrer\" target=\"_blank\"}"
autocmd FileType markdown,liquid let b:surround_{char2nr('j')} = "\![\r\]
			\\(/images/\){: .align-}"

" Caps Lock settings
imap <expr><C-l> deoplete#smart_close_popup()."\<Plug>CapsLockToggle"
cmap <silent> <C-l> <Plug>CapsLockToggle

" Expand region settings
vmap v <Plug>(expand_region_expand)
vmap <C-v> <Plug>(expand_region_shrink)

" MatchTagAlways settings
let g:mta_filetypes = {
	\ 'html'  : 1,
	\ 'xhtml' : 1,
	\ 'xml'   : 1,
	\ 'jinja' : 1,
	\ 'php'   : 1,
	\ }

" ArgWrap settings
let g:argwrap_tail_comma    = 1
let g:argwrap_padded_braces = '[{'

nnoremap <Leader>W :ArgWrap<CR>

" Vim-move settings. Use Shift
let g:move_key_modifier = 'S'

" --- Misc ---
" Vim-tmux navigator settings
let g:tmux_navigator_no_mappings = 1

" Open-browser settings
let g:openbrowser_browser_commands = [{
	\ 'name': 'w3m',
	\ 'args': 'tmux new-window w3m {uri}',
	\ }]

nmap <Leader>gl <Plug>(openbrowser-open)

" Goyo settings
let g:goyo_width  = "80"
let g:goyo_height = "100%"
let g:goyo_linenr = 0

nnoremap <F11> :Goyo<CR>

" Vimwiki settings
let g:vimwiki_url_maxsave   = 0
let g:vimwiki_global_ext    = 0
let g:vimwiki_syntax        = 'markdown'
let g:vimwiki_list          = [
	\ {'path': '~/Workspace/vimwiki'},
	\ {'path': '~/Workspace/vimwiki/Articles'},
	\ {'path': '~/Workspace/vimwiki/Codes'},
	\ {'path': '~/Workspace/vimwiki/Notes'},
	\ {'path': '~/Workspace/vimwiki/Projects'},
	\ {'path': '~/Workspace/vimwiki/Studies'},
	\ {'path': '~/Workspace/vimwiki/ToDos'},
	\ {'path': '~/Workspace/vimwiki/Unix'}
	\ ]

nnoremap <Leader>we :VimwikiToggleListItem<CR>
vnoremap <Leader>we :VimwikiToggleListItem<CR>

"----------------------------------------------------------------
" 4. User interface
"----------------------------------------------------------------
" Set X lines to the cursor when moving vertically
set scrolloff=0

" Always show mode
set showmode

set mouse=a

" Highlight cursor line and cursor column
set cursorline
set nocursorcolumn

" Always show the status line
set laststatus=2

" Change the cursor shape
if !has("nvim")
	let &t_SI = "\<Esc>[6 q"
	let &t_SR = "\<Esc>[4 q"
	let &t_EI = "\<Esc>[2 q"
else
	set guicursor=n-v:block-Cursor/lCursor-blinkon0
	set guicursor+=i-ci-c:ver100-Cursor/lCursor-blinkon0
	set guicursor+=r-cr:hor100-Cursor/lCursor-blinkon0
endif

" Omni completion
if has('autocmd') && exists('+omnifunc')
autocmd Filetype *
	\ if &omnifunc == "" |
	\     setlocal omnifunc=syntaxcomplete#Complete |
	\ endif
endif

" Fix italics issue
if !has("nvim")
	let &t_ZH="\e[3m"
	let &t_ZR="\e[23m"
endif

"----------------------------------------------------------------
" 5. Scheme and colors
"----------------------------------------------------------------
" True color
" if !has("nvim")
"   if has("termguicolors")
"       let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
"       let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
"       set termguicolors
"   endif
" else
"   set termguicolors
" endif

" Syntax highlighting
syntax enable

" Color scheme
colorscheme atomic

" Show syntax highlighting groups
nnoremap <Leader>B :call <SID>SynStack()<CR>

"----------------------------------------------------------------
" 6. Files and backup
"----------------------------------------------------------------
" Disable swap files
set noswapfile

" No backup (use Git instead)
set nobackup

" Prevents automatic write backup
set nowritebackup

" Use UTF-8 as default encoding
set encoding=utf8

" Use Unix as the standard file type
set fileformats=unix,dos,mac

" Autoread a file when it is changed from the outside
set autoread

" Reload a file when it is changed from the outside
let g:f5msg = 'Buffer reloaded.'
nnoremap <F5> :e<CR>:echo g:f5msg<CR>

" Enable filetype plugins
filetype plugin on
filetype indent on

" Allow us to use Ctrl-s and Ctrl-q as keybinds
" Restore default behaviour when leaving Vim.
if !has("nvim")
	silent !stty -ixon
	autocmd VimLeave * silent !stty ixon
endif

" Save the current buffer
nnoremap <Leader>s :update<CR>

" Save all buffers
nnoremap <Leader>S :bufdo update<CR>

" :W sudo saves the file
" (useful for handling the permission-denied error)
cnoremap WW w !sudo tee > /dev/null %

" Rename file
nnoremap <F2> :call <SID>RenameFile()<CR>

" Work on buffer
nnoremap yab :%y<CR>
nnoremap Yab :%y +<CR>
nnoremap dab :%d<CR>
nnoremap vab ggVG

"----------------------------------------------------------------
" 7. Buffers management
"----------------------------------------------------------------
" Buffer hidden when it is abandoned
set hidden

" Close the current buffer
nnoremap <Leader>bd :call <SID>CustomCloseBuffer()<CR>

" Move between buffers
nnoremap <C-h> :bprev<CR>
nnoremap <C-l> :bnext<CR>

" Edit and explore buffers
nnoremap <Leader>bb :edit <C-R>=expand("%:p:h")<CR>/
nnoremap <Leader>bg :buffers<CR>:buffer<Space>

" Switch CWD to the directory of the current buffer
nnoremap <Leader>bw :lcd %:p:h<CR>:pwd<CR>

" Copy the filepath to clipboard
nnoremap <Leader>by :let @+=expand("%:p")<CR>

" Ignore case when autocompletes when browsing files
set fileignorecase

" Specify the behavior when switching between buffers
try
	set switchbuf=useopen,usetab,newtab
	set showtabline=2
catch
endtry

" Remember info about open buffers on close
" set viminfo^=%

"----------------------------------------------------------------
" 8. Tabs management
"----------------------------------------------------------------
" Create and close tabs
nnoremap <Leader>td :tabclose<CR>
nnoremap <Leader>to :tabonly<CR>

" Open a new tab with the current buffer's patuf=useopen

" --- Replace ---
"--------------------------------etype =~# 'javascript'
	" Show command keys pressed
set showcmd

" Enable the WiLd menu
set wildmenu

" Show the current position
set ruler

" Command bar height
set cmdheight=2

" Backspace works on Insert mode
set backspace=eol,start,indent

" Don't redraw while executing macros (good performance config)
set lazyredraw

" Show matching brackets when text indicator is over them
set showmatch

" How many tenths of a second to blink when matching brackets
set matchtime=2

" No annoying sound on errors
set noerrorbells
set novisualbell


