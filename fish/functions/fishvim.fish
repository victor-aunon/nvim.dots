function fishvim --wraps=fish_default_key_bindings --wraps=fish_vi_key_bindings --description 'alias fishvim=fish_vi_key_bindings'
  fish_vi_key_bindings $argv
        
end
