class ProgressionsController < ApplicationController

  def create
    Progression.create(params.permit(:student_id, :lesson_number, :part_number))
    render nothing: true
  end

end
