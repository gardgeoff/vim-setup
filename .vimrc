set nocompatible

so ~/.vim/plugins.vim

set noerrorbells visualbell t_vb=

set autowriteall

"Set desired autcomplete matching
set complete=.,w,b,u




"--------Styling--------"

colorscheme atom-dark-256
"set line numbers"
set number

set tabstop=8
set expandtab
set softtabstop=4
set shiftwidth=4

"Set custom line background
highlight LineNr ctermbg=bg

"Expand blank space on left side
set foldcolumn=1
hi foldcolumn ctermbg=bg

"Set split"
hi vertsplit ctermfg=blue ctermbg=blue

"disable folding
set nofoldenable




"--------Search--------"

set hlsearch

set incsearch





"--------Split Management--------"

set splitbelow

set splitright

nmap <C-J> <C-W><C-J>

nmap <C-K> <C-W><C-K>

nmap <C-H> <C-W><C-H>

nmap <C-L> <C-W><C-L>





"--------Mappings--------"

"Install plugins"
nmap ,pi :PluginInstall<cr>

" Make it easy to edit the vimrc file"
nmap ,ev :tabedit $MYVIMRC<cr>

" Make it easy to edi the plugin file"
nmap ,ep :tabedit ~/.vim/plugins.vim<cr>

" Make it easy to edit the snippets file"

nmap ,es :e ~/.vim/snippets/<cr>

"Make NERDTree easier to toggle"
nmap <C-B> :NERDTreeToggle<cr> 

" Add simple highlight removal."
nmap ,<space> :nohlsearch<cr>

" Tag search"
nmap <c-T> :CtrlPBufTag<cr>

" Recently use files."
nmap <c-R> :CtrlPMRUFiles<cr>

" find with ctag "
nmap ,f :tag<space>





"--------Plugins--------"

"CtrlP"

let g:ctrlp_custom_ignore = 'node_modules\|git|DS_Store\'

let g:ctrlp_match_window = 'top,order:ttb,min:1,max:30,results:30'


"NERDTree"

let NERDTreeHijackNetrw=0

"Greplace
set grepprg=ag

"vim-php-cs-fixer
let g:php_cs_fixer_level = "psr2"
nnoremap <silent>,ff :w<cr> :call PhpCsFixerFixFile()<cr>

""PDV
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
nnoremap ,d :call pdv#DocumentWithSnip()<CR>



"--------Laravel-Specific--------"

"Edit Routes File
nmap ,lr :e routes/web.php<cr>

"Edit env file
nmap ,env :e .env<cr>

"Quick make command
nmap ,lm :!php artisan make:

"Edit controllers
nmap ,,c :e app/Http/Controllers/<cr>

"Edit in views 
nmap ,,v :e resources/views/<cr>

"Edit in models
nmap ,,m :e app/Models<cr>

"Search in tests
nmap ,,t :e tests/<cr>

"Search in feature tests
nmap ,,tf :e tests/Feature<cr>

"Search in unit tests
nmap ,,tu :e tests/Unit<cr>





"--------Auto-Commands--------"
"Automatically source the Vimrc file on save."
augroup autosourcing
	autocmd!
	autocmd BufWritePost .vimrc source %
augroup END




"--------Notes and Tips--------"

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap ,n <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>




"--------Notes and Tips--------"

"press zz to instantly center line
"press ,f to look for tag
"tn while looking for tag to go to next tag
"tp while looking for tag to go to previous tag
"ts while looking for tag to list tags
"n while searching (/) to go to next results p for previous
