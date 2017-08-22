map <C-n> :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

if !exists("g:syntax_on")
    syntax enable
endif

let g:airline_powerline_fonts=1
let g:airline_section_z="%4l : %3v"
let g:gitgutter_override_sign_column_highlight = 0

colorscheme crayon
colorscheme chroma
hi Normal guibg=NONE ctermbg=NONE

hi Special ctermbg=none
hi NonText ctermbg=none
hi LineNr ctermbg=none
hi CursorLineNr ctermbg=none
hi SignColumn ctermbg=none

set relativenumber nu cursorline
set ts=2 sw=2 expandtab autoindent smartindent
set foldmethod=syntax nofoldenable
set autoread
set list lcs=trail:·
set laststatus=2

filetype indent on

nnoremap <S-Tab> <<
nnoremap <Tab> >>
inoremap <S-Tab> <C-d>

nnoremap <F1> 1gt
nnoremap <F2> 2gt
nnoremap <F3> 3gt
nnoremap <F4> 4gt
nnoremap <F5> 5gt
nnoremap <F6> 6gt
nnoremap <F7> 7gt
nnoremap <F8> 8gt
nnoremap <F9> 9gt
nnoremap <F10> 10gt
nnoremap <F12> :tabe .<CR>
nnoremap <Space> :checktime<CR>

execute pathogen#infect()
call pathogen#helptags()
