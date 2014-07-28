require './lib/tasks'

class List
  def initialize name
    @name = name
    @tasks = []
  end

  def description
    @name
  end

  def list_tasks
    task_names = []
    @tasks.each do |task|
      task_names << task.description + " / "
      task_names << task.due_date + " / "
      task_names << task.priority
      task_names << "\n"
    end
    puts "Task Description / Due Date / Priority Level\n" + task_names.join("")
  end

  def add_task task_to_add
    new_task = Task.new(task_to_add)
    @tasks << new_task

    new_task
  end

  def remove_task name
    index = 0
    @tasks.each do |task|
      if (task.description == name)
        @tasks.delete_at(index)
      end
      index += 1
    end
  end

  def tasks
    @tasks
  end

  def name_organize
    @tasks.sort! {|a,b| a.description.downcase <=> b.description.downcase}
  end

  def date_organize
    @tasks.sort! {|a,b| a.due_date <=> b.due_date}
  end

  def priority_organize
    @tasks.sort! {|a,b| a.priority <=> b.priority}
  end

  def rename_task name, new_name
    @tasks.each do |task|
      if (task.description == name)
       task.set_description(new_name)
      end
    end
  end

end
