" https://github.com/golang/tools/blob/master/gopls/doc/vim.md#ale
let b:ale_linters = ['gopls']
" https://github.com/dense-analysis/ale/issues/2179#issuecomment-474470379
let b:ale_go_bingo_executable = 'gopls'
let b:ale_fixers = ['gofumpt']

let shell='/bin/sh'
let b:go_autodetect_gopath = 0
