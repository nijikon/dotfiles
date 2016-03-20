set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'
Plugin 'scrooloose/syntastic'
Plugin 'vim-ruby/vim-ruby'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'kien/ctrlp.vim'
Plugin 'mileszs/ack.vim'
Plugin 'kchmck/vim-coffee-script'
Plugin 'digitaltoad/vim-pug'

call vundle#end()

syntax on                 " Enable syntax highlighting
filetype plugin indent on " Enable filetype-specific indenting and plugins

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml,less,python,php,html,js,css,axlsx,scss,coffee,jade setlocal ai sw=2 sts=2 et
  autocmd FileType js setlocal ai sw=4 sts=4 et
augroup END

" set tw=80
set nocompatible
set nofoldenable
set hidden
set shiftround

set backspace=indent,eol,start

set backupdir=~/.tmp
set directory=~/.tmp " Don't clutter my dirs up with swp and tmp files

set laststatus=2
set stl=%{fugitive#statusline()}\ %f\ %m\ %r\ %=\ Line:%l/%L[%p%%]\ Col:%v\ Buf:#%n
hi StatusLine ctermfg=black ctermbg=yellow
hi StatusLineNC ctermfg=black ctermbg=green

" hi OverLength ctermbg=red ctermfg=white guibg=#592929
" match OverLength /\%81v.\+/

let mapleader = ","

map <Leader>t :NERDTreeToggle<CR>
map <Leader>b :b#<CR>
map <Leader>db :e config/database.yml<CR>
map <Leader>s :Ack
map <Leader>d o<cr>debugger<cr><esc>:w<cr>
map <Leader>D O<cr>debugger<cr><esc>:w<cr>

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|\.bundle|log|tmp|coverage)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
let g:ackprg="ack -H --nocolor --nogroup --column --ignore-dir .bundle --ignore-dir coverage --ignore-dir log --ignore-dir tmp"
let g:syntastic_ruby_checkers = ['mri', 'rubocop']
let g:syntastic_js_checkers = ['jslint', 'jshint']
let g:syntastic_coffee_checkers = ['coffeelint']
let g:syntastic_jade_checkers = ['jade_lint']

" Remove trailing whitespace on save for ruby files.
au BufWritePre * :%s/\s\+$//e
au BufNewFile,BufRead *.axlsx set filetype=ruby

" Unbind the cursor keys in insert, normal and visual modes.
for prefix in ['i', 'n', 'v']
  for key in ['<up>', '<down>', '<left>', '<right>']
    exe prefix . "noremap " . key . " <nop>"
  endfor
endfor
