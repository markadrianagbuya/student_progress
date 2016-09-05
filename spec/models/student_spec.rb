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

  describe "#make_progress" do
    it "progresses the student to the next part" do
      student = Student.create(id: 2)
      Progression.create(lesson_number: 4, part_number: 1, student_id: 2)
      student.make_progress

      expect(student.part_number).to eq 2
      expect(student.lesson_number).to eq 4
    end

    # it "progresses the student to the next lesson" do
    #   student = Student.create(id: 2)
    #   Progression.create(lesson_number: 4, part_number: 3, student_id: 2)
    #   student.make_progress

    #   expect(student.part_number).to eq 1
    #   expect(student.lesson_number).to eq 5
    # end

    # it "ignores the command if no progress can be made" do
    #   student = Student.create(id: 2)
    #   Progression.create(lesson_number: 100, part_number: 3, student_id: 2)
    #   student.make_progress

    #   expect(student.part_number).to eq 3
    #   expect(student.lesson_number).to eq 100
    # end
  end
end
