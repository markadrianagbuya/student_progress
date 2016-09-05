require "rails_helper"

RSpec.feature "Student progress", :type => :feature do
  scenario "Teacher views progress of their students" do
    teacher = Teacher.create!
    classroom_1 = Classroom.create!(teacher_id: teacher.id)
    classroom_2 = Classroom.create!(teacher_id: teacher.id)
    create_student_with_progression(classroom_id: classroom_1.id, lesson_number: 1, part_number: 1)
    create_student_with_progression(classroom_id: classroom_2.id, lesson_number: 3, part_number: 2)
    create_student_with_progression(classroom_id: classroom_2.id, lesson_number: 4, part_number: 3)

    visit "/student_progress_report?teacher_id=#{teacher.id}"

    expect(page).to have_text("Student id: 1, Lesson number: 1, Part number: 1")
    expect(page).to have_text("Student id: 2, Lesson number: 3, Part number: 2")
    expect(page).to have_text("Student id: 3, Lesson number: 4, Part number: 3")
  end

  def create_student_with_progression(classroom_id:, lesson_number:, part_number:)
    student = Student.create(classroom_id: classroom_id)
    Progression.create!(student_id: student.id, lesson_number: lesson_number, part_number: part_number)
  end

end