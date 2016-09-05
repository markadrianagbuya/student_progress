class Progression < ActiveRecord::Base
  NUMBER_OF_LESSONS = 100
  PARTS_PER_LESSON = 3

  def next
    return if last_progression?
    next_part_number = part_number + 1
    next_lesson_number = lesson_number + (next_part_number > PARTS_PER_LESSON ? 1 : 0)
    next_part_number = 1 if next_part_number > PARTS_PER_LESSON
    Progression.new(lesson_number: next_lesson_number, part_number: next_part_number, student_id: student_id)
  end

  private

  def last_progression?
    part_number == PARTS_PER_LESSON && lesson_number == NUMBER_OF_LESSONS
  end
end
