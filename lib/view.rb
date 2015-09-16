require_relative '../lib/todo'
# require 'pry'

class View

  def initialize
    @todolist = [] # Currently not being used by any methods
  end

  def show_todos
    @todolistview = []
    Todo.find_each do |todo|
      @todolistview.push(todo)
    end

    if @todolistview.size > 0
      puts "-----Unfinished-----"
      @todolistview.each do |todo|
        if todo[:complete] == false
          puts "#{todo.id}) #{todo[:name]}"
        end
      end

      puts "\n-----Completed-----" if @todolistview.any? { |todo| todo[:complete] == true }

      @todolistview.each do |todo|
        if todo[:complete] == true
          puts "#{todo.id}) #{todo[:name]}"
        end
      end
    end
    puts ""
  end

  def start
    puts "-"*30
    puts "   Welcome to THE To-Do App."
    puts "-"*30
    puts "\n"
  end

  def get_selection
    puts "Please make a selection:"
    puts "1) Create To-Do"
    puts "2) Edit To-Do"
    puts "3) Complete To-Do"
    puts "4) Delete To-Do"
    puts "Enter any other key to exit"
    print "Choice > "
    input = gets.chomp.to_i
  end

  def create_todo
    puts "What would you like to name your To-Do?"
    input = gets.chomp
    @todo = Todo.find_or_create_by(name: "#{input}")
    @todolist.push(@todo)
  end

  def edit_todo
    puts "What To-Do name would you like to edit?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    @todo = Todo.find(input)
    puts "You chose the To-Do: "
    todo_name = @todo.name
    print "#{todo_name}\n"
    puts "What would you like to re-name this To-Do to? "
    print "New name > "
    new_name = gets.chomp
    @todo.name = new_name
    @todo.save!
    puts "You renamed the To-Do - #{todo_name} - to - #{new_name}"
    system('sleep 2')
  end

  def complete_todo
    puts "What To-Do would you like to mark as completed?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    @todo = Todo.find(input)
    puts "You chose the To-Do: "
    todo_name = @todo.name
    print "#{todo_name}\n"
    puts "Is this To-Do complete? "
    print "Please enter y/n > "
    complete = gets.chomp.downcase
    if complete == "y" || complete == "yes"
      @todo.complete = true
      @todo.save!
      puts "The To-Do - #{todo_name} - was marked as completed."
    else
      puts "The To-Do - #{todo_name} - was NOT marked as completed."
    end
    system('sleep 2')
  end

  def delete_todo
    puts "What To-Do would you like to delete?"
    print "Please enter its corresponding number > "
    input = gets.chomp.to_i
    @todo = Todo.find(input)
    puts "You chose the To-Do: "
    todo_name = @todo.name
    print "#{todo_name}\n"
    puts "Are you sure you want to delete the To-Do: #{todo_name}? "
    print "Please enter y/n > "
    complete = gets.chomp.downcase
    if complete == "y" || complete == "yes"
      @todo.destroy
      puts "The To-Do - #{todo_name} - was deleted."
    else
      puts "The To-Do - #{todo_name} - was NOT deleted."
    end
    system('sleep 2')
  end
end



































