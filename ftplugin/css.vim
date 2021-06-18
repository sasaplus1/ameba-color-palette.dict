" Add dictionary of ameba-color-palette.css to Vim
" Author: sasa+1 <sasaplus1@gmail.com>
" Last Change: 2021 Jun 18
" License: MIT
" WebPage: https://github.com/sasaplus1/ameba-color-palette.dict

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:save_cpo = &cpo
set cpo&vim

setlocal iskeyword+=-

let s:dict_dir = finddir("dict", expand("<sfile>:p:h") . ";")
let s:dict_file = simplify(s:dict_dir . "/ameba-color-palette.dict")

execute "setlocal" "dictionary+=" . s:dict_file

let &cpo = s:save_cpo
unlet s:save_cpo
