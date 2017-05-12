class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @teacher = @student.teacher if @student.teacher_id != nil
    if session[:id] == @student.teacher_id
      render 'edit'
    else
      redirect_to student_path(params[:id]), flash: {errors: "You are not authorized to edit this student"}
    end
  end

  def update
    @student = Student.find(params[:id])
    @student.assign_attributes(student_params)

    if student_params[:teacher_id] == "1"
      @student.teacher_id = nil
    else
       @student.teacher_id = session[:id]
    end
    if @student.save
      redirect_to student_path
    else
      @errors = @student.errors.full_messages
      render 'edit'
    end
  end

  def nonpicked
    @student_nonpicked = Student.where(teacher_id: nil)
  end

  private

  def student_params
     params.require(:student).permit(:image, :name, :phase, :gender, :gpa, :num_detentions, :shirt_size, :dietary_restrictions, :emergency_contact_name, :emergency_contact_num, :teacher_id)
  end
end
