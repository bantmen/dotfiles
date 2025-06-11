## Vim

https://github.com/macvim-dev/macvim

Install vim plugin manager https://github.com/junegunn/vim-plug

https://github.com/kien/ctrlp.vim

Alternative to ctrlp: https://github.com/junegunn/fzf
- `brew install fzf`

https://github.com/altercation/vim-colors-solarized

Install [dracula](https://github.com/dracula/vim) theme: 
```
mkdir -p ~/.vim/pack/themes/start
git clone https://github.com/dracula/vim.git ~/.vim/pack/themes/start/dracula
```

## Others

https://github.com/jimeh/git-aware-prompt

`brew install diff-so-fancy`

or

https://gist.github.com/gmolveau/8fcdb5e953bd6c9dad18ecd39b9718a4

```
mkdir -p ~/bin 
# add ~/bin to your PATH (.bashrc or .zshrc)
cd ~/bin
git clone https://github.com/so-fancy/diff-so-fancy diffsofancy
chmod +x diffsofancy/diff-so-fancy
ln -s ~/bin/diffsofancy/diff-so-fancy ~/bin/diff-so-fancy
```
