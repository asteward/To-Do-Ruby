require './lib/tasks'

class List
  # def tasks
  #   @tasks
  # end

  def initialize name
    @name = name
    @tasks = []
  end

  def description
    @name
  end

  def list_tasks
    @tasks.each do |task|
      puts task.description
    end
    puts ""
  end

  def add_task task_to_add
    @tasks << Task.new(task_to_add)
  end
end
