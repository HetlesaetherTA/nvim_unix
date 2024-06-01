# nvim_config

Installation:

Step 1: Install Neovim (version 0.9.x)
Step 2: Clone Depository to 
Windows: ~\AppData\Local\
Linux: ~/.config/
Macos: idk
Step 3<: Don't remember...

Cheat sheet:
:e $MYVIMRC

Dependencies:
Jedi

#Tools

#Keybinds

| Mode    | Key Binding              | Action                                       |
|---------|--------------------------|----------------------------------------------|
| n       | `<leader>pv`             | Open file explorer (netrw)                   |
| v       | `<Space>`                | Disable space in visual mode                 |
| n       | `<c-j>`                  | Jump 1 page down                             |
| n       | `<c-k>`                  | Jump 1 page up                               |
| n       | `J`                      | Swap current line with the line below        |
| n       | `K`                      | Swap current line with the line above        |
| n       | `n`                      | Navigate forward in search results           |
| n       | `N`                      | Navigate backward in search results          |
| n, v    | `<leader>y`              | Save to clipboard                            |
| v       | `>`                      | Move selection 1 tab right                   |
| v       | `<`                      | Move selection 1 tab left                    |
| n       | `U`                      | Redo                                         |
| n       | `<leader>rn`             | Execute current file                         |
| n       | `<leader>a`              | Harpoon: Add file                            |
| n       | `<C-e>`                  | Harpoon: Toggle quick menu                   |
| n       | `<C-h>`                  | Harpoon: Navigate to file 1                  |
| n       | `<C-t>`                  | Harpoon: Navigate to file 2                  |
| n       | `<C-n>`                  | Harpoon: Navigate to file 3                  |
| n       | `<C-s>`                  | Harpoon: Navigate to file 4                  |
| n       | `<leader>db`             | DAP: Toggle breakpoint                       |
| n       | `<leader>dus`            | DAP: Open sidebar with scopes                |
| n       | `<leader>n`              | DAP: Step over                               |
| Go      | `<leader>dgt`            | DAP Go: Debug test                           |
| Go      | `<leader>dgl`            | DAP Go: Debug last test                      |
| Go      | `<leader>t`              | Print "test"                                 |
| n       | `<leader>u`              | Toggle Undotree                              |
| n       | `<leader>gs`             | Open Git status                              |
| n       | `<C-k>`                  | CMP: Select previous item                    |
| n       | `<C-j>`                  | CMP: Select next item                        |
| n       | `<C-h>`                  | CMP: Select previous item                    |
| n       | `<C-l>`                  | CMP: Select next item                        |
| n       | `<C-u>`                  | CMP: Scroll docs up                          |
| n       | `<C-d>`                  | CMP: Scroll docs down                        |
| n       | `<C-e>`                  | CMP: Abort                                   |
| n       | `<C-y>`                  | CMP: Confirm selection (insert)              |
| n       | `<CR>`                   | CMP: Confirm selection (normal)              |
| i, s    | `<C-f>`                  | CMP: Jump to next snippet placeholder        |
| i, s    | `<C-b>`                  | CMP: Jump to previous snippet placeholder    |
| i, s    | `<Tab>`                  | CMP: Complete or jump to next placeholder    |
| i, s    | `<S-Tab>`                | CMP: Complete or jump to previous placeholder|
| n       | `gnn`                    | Treesitter: Start selection                  |
| n       | `grn`                    | Treesitter: Increment node selection         |
| n       | `grc`                    | Treesitter: Increment scope selection        |
| n       | `grm`                    | Treesitter: Decrement node selection         |
| n       | `af`                     | Treesitter: Select around a function         |
| n       | `if`                     | Treesitter: Select inner part of a function  |
| n       | `ac`                     | Treesitter: Select around a class            |
| n       | `ic`                     | Treesitter: Select inner part of a class     |

#Dependencies
|GO |
|go install golang.org/x/tools/gopls@latest |
|go install github.com/incu6us/goimports-reviser/v3@latest |
|go install mvdan.cc/gofumpt@latest |
|go install github.com/segmentio/golines@latest v0.11.0@latest |
|go install github.com/go-delve/delve/cmd/dlv@latest |

!! remember to add "export PATH=$PATH:$(go env GOPATH)/bin" to ~/.zshrc to access from shell}
