require_relative '../db/setup'
require_relative '../lib/all'
require_relative '../lib/view'
# require 'pry'

view = View.new

loop do
  system('clear')
  view.start
  view.show_todos
  input = view.get_selection
  case input
  when 1
    view.create_todo
  when 2
    view.edit_todo
  when 3
    view.complete_todo
  when 4
    view.delete_todo
  else
    system('clear')
    exit
  end
end
