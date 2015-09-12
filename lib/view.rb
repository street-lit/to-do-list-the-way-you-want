require_relative '../lib/todo'
# require 'pry'

class View

  def initialize
    @todolist = []
  end

  def show_todos

  end

  def start
    puts "\n"
    puts "-"*30
    puts "   Welcome to THE To-Do App."
    puts "-"*30
    puts "\n"
    puts "Please make a selection: "
  end

  def get_selection
    puts "1) Create To-Do"
    puts "2) Edit To-Do"
    puts "3) Complete To-Do"
    puts "4) Delete To-Do"
    print "Choice > "
    input = gets.chomp.to_i
  end

  def create_todo
    puts "What would you like to name your To-do?"
    input = gets.chomp
    @todo = Todo.find_or_create_by(name: "#{input}")
    @todolist.push(@todo)
  end

  def edit_todo
    puts "What To-Do would you like to edit?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    puts "You chose #{input}"
  end
end



































