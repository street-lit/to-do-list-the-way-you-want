require_relative '../db/setup'
require_relative '../lib/all'
require_relative '../lib/view'
# require 'pry'

view = View.new

view.start
input = view.get_selection

if input == 1
  view.create_todo
elsif input == 2
  view.edit_todo
elsif input == 3
  view.complete_todo
end
