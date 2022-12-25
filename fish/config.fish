# Include secrets
for file in ~/.config/fish/secrets/*.fish
  source $file
end

# Machine-specific stuff
for file in ~/.config/machines/(hostname).d/*.fish
  source $file
end

# This one is only required at work machine. So making it silent for now.

fish_add_path "$HOME/go/bin/"


fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/bin"
fish_add_path "$HOME/.local/bin"
fish_add_path "$HOME/.bin/clion/bin"
fish_add_path "$HOME/.npm-packages/bin"

# Set vim as editor
set -gx EDITOR vim
set -gx VISUAL $EDITOR

set -Ux PYENV_ROOT $HOME/.pyenv
set -Ux fish_user_paths $PYENV_ROOT/bin $fish_user_paths

# Set appropriate term
if [ "$TERM" != "screen-256color" ]
  set -gx TERM xterm-256color
end

abbr -a -g g git
abbr -a -g k kubectl
abbr -a -g kp kubectl --context=prod
abbr -a -g ks kubectl --context=shared
abbr -a -g fc vim ~/.config/fish/config.fish
abbr -a -g s skaffold
abbr -a -g tg terragrunt
abbr -a -g d docker
abbr -a -g m minikube
abbr -a -g c cargo
abbr -a -g cb conan build ..
abbr -a -g ci conan install ..

if status --is-interactive
  if test -f "source ~/.local/share/icons-in-terminal/icons.fish"
    source ~/.local/share/icons-in-terminal/icons.fish 
  end

  setfont /usr/share/kbd/consolefonts/Lat2-Terminus16 ^/dev/null
  starship init fish | source
  kubectl completion fish | source
end

status --is-interactive; and source (jump shell --bind=z fish | psub)


# pyenv init
if command -v pyenv 1>/dev/null 2>&1
  pyenv init - | source
end
