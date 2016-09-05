class Progression < ActiveRecord::Base
  def next
    next_part_number = part_number + 1
    next_lesson_number = lesson_number + (next_part_number > 3 ? 1 : 0)
    next_part_number = 1 if next_part_number > 3
    Progression.new(lesson_number: next_lesson_number, part_number: next_part_number, student_id: student_id)
  end

end
