class Progression < ActiveRecord::Base
  NUMBER_OF_LESSONS = 100
  PARTS_PER_LESSON = 3
  LESSON_SEQUENCE = (1..NUMBER_OF_LESSONS).map{|i| (1..PARTS_PER_LESSON).map{|n| [i,n]}}.flatten(1)

  def next
    return if last_progression?
    next_lesson_number, next_part_number = LESSON_SEQUENCE[current_lesson_index + 1]
    Progression.new(lesson_number: next_lesson_number, part_number: next_part_number, student_id: student_id)
  end

  private

  def last_progression?
    [lesson_number, part_number] == LESSON_SEQUENCE.last
  end

  def current_lesson_index
    LESSON_SEQUENCE.index([lesson_number, part_number])
  end
end
