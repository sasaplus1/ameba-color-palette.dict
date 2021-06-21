# ameba-color-palette.dict

[![Actions Status: test](https://github.com/sasaplus1/ameba-color-palette.dict/workflows/test/badge.svg)](https://github.com/sasaplus1/ameba-color-palette.dict/actions?query=workflow%3A"test")

dictionary of [ameba-color-palette.css](https://github.com/openameba/ameba-color-palette.css) for Vim

## Setup

minimal settings:

```vim
set iskeyword+=-
set dictionary+=/path/to/repos/dict/ameba-color-palette.dict
```

or load dictionary when apply `css` filetype:

```vim
" NOTE: add group is better
autocmd FileType css setlocal iskeyword+=- dictionary+=/path/to/repos/dict/ameba-color-palette.dict
```

### dein.vim

[dein.vim](https://github.com/Shougo/dein.vim) example:

```vim
function! s:hook_post_source_ameba_color_palette_dict() abort
  function! s:setup_ameba_color_palette_dict() abort
    let dict_dir = dein#get('ameba-color-palette.dict').path
    let dict_file = resolve(dict_dir . '/dict/ameba-color-palette.dict')

    execute 'setlocal' 'iskeyword+=-' 'dictionary+=' . dict_file
  endfunction

  autocmd FileType css call s:setup_ameba_color_palette_dict()
endfunction

call dein#add('sasaplus1/ameba-color-palette.dict', {
      \ 'hook_post_source' : function('s:hook_post_source_ameba_color_palette_dict'),
      \ })
```

## License

The MIT license.
