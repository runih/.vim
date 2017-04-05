version 8.0
" set the runtime path to include Vundle and initialize
set encoding=utf-8
set shell=bash
call plug#begin('~/.vim/plugged')
" Plugs

" Importanted plugins
Plug 'tomtom/tlib_vim'
Plug 'xolox/vim-misc'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tmhedberg/matchit'
Plug 'tomtom/tcomment_vim'
Plug 'Rip-Rip/clang_complete'
Plug 'godlygeek/tabular'
Plug 'sjl/gundo.vim'
Plug 'terryma/vim-multiple-cursors'

" Search helpers
Plug 'ctrlpvim/ctrlp.vim' ", { 'tag': '1.79' }
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'ggreer/the_silver_searcher'
Plug 'jremmen/vim-ripgrep'
Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'


" Rails support
Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'ngmy/vim-rubocop'
Plug 'thoughtbot/vim-rspec'
Plug 'wfleming/vim-codeclimate'
Plug 'itmammoth/run-rspec.vim'
Plug 'tpope/vim-rbenv'

" Git plugins
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'junegunn/gv.vim'

" Snippets support
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'

" Format support
Plug 'elzr/vim-json'
Plug 'plasticboy/vim-markdown'

" Visual plugins
Plug 'junegunn/limelight.vim'

" Testing
" Plug 'jfelchner/neomake'
Plug 'majutsushi/tagbar'

if !has('nvim')
Plug 'xolox/vim-session'
Plug 'Shougo/neocomplete'
else
Plug 'Shougo/deoplete.nvim'
endif

" Colorschemes
Plug 'chankaward/vim-railscasts-theme'

" All of your Plugs must be added before the following line
call plug#end()            " required
filetype plugin indent on    " required

let g:rspec_command = "!bundle exec rspec {spec}"

let g:neocomplete#enable_at_startup = 1

let g:session_autosave='no'

let ruby_space_errors=1
let c_space_errors=1
set listchars=tab:▸\ ,eol:¬
" Invisible charcter colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4a59

if has('nvim')
function! s:fzf_statusline()
  " Override statusline as you like
  highlight fzf1 ctermfg=161 ctermbg=251
  highlight fzf2 ctermfg=23 ctermbg=251
  highlight fzf3 ctermfg=237 ctermbg=251
  setlocal statusline=%#fzf1#\ >\ %#fzf2#fz%#fzf3#f
endfunction

autocmd! User FzfStatusLine call <SID>fzf_statusline()
endif

nnoremap <F5> :GundoToggle<CR>
nmap <F8> :TagbarToggle<CR>

" Only do this part when compiled with support for autocommands
if has("autocmd")
	" Enable file type detection
	filetype on

	" Syntax of these languages is fussy over tabs vs spaces
	autocmd FileType make setlocal ts=8 sts=8 sw=8 noexpandtab
	autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType ruby setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType eruby setlocal ts=2 sts=2 sw=2 expandtab

	" Customisations based on house-style (arbitrary)
	autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType css setlocal ts=2 sts=2 sw=2 expandtab
	autocmd FileType javascript setlocal ts=2 sts=2 sw=2 expandtab

	" Treat .rss files as XML
	autocmd BufNewFile,BufRead *.rss,*.atom set filetype=xml

	autocmd BufReadPost fugitive://* set bufhidden=delete
	" source .vimrc if it is changed
	autocmd bufwritepost .gvimrc source ~/.gvimrc
	autocmd bufwritepost .vimrc source $MYVIMRC

	" Treat .sql files as psql files
	autocmd BufNewFile,BufRead *.sql set filetype=pgsql

	" Treat .sql files as psql files
	autocmd BufNewFile,BufRead *.fish set filetype=fish
endif
set relativenumber
set number
set history=700
set fileencoding=utf-8
set encoding=utf-8
set termencoding=utf-8
set fileencodings=utf-8,iso8859-1
set nocompatible
set showcmd
set undofile
let mapleader="§"
filetype plugin on          " plugins are enabled
filetype plugin indent on
syntax on
set wildmenu
highlight Visual ctermfg=1  ctermbg=none cterm=bold
let s:cpo_save=&cpo
set cpo&vim

" NERDTree Settings
let g:netrw_preview = 1
let NERDTreeShowLineNumbers=1
auto FileType nerdtree setlocal relativenumber
nnoremap ,, :NERDTreeFind<CR>

map! <xHome> <Home>
map! <xEnd> <End>
map! <S-xF4> <S-F4>
map! <S-xF3> <S-F3>
map! <S-xF2> <S-F2>
map! <S-xF1> <S-F1>
map! <xF4> <F4>
map! <xF3> <F3>
map! <xF2> <F2>
map! <xF1> <F1>
map Q gq
map <xHome> <Home>
map <xEnd> <End>
map <S-xF4> <S-F4>
map <S-xF3> <S-F3>
map <S-xF2> <S-F2>
map <S-xF1> <S-F1>
map <xF4> <F4>
map <xF3> <F3>
map <xF2> <F2>
map <xF1> <F1>
map <F4> <C-W><Up>
map <F5> <C-W><Down>
map <F6> :bp<CR>
map <F7> :bn<CR>
map <F3> :set hlsearch!<CR>
map <leader>r :w<cr>:!rubocop %<cr>
map <leader>t :w<cr>:call RunNearestSpec()<CR>
let &cpo=s:cpo_save
unlet s:cpo_save
set nowrap
set autoindent
set background=dark
set backspace=2
set backup
set backupdir=~/.vim/backup
set dir=~/.vim/tmp
if &filetype != 'vim'
set filetype=vim
endif
if &syntax != 'help'
set syntax=help
endif
set viminfo='20,\"50
" Visual Cues

" do not highlight searched phrases
set nohlsearch

"but do highlight as you type you search phrase
set incsearch

" what to show when I hit :set list
"set listchars=tab:\|\ ,trail:.,extends:>,precedes:<,eol:$

" Tips from 'How to do 90% of What Plugins Do (With Just Vim)'
set path+=**
command! MakeTags !~/bin/ror_ctags
"set tags+=~/Projects/RoR/tags
nnoremap ,a :AgFromSearch<CR>

"set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]
set ts=4 sts=4 sw=4 noexpandtab
set laststatus=2
set showtabline=0
set ruler
set statusline=[%{tabpagenr()}:%n]\ %f\ %{fugitive#statusline()}\ %(\ %M%R%H)%)%=%{KeyboardLayout()}\ %{ProjectName()}\ [%{&ff}]\ [%Y]\ =Pos=<%l,%c%V>\ %P
hi StatusLine	cterm=bold ctermbg=blue ctermfg=yellow guibg=gold guifg=blue
hi StatusLineNC	cterm=bold ctermbg=blue ctermfg=grey  guibg=gold guifg=blue
hi NonText term=bold ctermfg=Blue gui=bold guifg=gray guibg=white
hi Cursor guibg=fg guifg=bg
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="100,".join(range(400,999),",")

:set dictionary+=dict.file
:set dictionary+=%
:set iskeyword+=:
:set complete+=k

" CodeClimate
nmap <Leader>aa :CodeClimateAnalyzeProject<CR>
nmap <Leader>ao :CodeClimateAnalyzeOpenFiles<CR>
nmap <Leader>af :CodeClimateAnalyzeCurrentFile<CR>

nmap <C-S-P> :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

let g:clang_library_path = '/Applications/Xcode.app/Contents/Developer/Toolchains/XcodeDefault.xctoolchain/usr/lib'
if has('nvim')
	colorscheme molokai
	if exists("syntax_on")
		syntax reset
	endif
endif

function! ProjectName()
	 let project_path =  split(getcwd(), '/')
	 if project_path[-2] == 'Projects' || project_path[-2] == 'RoR'
		 return '[' . project_path[-1] . ']'
	 else
		 return ''
	 end
endfunc

function! KeyboardLayout()
	return '[' . system('~/bin/keyboard_layout') . ']'
endfunc
