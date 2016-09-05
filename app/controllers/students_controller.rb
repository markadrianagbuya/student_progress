class StudentsController < ApplicationController

  def show
    render :json => {"student_id" => 1, "lesson_number" => 1, "part_number" => 1}
  end

end
