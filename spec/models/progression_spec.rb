require 'rails_helper'

RSpec.describe Progression, type: :model do
  describe '#next' do
    it "returns the next progression in the lesson sequence" do
      next_progression = Progression.new(lesson_number: 4, part_number: 1, student_id: 2).next
      expect(next_progression.lesson_number).to eq 4
      expect(next_progression.part_number).to eq 2
      expect(next_progression.student_id).to eq 2
    end

    it "returns the next progression in the lesson sequence" do
      next_progression = Progression.new(lesson_number: 4, part_number: 3, student_id: 2).next
      expect(next_progression.lesson_number).to eq 5
      expect(next_progression.part_number).to eq 1
      expect(next_progression.student_id).to eq 2
    end

    it "returns nil if there is no next progression in the lesson sequence" do
      next_progression = Progression.new(lesson_number: 100, part_number: 3, student_id: 2).next
      expect(next_progression).to eq nil
    end
  end
end
