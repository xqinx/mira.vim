# mira.vim
This is a vim/nvim color scheme specifically designed for E-Ink monitors.

The monitor I used for developing is Mira Pro from Boox, hence
the scheme's name.

It's still WIP (yea, I just go my monitor in Oct. 2022), but at this point it's usable for my daily vim use.

## Done(?) Features
* Customized pallete to display grey scale (binary, actually) colors
* Bold, italic, underline defined for syntax groups
* Diff view
* Powerline status and tab status support
* NERDTree support
* fzf support

## TODOs
* Make grey color support configurable
* More syntax tweaks for common languages
  - [x] markdown
  - [ ] python
  - [ ] js

## Photos
Here are some photos of the actual display
#### Black+White
Black and white settings *should work* for most of terminals and monitor
settings. In some rare cases it might need some tuning. Issues are welcome.
![Photo: BW](http://i.imgur.com/Ax5Clx3.png)

#### Black+White with an additional Grey

A grey color may be added, but it is not stable, since how the grey would look like is largely depending on the terminal you are using
and your monitor settings, thus most likely will need manual tuning to get it displayed correctly. Here's how it looks *on my
machine*
![Photo: Grey](http://i.imgur.com/cQ5HcKe.png)

## Fine Tuning
If you need to tune some of the color to match your monitor settings, here is a
useful script I run to figure out which RGB color gets mapped to black or white
based on a specific monitor settings:
```shell
for i in {0..255} ; do
    printf "\x1b[48;5;%sm%3d\e[0m " "$i" "$i"
    if (( i == 15 )) || (( i > 15 )) && (( (i-15) % 6 == 0 )); then
        printf "\n";
    fi
done
```

---
This work is inspired by the popular color scheme
[gruvbox](https://github.com/morhetz/gruvbox), which is my go-to scheme when I am
on a regular display.
