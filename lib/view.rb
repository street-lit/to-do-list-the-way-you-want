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
    puts "What To-Do name would you like to edit?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    @todo = Todo.find(input)
    puts "You chose the To-Do:"
    old_name = @todo.name
    puts "#{old_name}\n"
    puts "What would you like to re-name this To-Do to? "
    print "New name > "
    new_name = gets.chomp
    @todo.name = new_name
    @todo.save!
    puts "You renamed the To-Do - #{old_name} - to #{@todo.name}"
  end

  def complete_todo
    puts "What To-Do would you like to mark as completed?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    @todo = Todo.find(input)
    puts "You chose the To-Do:"
    todo_name = @todo.name
    puts "#{todo_name}\n"
    puts "Is this To-Do complete? "
    print "Please enter y/n > "
    complete = gets.chomp.downcase
    if complete == "y" || complete == "yes"
      @todo.complete = true
      @todo.save!
      puts "The task #{todo_name} was marked as completed."
    else
      puts "The task #{todo_name} was NOT marked as completed."
    end
  end
end



































