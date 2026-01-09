# ...THE DOTFILES...

This is my repository for the config files required for various applications and tools that I 
frequently use. In order to set up a new computer with all of my familiar settings I should only
need to clone this repo and then run the `./install.zsh` script. 

## How to use
Clone this repo **into your home directory** `cd` into it and then run `./install.zsh`. 

## How `./install.zsh` works?
The install script works by using the `stow` [command](https://www.gnu.org/software/stow/). There
are numerous videos and blogs about managing dotfiles with `stow` if you give it a google. The
reason I chose to use stow was because I found I had some pieces of config on my work computer that
I didn't want to push up to this repository. My previous install script simply symlinked every other
iterm apart from the install script to the home directory. This meant a wholesale link of the
config directory. `stow` is cool because when you call it on a directory e.g. `stow gh` it will
look at the target directory (by default the parent hence cloning this project into your home 
directory) and add only what is needed to make the contents of the stowed dir (here `gh`) match. 

For example, if you had `~/.config/untracked_app_config.yml` and `~/dotfiles/gh/.config/gh/config.yml`
then `stow` can see that it doesn't need to create a `.config` file as that already exists. It
leaves `untracked_app_config.yml` alone and just places `gh/config.yml` next to it. However, if
it didn't already exist then it would create it. 

Blog that initially inspired this: https://www.jakewiesler.com/blog/managing-dotfiles 

TODO:
- Consider using `--dotfiles` option in stow so that files are not hidden until they are symlinked
