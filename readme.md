# nvim.Dots by victor-aunon

## 1- Install fish shell
```
brew install fish 
```
## 2- Install OhMyFish
```
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
```
## 3- Install the following dependencies
```
brew install gcc
brew install fzf
brew install fd
brew install ripgrep
brew install lazygit
```

## 4- Install zellij
```
brew install zellij
```

Launch default zellij session with `zellij -l default`

## 5- Install nvim through brew!!
```
brew install nvim
```

## 6- Install wezterm and a nerdfont if using Windows and WSL

My preferred font is [UbuntuMono](https://github.com/ryanoasis/nerd-fonts/releases/download/v3.2.1/UbuntuMono.zip) 
Dracula colorscheme for Wezterm https://draculatheme.com/wezterm

## 7- Copy the contents from each folder in this repository to `/home/<your-user>/.config`
---

## Commands

Lazynvim controls:
- `:qa`: save all and close
- `ctrl + z`: suspend nvim session and exit to the terminal
- `fg`: resume an nvim session from the terminal
- `<leader><leader` o `<leader> + f`: telescope file finder
- `<leader> + sf`: telescope file browser
- `<leader> + sg`: telescope grep finder
- `<leader> + sr`: telescope replace in files
- `-`: launch oil explorer
- `<leader> + c + f`: format code (prettier)

Nvim controls:
- `ctrl + w` o `<leader> + w`: nvim split options
- `+`: at a word, mark this word as a reference
  - `shift + +`: navigate through similar references
- `{ }`: move to next/previous paragraph
- `ctrl + w`: delete last word in **insert** mode 
- `ctrl + u`: delete current line in **insert** mode 
- `ctrl + n`: move to next suggestion/item
- `ctrl + p`: move to previous suggestion/item
- `gcn`: change content within a search
  - `n`: go to next occurrence
  - `shift + n`: go to previous occurrence
  - `.`: repeat last action
- `*`: select current word as a search occurrence and select the next one
- `<leader> + g + c`: toggle comment in **visual** mode


## Useful links
- [Gentleman Programming repo](https://github.com/Gentleman-Programming/Gentleman.Dots)
- [Gentleman Programming config video](https://www.youtube.com/watch?v=xBU2nuMCMRQ)
- [Gentleman Programming nvim guide](https://www.youtube.com/watch?v=fPLGOVHJowE)
