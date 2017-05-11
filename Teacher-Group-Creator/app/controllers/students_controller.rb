class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def nonpicked
    @student_nonpicked = Student.where(teacher_id: nil)
  end

end
