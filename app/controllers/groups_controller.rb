class GroupsController < ApplicationController


  def index
    @groups = Group.all
    render 'index.html.erb'
  end

  def show
    @group = Group.find_by(id: params[:id])
    @members = @group.users
    render 'show.html.erb'
  end

  def new
    render 'new.html.erb'
  end

  def create
     @group = Group.new(
      name: params[:name],
      location: params[:location])
     @group.save
    redirect_to "/groups/#{@group.id}"
  end

  def edit
    @group = Group.find_by(id: params[:id])
    render 'edit.html.erb'
  end

  def update
    @group = Group.find_by(id: params[:id])
    @group.assign_attributes(
    { name: params[:name],
      location: params[:location]
      })
    @group.save
    redirect_to "/groups/#{@group.id}"
  end

  def delete
    group = Group.find_by(id: params[:id])
    group.destroy
    redirect_to '/groups'
  end

end
