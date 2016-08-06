class UsersController < ApplicationController

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
    @user.assign_attributes({email: params[:email]})
    @user.save
    redirect_to "/users/#{@user.id}"
  end

end
