function fzfp --wraps="fzf --preview='cat {}'" --description "alias fzfp=fzf --preview='cat {}'"
  fzf --preview='cat {}' $argv
        
end
