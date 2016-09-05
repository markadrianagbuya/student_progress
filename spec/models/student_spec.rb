require 'rails_helper'

RSpec.describe Student, type: :model do

  describe "#as_json" do
    it "includes lesson progression information" do
      student = Student.create(id: 3)

      expect(student.as_json).to include("id" => 3, "lesson_number" => 3, "part_number" => 2)
    end
  end
end
