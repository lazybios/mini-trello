class UsersController < ApplicationController
  def signup
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:token] = @user.token
      redirect_to :root, success: '注册成功'
    else
      flash[:fail] = @user.errors
      render :signup
    end
  end

  def login
  end

  def create_login_session
    user = User.find_by_username(params[:user][:username])
    if user && user.authenticate(params[:user][:password])
      session[:token] = user.token
      redirect_to :root, success: '登录成功'
    else
      render :login, fail: '登录失败'
    end
  end

  def logout
    session[:token] = nil
    redirect_to :root
  end

  private

  def user_params
    params.require(:user).permit(:username, :password, :password_confirmation)
  end
end
