class StudentsController < ApplicationController
  def index
    if logged_in?
      @students = Student.all
      @teacher = Teacher.find(session[:id])
    else
      redirect_to new_session_path, :flash => { :error => "Must be logged in" }
    end
  end

  def show
    if logged_in?
      @student = Student.find(params[:id])
      @currentuser = Teacher.find(session[:id])
    else
      redirect_to new_session_path, :flash => { :error => "Must be logged in" }
    end
  end

  def edit
    if logged_in?
      @student = Student.find(params[:id])
      @currentuser = Teacher.find(session[:id])
      @teacher = @student.teacher if @student.teacher_id != nil
      if session[:id] == @student.teacher_id || @currentuser.admin_status != 2
        render 'edit'
      else
        redirect_to student_path(params[:id]), flash: {errors: "You are not authorized to edit this student"}
      end
    else
      redirect_to new_session_path, :flash => { :error => "Must be logged in" }
    end
  end

  def update
    @teacher = Teacher.find(session[:id])
    @student = Student.find(params[:id])
    @student.assign_attributes(student_params)
    if logged_in?
      if student_params[:teacher_id] == "1"
        @student.teacher_id = nil
      else
       @student.teacher_id = session[:id]
      end
      if @student.save
      redirect_to teacher_path(@teacher)
      else
      @errors = @student.errors.full_messages
      render 'edit'
      end
    else
    redirect_to new_session_path, :flash => { :error => "Must be logged in" }
    end
end

def nonpicked
  if logged_in?
  @student_nonpicked = Student.where(teacher_id: nil)
  else
  redirect_to new_session_path, :flash => { :error => "Must be logged in" }
  end
end

def assign_student
  @teacher = Teacher.find(session[:id])
  @student = Student.find(params[:id])
  @student.teacher_id = session[:id]
  @student.save
  redirect_to teacher_path(@teacher)
end

private

def student_params
 params.require(:student).permit(:image, :name, :phase, :gender, :gpa, :num_detentions, :shirt_size, :dietary_restrictions, :emergency_contact_name, :emergency_contact_num, :teacher_id)
end
end
