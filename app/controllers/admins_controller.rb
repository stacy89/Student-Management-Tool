class AdminsController < ApplicationController

  def index
    @teacher = Teacher.find(session[:id])

    if @teacher.admin_status == 0
      @admins = Teacher.where(admin_status: 1)
      @not_admins = Teacher.where(admin_status: 2)
    else
      redirect_to root_path, flash: {error: "You are not a super admin.You are not authorized"}
    end

  end

end
