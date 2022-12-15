#!/usr/bin/python3
import os, sys
string = " ".join(sys.argv[1:])
string = string.replace("+++","()").replace(".=","'")
print(f"bash -c \"/usr/bin/nvim --server ~/.cache/nvim/server.pipe --remote-send '<C-\><C-N>{string}<CR>'\"""")
os.system(f'/usr/bin/nvim --server ~/.cache/nvim/server.pipe --remote-send \"<C-\><C-N>{string}<CR>\"')

