class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email:params[:email].downcase)
    if user && user.authenticate(params[:password])
      log_in(user)
      redirect_to :root
    else
      flash.now[:alert]="이메일 또는 패스워드가 잘못 되었습니다"
      render 'new'
    end
    
  end
  
  def destroy
    log_out
    redirect_to :root
  end
  
end
