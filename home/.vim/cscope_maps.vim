""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CSCOPE settings for vim           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jason Duell       jduell@alumni.princeton.edu     2002/3/7
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This tests to see if vim was configured with the '--enable-cscope' option
" when it was compiled.  If it wasn't, time to recompile vim... 
if has("cscope")

    """"""""""""" Standard cscope/vim boilerplate

    " use both cscope and ctag for 'ctrl-]', ':ta', and 'vim -t'
    set cscopetag

    " check cscope for definition of a symbol before checking ctags: set to 1
    " if you want the reverse search order.
    set csto=0

    " add any cscope database in current directory
    if filereadable("cscope.out")
        cs add cscope.out  
    " else add the database pointed to by environment variable 
    elseif $CSCOPE_DB != ""
        cs add $CSCOPE_DB
    endif

    " show msg when any other cscope db added
    set cscopeverbose  


    """"""""""""" My cscope/vim key mappings
    "
    " The following maps all invoke one of the following cscope search types:
    "
    " F3  's'   symbol: find all references to the token under cursor
    " F4  'g'   global: find global definition(s) of the token under cursor
    " F5  'c'   calls:  find all calls to the function name under cursor
    " F6  'd'   called: find functions that function under cursor calls
    " F7  't'   text:   find all instances of the text under cursor
    " F8  'e'   egrep:  egrep search for the word under cursor
    " F9  'f'   file:   open the filename under cursor
    " F10 'i'   includes: find files that include the filename under cursor

    " open in current window
    nmap <F3> :cs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <F4> :cs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <F5> :cs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <F6> :cs find d <C-R>=expand("<cword>")<CR><CR>	
    nmap <F7> :cs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <F8> :cs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <F9> :cs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <F10> :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>

    " horizontal split
    nmap <F3>h :scs find s <C-R>=expand("<cword>")<CR><CR>	
    nmap <F4>h :scs find g <C-R>=expand("<cword>")<CR><CR>	
    nmap <F5>h :scs find c <C-R>=expand("<cword>")<CR><CR>	
    nmap <F6>h :scs find d <C-R>=expand("<cword>")<CR><CR>	
    nmap <F7>h :scs find t <C-R>=expand("<cword>")<CR><CR>	
    nmap <F8>h :scs find e <C-R>=expand("<cword>")<CR><CR>	
    nmap <F9>h :scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <F10>h :scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	

    " vertical split
    nmap <F3>v  :vert scs find s <C-R>=expand("<cword>")<CR><CR>
    nmap <F4>v  :vert scs find g <C-R>=expand("<cword>")<CR><CR>
    nmap <F5>v  :vert scs find c <C-R>=expand("<cword>")<CR><CR>
    nmap <F6>v  :vert scs find d <C-R>=expand("<cword>")<CR><CR>
    nmap <F7>v  :vert scs find t <C-R>=expand("<cword>")<CR><CR>
    nmap <F8>v  :vert scs find e <C-R>=expand("<cword>")<CR><CR>
    nmap <F9>v  :vert scs find f <C-R>=expand("<cfile>")<CR><CR>	
    nmap <F10>v :vert scs find i ^<C-R>=expand("<cfile>")<CR>$<CR>	


    """"""""""""" key map timeouts
    "
    " By default Vim will only wait 1 second for each keystroke in a mapping.
    " You may find that too short with the above typemaps.  If so, you should
    " either turn off mapping timeouts via 'notimeout'.
    "
    "set notimeout 
    "
    " Or, you can keep timeouts, by uncommenting the timeoutlen line below,
    " with your own personal favorite value (in milliseconds):
    "
    "set timeoutlen=4000
    "
    " Either way, since mapping timeout settings by default also set the
    " timeouts for multicharacter 'keys codes' (like <F1>), you should also
    " set ttimeout and ttimeoutlen: otherwise, you will experience strange
    " delays as vim waits for a keystroke after you hit ESC (it will be
    " waiting to see if the ESC is actually part of a key code like <F1>).
    "
    "set ttimeout 
    "
    " personally, I find a tenth of a second to work well for key code
    " timeouts. If you experience problems and have a slow terminal or network
    " connection, set it higher.  If you don't set ttimeoutlen, the value for
    " timeoutlent (default: 1000 = 1 second, which is sluggish) is used.
    "
    "set ttimeoutlen=100

endif

