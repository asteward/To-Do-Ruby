require './lib/tasks'

class List
  @tasks = []
  def initialize name
    @name = name
  end

  def description
    @name
  end

  def list_tasks
    @tasks.each do |task|
      puts task.description
    end
  end

  def add_task task_to_add
    @tasks << Task.new(task_to_add)
  end
end
