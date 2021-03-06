class SessionsController < ApplicationController

  before_action :authenticate_user!, except: ['new', 'create']


  def new
    render 'new.html.erb'
  end

  def create
    user = User.find_by(email: params[:inputEmail])
    if user && user.authenticate(params[:inputPassword])
      session[:user_id] = user.id
      flash[:success] = 'Successfully logged in!'
      redirect_to '/groups'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'Successfully logged out!'
    redirect_to '/login'
  end
end
