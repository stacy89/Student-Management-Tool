class AdminsController < ApplicationController

  def index
    if logged_in?
      @teacher = Teacher.find(session[:id])
      if @teacher.admin_status == 0
        @admins = Teacher.where(admin_status: 1)
        @not_admins = Teacher.where(admin_status: 2)
      else
        redirect_to teacher_path(@teacher), :flash => { :error => "Unauthorized entry" }
      end
    else
      redirect_to new_session_path, :flash => { :error => "Must be logged in" }
    end
  end

end
