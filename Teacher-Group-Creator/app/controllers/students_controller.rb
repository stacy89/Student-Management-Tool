class StudentsController < ApplicationController
  def index
    @students = Student.all
  end

  def show
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
  end

  def update
    @student = Student.find(params[:id])
    @student.assign_attributes(student_params)

    if @student.save
      redirect_to root_path
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
     params.require(:student).permit(:name, :phase, :gender, :gpa, :num_detentions, :shirt_size, :dietary_restrictions, :emergency_contact_name, :emergency_contact_num)
  end



end
