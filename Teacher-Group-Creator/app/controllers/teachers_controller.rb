class TeachersController < ApplicationController

  def index
    @teachers = Teacher.all
  end

  def show
    @teacher = Teacher.find(params[:id])
    @students = @teacher.students
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)

    if @teacher.save
      redirect_to students_path
    else
      @errors = @teacher.errors.full_messages
      status 406
    end
  end



  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :password)
  end


end
