class SessionsController <ApplicationController

def new
end

def create
  @teacher = Teacher.find_by(email: session_params["email"])
    p "***************"
    p session_params["password"]
    p @teacher

  if @teacher.authenticate(session_params["password"]) == @teacher

    login(@teacher)
    redirect_to root_path
  else
    if @teacher.authenticate(session_params["password"]) == false
      @errors = ["Password or Email is invalid"]
      p ("$") * 100
    else
      @errors = @teacher.errors.full_messages
    end
    render 'new'
  end

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
