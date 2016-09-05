require 'rails_helper'

RSpec.describe Student, type: :model do

  describe "#as_json" do
    it "includes lesson progression information" do
      student = Student.create(id: 3)
      Progression.create(lesson_number: 3, part_number: 2, student_id: 3)

      expect(student.as_json).to include("id" => 3, "lesson_number" => 3, "part_number" => 2)
    end

    it "includes lesson progression information" do
      student = Student.create(id: 2)
      Progression.create(lesson_number: 4, part_number: 3, student_id: 2)

      expect(student.as_json).to include("id" => 2, "lesson_number" => 4, "part_number" => 3)
    end
  end
end
