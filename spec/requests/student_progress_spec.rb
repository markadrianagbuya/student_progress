require "rails_helper"

RSpec.describe "Student Progress", :type => :request do
  it "sets a student's progress" do
    post "/progressions", progression: {student_id: 1, lesson_number: 1, part_number: 1}

    get "/students/1"
    json_response = JSON.parse(response.body)

    expect(response.content_type).to eq("application/json")
    expect(response).to be_success
    expect(json_response).to include("student_id" => 1, "lesson_number" => 1, "part_number" => 1)
  end
end