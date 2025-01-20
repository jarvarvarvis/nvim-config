-- Mark *.glsl, *.vert, *.frag and *.comp files as GLSL files
vim.cmd [[autocmd BufNewFile,BufRead *.glsl,*.frag,*.vert,*.comp :set filetype=glsl]]
