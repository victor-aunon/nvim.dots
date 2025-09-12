function ls --wraps=eza --wraps='eza --icons' --wraps='eza --icons=always --color=always' --description 'alias ls=eza --icons=always --color=always'
  eza --icons=always --color=always $argv
        
end
