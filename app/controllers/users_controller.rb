class UsersController < ApplicationController
	  before_action :authenticate_user!
  def index
  	users = User.all
  end
  def show
  	@user = User.find(params[:id])
  	@books = @user.books
  	@book = Book.new
  end
  def edit
  	@user = User.find(params[:id])
  end
  def update
  	@user = User.find(params[:id])
  	if@user.update(user_params)
  		redirect_to user_path(@user.id)
  	else
  		render :edit
  	end
  end
  def creaet
  end
  protected
  def after_update_path_for(resource)
  	user_path(id: current_user.id)
  end
  private
  def user_params
  	params.require(:user).permit(:name,:profile_image)
  end
end
