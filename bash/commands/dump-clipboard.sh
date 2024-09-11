#!/bin/bash

# requires the `xclip` command

dump_clipboard() { 
    if [ -z "$1" ]; then
        echo "Usage: save_clipboard_to_file <filename>"
        return 1
    fi

    xclip -o > "$1"  
  
    # we could also use `xsel` instead 
    # xsel --clipboard --output if you prefer xsel
}

