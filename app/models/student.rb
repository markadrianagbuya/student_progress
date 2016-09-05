class Student < ActiveRecord::Base
  has_many :progressions

  def as_json(options={})
    super(:only => [:id], methods: [:part_number, :lesson_number])
  end

  def part_number
    progressions.last.part_number
  end

  def lesson_number
    progressions.last.lesson_number
  end

  def make_progress
    progressions.last.next.try(:save!)
  end
end
