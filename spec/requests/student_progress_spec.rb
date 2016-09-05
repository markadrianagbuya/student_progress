require "rails_helper"

RSpec.describe "Student Progress", :type => :request do
  it "sets a student's progress" do
    Student.create(id: 1)
    post "/progressions", {student_id: 1, lesson_number: 1, part_number: 1}

    get "/students/1"
    json_response = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(json_response).to include("id" => 1, "lesson_number" => 1, "part_number" => 1)
  end

  it "sets a student's progress" do
    Student.create(id: 3)
    post "/progressions", {student_id: 3, lesson_number: 3, part_number: 2}

    get "/students/3"
    json_response = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(json_response).to include("id" => 3, "lesson_number" => 3, "part_number" => 2)
  end
end