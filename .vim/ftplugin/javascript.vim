" Enables only Flow for JavaScript. See :ALEInfo for a list of other available
" linters. NOTE: the `flow` linter uses an old API; prefer `flow-language-server`.
let b:ale_linters = ['flow-language-server', 'prettier', 'eslint']
"let b:ale_linters = ['flow']

" Fix files with prettier, and then ESLint.
let b:ale_fixers = ['prettier', 'eslint']

let g:javascript_plugin_flow = 1
let g:ale_javascript_prettier_use_local_config = 1
