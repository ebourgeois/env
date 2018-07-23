"" Options                                                                  {{{
    syn on
    set t_Co=256
    set t_AB=^[[48;5;%dm
    set t_AF=^[[38;5;%dm
    "set term=putty-256color
    set term=xterm-256color
    set textwidth=80
    set backspace=indent,eol,start
    set nobackup        " do not keep a backup file, use versions instead
    set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 

    set history=50        " keep 50 lines of command line history
    set ruler        " show the cursor position all the time
    set showcmd        " display incomplete commands
    set showmatch           " show matching brace
    set sh=bash             " set shell to tcsh
    "set shellredir=\>\&     " change default redir of shell to include stderr
    set grepprg=grep\ -ni   " define grep program
    set expandtab
    set shiftwidth=4
    set visualbell
    behave xterm                      " Don't be like windows
    syn on                            " Enable Syntax highlighting
    syntax on
    set autoindent                    " Copy indent from current line when starting a new line
    set nocompatible                  " Take advantage of vim features not present in vi
    set nowrap                        " Turn off autowrapping
    set bs=2                          " Allow backspacing over everything in insert mode
    set cmdheight=1                   " Set height of command line to 2 lines
    set ignorecase                    " Ignore case for searches
    set showmode                      " Show mode (insert, replace, etc.)
    set showmatch                     " Show matching brace
    set grepprg=grep\ -i              " Define grep program
    set tabstop=4                     " Set tabs to 4 chars
    set shiftwidth=4                  " Set shiftwidth to 4 chars
    set hardtabs=4                    " Set hardtabs to 4 chars
    filetype plugin on                " Load filetype plugins from .vim/after/ftplugin
    let loaded_matchparen=0           " Disable the standard matchparen plugin
    "set shellredir=\>\&              " Change default redir of shell to include stderr
    " show line numbers
    set nonu
    set mouse=n
    " ##############################################
    " Status Bar
    " ##############################################
    " Always show status line
    set ls=2

    set directory=~/.vim/tmp,~/.tmp,~/tmp,/var/tmp,/tmp 
    " reload files modified outside of vim
    set autoread

    set visualbell   
    "set nopaste
    "set guifont=-Misc-Fixed-Medium-R-Normal--13-120-75-75-C-70-ISO8859-9
    "set clipboard=unnamed,autoselect
    set nomesg
    set autoprint
    set pt=<F8>
    " Fix Termcap so function keys work
    if &term == "ansi"
        set t_k1=[M
        set t_k2=[N
        set t_k3=[O
        set t_k4=[P
        set t_k5=[Q
        set t_k6=[R
        set t_k7=[S
        set t_k8=[T
        set t_k9=[U
    endif

    set hlsearch
    let loaded_matchparen=0

    filetype on
    filetype plugin on
    filetype indent on
    set omnifunc=syntaxcomplete#Complete
    set iskeyword+=:
    "
    " ##############################################
    " Search
    " ##############################################
    " start searching immediate
    set incsearch
    " ignore cases
    set ignorecase
    " unless you put a capital letter in the search
    set smartcase

    " ##############################################
    " Formatting
    " ##############################################
    filetype plugin indent on

    set wildmenu wildmode=full
    set background=dark
    set cindent  " cin:  Use C-indenting
    set cinoptions=t0,+4,(0,)60,u0,*100,j1  " cino:  all sorts of options
    set cinwords=if,else,while,do,for,elsif,sub,fi
    set cinkeys=0{,0},0),!^F,o,O,e  " cink:  Perl-friendly reindent keys
    set comments=n:#  " com:  Perlish comments
    set nosmartindent  " nosi:  Smart indent useless when C-indent is on
" }}}

" Pathogen      {{{
filetype plugin indent on
call pathogen#infect() 
" }}}

" Global Abbreviations                                                     {{{
    ca rc e $HOME/.vimrc
    ca te e $HOME/.vim/dev/test.vim
    ca ss source ~/sessions/scratch
    ca ln e $HOME/twiki/.outline.twiki
    map K mqgqap`q
" }}}

" Fio_Grep                                                                 {{{
function! Fio_Grep()

        " See :he special-buffers for an explanation of this.
        " next 3 lines creates a scratch buffer.
        enew 
        setlocal buftype=nofile
        setlocal bufhidden=hide
        setlocal noswapfile
        " Creates an unlisted buffer.
        setlocal nobuflisted 

    let s:file_name = input("Enter filename pattern: ")
    execute ".!grep -P '" . s:file_name . "' ~/dev/secadmin/index"  
endf

"map <F12> :call Fio_Grep()<CR>

" }}}

" AutoCommands                                                             {{{
if !exists("autocommands_loaded")
    let autocommands_loaded = 1
    " set verbose=9 " Uncomment this line to debug autcmnds.
     
    " Always lcd to the directory of the current file.
    au BufEnter * silent! :lcd %:p:h 

    " Always jump to the last known cursor position.
    autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

    " Automatically Save and Restore Folds
    au BufWinLeave * silent! mkview
    au BufWinEnter * silent! loadview

endif
" }}}

" Termcap                                                                  {{{
"if &term == "ansi"
"    set t_k1=[M
"    set t_k2=[N
"    set t_k3=[O
"    set t_k4=[P
"    set t_k5=[Q
"    set t_k6=[R
"    set t_k7=[S
"    set t_k8=[T
"    set t_k9=[U
"endif
" }}}

" Hilight                                                                  {{{
    hi! link Folded Error
    hi! Comment term=bold ctermfg=yellow
    hi! link directory Comment
    hi! link Statement Question
    hi! link Constant ModeMsg
    hi! link Search Fold
    hi String ctermfg=red
    hi ColorColumn ctermbg=magenta
    "hi! link directory Comment
    "hi! link Statement Question
    hi! link Constant ModeMsg
    "hi! link Search Fold
    hi normal guibg=LightYellow
    "hi Search term=standout ctermfg=0 ctermbg=3
    hi! perlMethod ctermfg=white
" }}}

" HTML Functions {{{
function Addtag()
    let $tag = input ("Enter Tag: ")
    let @x = "<" . $tag . ">" . @@ . "</" . $tag . ">"
    let @t = '"xP'
    @t
endf

function Redotag()
    let @x = "<" . $tag . ">" . @@ .  "</" . $tag . ">"
    @t
endf

" }}}

" Twiki                                                                 {{{
    function! s:EditTwiki(...)
        let s:twiki_working_dir = '$HOME/twiki'

        if exists('a:1')
            let s:twiki_web = a:1
        else
            echo 'v = VirtEng'
            echo 'c = CashMgmtIT'
            let s:twiki_web = input("What TwikiWeb are you editing?: ")
        endif

        if s:twiki_web == 'v'
            let s:twiki_web = 'VirtEng'
        elseif s:twiki_web == 'c'
            let s:twiki_web = 'CashMgmtIT'
        endif

        if exists('a:2')
            let s:twiki_topic = a:2
        else
            let s:twiki_topic = input("What Topic do you want?: ")
        endif

        cd `=s:twiki_working_dir`
        exe(printf("edit %s.%s.twiki", s:twiki_web, s:twiki_topic))
    endf

    command! -nargs=* T call s:EditTwiki(<f-args>)
" }}}

" Sessions {{{

function! Make_Session()
    if strlen(v:this_session)
        execute "mksession! " . v:this_session 
        echo "Updated " . v:this_session 
    else
        let s:session_name = input("Enter the name of this session: ")
        execute "mksession ~/.vim/sessions/" . s:session_name 
        echo "Created ~/.vim/sessions/" . s:session_name
    endif
endf

map #8 :call Make_Session()

function Regen_Session()
  " iterate through the buffers
  let l:i = 0 | while l:i <= bufnr('$') | let l:i = l:i + 1
    let l:bufname = bufname(l:i)
    if strlen(l:bufname)
      \&& getbufvar(l:i, '&modifiable')
      \&& getbufvar(l:i, '&buflisted')
    echo(l:bufname)
    endif
endf

" }}}

" Bufferlist.vim plugin {{{
"    map <silent> <F1> :call BufferList()<CR>
"    hi BufferSelected term=reverse ctermfg=white ctermbg=red cterm=bold
"    hi BufferNormal term=NONE ctermfg=black ctermbg=darkcyan cterm=NONE
"    let g:BufferListMaxWidth = 65
" }}}

" Ctrlp tree {{{
    set runtimepath^=~/.vim/bundle/ctrlp.vim
    let g:ctrlp_match_window_bottom = 1
    let g:ctrlp_match_window_reversed = 0
    " don't show these files in CtrlP
    let g:ctrlp_custom_ignore = '\v\~$|\.(o|swp|pyc|wav|mp3|ogg|blend)$|(^|[/\\])\.(hg|git|bzr)($|[/\\])|__init__\.py'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_dotfiles = 0
    let g:ctrlp_switch_buffer = 1
    nmap <silent><F1> :CtrlPBuffer<CR>
    nmap <silent><F2> :MBEToggle<CR>
" }}}

" Nerd tree {{{
    autocmd StdinReadPre * let s:std_in=1
    "autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
    noremap <C-n> :NERDTreeToggle<CR>
    noremap <Leader>N <ESC>:NERDTreeTabsToggle<CR>
" }}}

" Color Schemes                               {{{
    " colorscheme  Tomorrow-Night-Bright
    colorscheme  solarized
"    autocmd BufEnter * colorscheme no_quarter
    autocmd BufEnter *.pl colorscheme solarized
    autocmd BufEnter *.pm colorscheme solarized
    autocmd BufEnter *.t colorscheme solarized
    hi perlString ctermfg=170
    hi Visual ctermbg=102
    autocmd BufEnter *.py colorscheme solarized
    autocmd BufEnter *.py set foldmethod=indent
" }}}

" Whitespaces                        {{{
    " Hilight white spaces
    autocmd ColorScheme * hi ExtraWhitespace ctermbg=blue guibg=lightgreen
    " To clean extra whitespace, call: StripWhitespace
    nmap <silent><F4> :ToggleWhitespace<CR>
    autocmd FileType perl,javascript,html,twiki autocmd BufWritePre <buffer> StripWhitespace
" }}}

" Buffer Explorer                            {{{
    map <A-^[1> :b1<CR>
    map <A-0x32> :b2<CR>
    map <A-0x33> :b3<CR>
    map <A-0x34> :b4<CR>
    map <A-0x35> :b5<CR>
    map <A-0x36> :b6<CR>
" }}}

nnoremap <F3> :call<SID>LongLineHLToggle()<cr>
hi OverLength ctermbg=none cterm=none
match OverLength /\%>80v/
fun! s:LongLineHLToggle()
    if !exists('w:longlinehl')
        let w:longlinehl = matchadd('ErrorMsg', '.\%>80v', 0)
        echo "Long lines highlighted"
    else
        call matchdelete(w:longlinehl)
        unl w:longlinehl
        echo "Long lines unhighlighted"
    endif
endfunction

" Mouse events/mappings {{{
    map <M-Esc>[62~ <ScrollWheelUp> map! <M-Esc>[62~ <ScrollWheelUp> map
    map <M-Esc>[63~ <ScrollWheelDown> map! <M-Esc>[63~ <ScrollWheelDown> map
    map <M-Esc>[64~ <S-ScrollWheelUp> map! <M-Esc>[64~ <S-ScrollWheelUp> map
    map <M-Esc>[65~ <S-ScrollWheelDown> map! <M-Esc>[65~ <S-ScrollWheelDown>
" }}}
