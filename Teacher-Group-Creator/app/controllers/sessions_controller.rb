class SessionsController <ApplicationController

def new
end

def create
  @teacher = Teacher.find_by(email: session_params[:email])

  if @teacher
    login(@teacher)
  else
    @errors = @teacher.errors.full_messages
    render 'new'
  end
  redirect_to root_path
end

def destroy
  logout
  redirect_to root_path
end

private

def session_params
  params.require(:session).permit(:email, :password)
end
end
