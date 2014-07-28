require './lib/Lists'
require './lib/tasks.rb'

@list_of_lists = []
def main_menu
  system 'clear'
  loop do
    puts "Main Menu--"
    puts " L) List menu"
    if (@list_of_lists.length > 0)
      puts " T) Task menu"
    end
    puts " E) Exit\n"
    puts "Please select an option:"
    input = gets.chomp.upcase

    if (input == "L")
      list_menu
    elsif ((input == "T") && (@list_of_lists.length > 0))
      select_list
    elsif (input == "E")
      puts "Have a good day!"
      exit
    else
      system 'clear'
      puts "Invalid input!\n\n"
    end
  end
end

def list_menu
  system 'clear'
  loop do
    puts "List Menu--"
    puts " A) Add a list"
    puts " D) Display lists"
    puts " R) Remove a list"
    puts " E) Exit to Main Menu"
    main_choice = gets.chomp.upcase
    if main_choice == 'A'
      add_list
    elsif main_choice == 'D'
      list_lists
    elsif main_choice == 'R'
      remove_list
    elsif main_choice == 'E'
      main_menu
    else
      system 'clear'
      puts "Sorry, that wasn't a valid option.\n"
    end
  end
end

def add_list
  puts "Enter the name of the new list:"
  user_description = gets.chomp
  @list_of_lists << List.new(user_description)
  puts "List added.\n\n"
end

def list_lists
  puts "Here are all of your lists:"
  @list_of_lists.each do |list|
    puts list.description
  end
  puts "\n"
end

def remove_list
  list_lists
  puts "Please enter the name of the list to be removed:"
  input = gets.chomp
  index = 0
  @list_of_lists.each do |list|
    if (list.description == input)
      @list_of_lists.delete_at(index)
    end
    index += 1
  end
  puts "List removed! Here is the updated list:"
  list_lists
end

def select_list
  list_lists
  puts "Which list would you like to use?"
  input = gets.chomp
  index = 0
  location = 0
  @list_of_lists.each do |list|
    if (list.description == input)
      location = index
    end
    index += 1
  end
  task_menu(location)
end

def task_menu location
  loop do
    puts "Task Menu--"
    puts " A) Add a task"
    puts " D) Display tasks"
    puts " R) Remove a task"
    puts " O) Organize tasks"
    puts " S) Switch list"
    puts " C) Change task name"
    puts " E) Exit to Main Menu"
    main_choice = gets.chomp.upcase
    if main_choice == 'A'
      add_task(location)
    elsif main_choice == 'D'
      display_tasks(location)
    elsif main_choice == 'R'
      remove_task(location)
    elsif main_choice == 'E'
      main_menu
    elsif main_choice == 'S'
      select_list
    elsif main_choice == 'O'
      organize_list(location)
    elsif main_choice == 'C'
      change_description(location)
    else
      system 'clear'
      puts "Sorry, that wasn't a valid option.\n"
    end
  end
end

def add_task location
  puts "What task would you like to add?"
  name = gets.chomp
  new_task = @list_of_lists[location].add_task(name)
  puts "What is the due date?"
  date = gets.chomp
  new_task.set_due_date(date)
  puts "What is the priority level (1-5)?"
  level = gets.chomp
  new_task.set_priority(level)
end

def display_tasks location
  puts "Here are your tasks"
  puts @list_of_lists[location].list_tasks
end



def remove_task location
  display_tasks(location)


  puts "Please enter the name of the task to be removed:"
  name = gets.chomp
  @list_of_lists[location].remove_task(name)

  puts "List removed! Here is the updated list:"
  display_tasks(location)

end

def organize_list (location)
  puts "Sort by N)ame D)ate or P)riority?"
  loop do
    organize = gets.chomp.upcase
    if organize == "N"
      @list_of_lists[location].name_organize
      display_tasks(location)
      break
    elsif organize == "D"
      @list_of_lists[location].date_organize
      display_tasks(location)
      break
    elsif organize == "P"
      @list_of_lists[location].priority_organize
      display_tasks(location)
      break
    else
      puts "Sort by N)ame D)ate or P)riority?"
    end
  end
end

def change_description (location)
    puts "Input task name to change"
    input = gets.chomp
    puts "Input new name"
    new_name = gets.chomp
    @list_of_lists[location].rename_task(input, new_name)

  end

main_menu
