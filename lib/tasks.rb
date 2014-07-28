require './lib/Lists'

class Task
  def initialize (description)
    @description = description
    @due_date = 12/12/99
    @priority = 5
  end
  def set_due_date (date)
    @due_date = date
  end

  def set_priority (level)
    @priority = level
  end

  def due_date
    @due_date
  end

  def priority
    @priority
  end

  def description
    @description
  end

  def set_description (description)
    @description = description
  end
end

