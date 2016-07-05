Pry.config.history.file = "~/.pry_history"
Pry.config.history.should_save = true
Pry.config.history.should_load = true
Pry.config.editor = 'vim'
Pry.history.load
puts "Finished loading Pry history"
