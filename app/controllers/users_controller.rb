class UsersController < ApplicationController

before_action :authenticate_user!, except: ['new']

  def show
    @user = User.find_by(id: params[:id])
    render 'show.html.erb'
  end

  def edit
    @user = User.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @user = User.find_by(id: params[:id])
    @user.assign_attributes(
      {
      username: params[:username],
      email: params[:email]
      }
      )
    @user.save
    redirect_to "/users/#{@user.id}"
  end

  def new
    render 'new.html.erb'
  end

  def create
    user = User.new(
      username: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation]
    )
    if user.save
      session[:user_id] = user.id
      flash[:success] = 'Successfully created account!'
      redirect_to '/'
    else
      flash[:warning] = 'Invalid email or password!'
      redirect_to '/signup'
    end
  end

end
