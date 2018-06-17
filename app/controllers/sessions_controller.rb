class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      #success
      # ユーザーログイン後にユーザー情報のページにリダイレクトする
      log_in user #login
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user #userpageにリダイレクト
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end

end
