class GroupsController < ApplicationController
  before_action :confirm_logged_in
	before_action :find_group, except: [:index, :new, :create]

  def index
    @groups = current_user.groups
  end
 
  def new
  	@group = Group.new
  end

  def create
  	@group = Group.new group_params
  	@group.save
  	redirect_to groups_path
  end

  def edit
  end

  def update
  	@group.update group_params
  	redirect_to group_path(@group)
  end

  def show
  end

  def destroy
  	@group.destroy
  	redirect_to groups_path
  end

  private
  	def group_params
  		params.require(:group).permit(:name)
  	end

  	def find_group
  		@group = Group.find_by_id params[:id]
  	end

end
