" Пусть курсор держится в центре при движении
set scrolloff=3
set sidescrolloff=5
set nowrap

" Центрируем экран при Ctrl-U / Ctrl-D
nnoremap <C-d> <C-d>zz
nnoremap <C-u> <C-u>zz

" Включаем поддержку мыши для прокрутки колесиком
set mouse=a



set number
" inoremap jj <Esc>



" Use space characters instead of tabs.
set expandtab

" Do not save backup files.
set nobackup

" Do not let cursor scroll below or above N number of lines when scrolling.
set scrolloff=10

" Do not wrap lines. Allow long lines to extend as far as the line goes.
set wrap

" While searching though a file incrementally highlight matching characters as you type.
set incsearch

" Ignore capital letters during search.
set ignorecase
" Override the ignorecase option if searching for capital letters.
" This will allow you to search specifically for capital letters.
set smartcase

" Show partial command you type in the last line of the screen.
set showcmd

" Show the mode you are on the last line.
set showmode

" Show matching words during a search.
set showmatch

" Use highlighting when doing a search.
set hlsearch

" Set the commands to save in history default number is 20.
set history=1000
" Для расширения окна
nnoremap <C-<> <C-w><

" Для сужения окна
nnoremap <C->> <C-w>>

nnoremap <S-CR> o<Esc>
inoremap <S-CR> <Esc>o
set autoindent      " Автоматически копирует текущий отступ на новую строку
set smartindent     " Добавляет интеллектуальные отступы для кода
set tabstop=4       " Количество пробелов для символа табуляции
set shiftwidth=4    " Количество пробелов для уровня отступа
set expandtab       " Заменяет табуляцию на пробелы

syntax on           " Включает подсветку синтаксиса
filetype plugin on  " Включает поддержку плагинов для типов файлов
filetype indent on  " Включает автоматическое выравнивание для типов файлов

