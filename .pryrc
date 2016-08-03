Pry.config.history.file = "~/.pry_history"
Pry.config.history.should_save = true
Pry.config.history.should_load = true
Pry.config.editor = 'vim'
Pry.history.load
puts "Finished loading Pry history"

if defined?(PryByebug)
  Pry.commands.alias_command 'c', 'continue'
  Pry.commands.alias_command 's', 'step'
  Pry.commands.alias_command 'n', 'next'
  Pry.commands.alias_command 'f', 'finish'
end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, "repeat last command" do
  _pry_.run_command Pry.history.to_a.last
end
