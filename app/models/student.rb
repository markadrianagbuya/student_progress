class Student < ActiveRecord::Base
  def as_json
    super(:only => [:id], methods: [:part_number, :lesson_number])
  end

  def part_number
    2
  end

  def lesson_number
    3
  end
end
