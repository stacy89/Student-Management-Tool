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
      render 'new', status: 406
    end
  end

  def group
    search_by = group_params
    @teacher = Teacher.find(session[:id])
    @students = @teacher.students
    @groups = @teacher.group_by(search_by["sizes"].to_i, search_by["criteria"])
    render 'show'
  end

  def admin_create
    @teacher = Teacher.find(session[:id])
    @students = @teacher.students
    code = admin_params
    if @teacher.admin_code == code["access_code"]
    @teacher.admin_status = 1
    @teacher.save
    else
      @errors = ["Invalid code"]
    end
    render 'show'
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name, :email, :phone, :password)
  end

  def group_params
    params.permit("sizes", "criteria")
  end

  def admin_params
    params.permit("access_code")
  end
end
