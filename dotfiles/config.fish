#set -x PATH ~/.local/bin $PATH
#set -x PATH ~/.local/bin ~/.node/bin ~/.gem/bin $PATH

set -e EDITOR
set -e BROWSER
set -Ux EDITOR vim
set -Ux BROWSER qutebrowser

# Emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
  function fish_right_prompt
    true
  end
end

set acceptable_terms eterm-color xterm-256color screen-256color

if contains "$TERM" acceptable_terms
  # Don't use vi keybindings in unknown terminals,
  # since weird things can happen.
  fish_vi_key_bindings
end 

# This function may be required for Emacs support. 
function fish_title
  true
end

# chips
if [ -e ~/.config/chips/build.fish ] ; . ~/.config/chips/build.fish ; end
