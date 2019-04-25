class UsersController < ApplicationController
  def index
  end

  def login_form
    @user = User.new
  end

  def login
    username = params[:user][:username]
    user = User.find_by(username: username)

    if !user
      user = User.create(username: username)
    end
    session[:user_id] = user.id
    flash[:status] = :success
    flash[:message] = "Successfully logged in as #{username}"
    redirect_to root_path
  end

  def logout
  end

  def current
  end
end
