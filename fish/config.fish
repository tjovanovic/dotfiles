# fish_add_path "$HOME/go/bin/"
# fish_add_path "$HOME/.cargo/bin"
# fish_add_path "$HOME/bin"
# fish_add_path "$HOME/.local/bin"
# fish_add_path "$HOME/.bin/clion/bin"
# fish_add_path "$HOME/.npm-packages/bin"

# Set vim as editor
set -gx EDITOR vim
set -gx VISUAL $EDITOR

abbr -a -g g git
abbr -a -g k kubectl
abbr -a -g fc vim ~/.config/fish/config.fish
abbr -a -g s skaffold
# abbr -a -g tg terragrunt
abbr -a -g d docker
abbr -a -g c cargo

zoxide init fish | source

printf '\eP$f{"hook": "SourcedRcFileForWarp", "value": { "shell": "fish" }}\x9c'