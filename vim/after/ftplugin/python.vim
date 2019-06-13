" The after directory is the place to override / add to the behaviour of 
" existing plugins. This file is overrising the shipped behaviour of
" vims python filetype processing.

" b is a namespace for an internal variable. b: stands for buffer variable.
" see :help internal-variables
let b:ale_fixers = ['black', 'isort'] " Haven't worked out how to get isort working with docker yet. Needs access to requirements.
let b:ale_fix_on_save = 1
