class Progression < ActiveRecord::Base
  def next
    next_part_number = part_number + 1
    Progression.new(lesson_number: lesson_number, part_number: next_part_number, student_id: student_id)
  end

end
