class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts
  end
  def new
    @user=User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sample App"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
      @user = User.find(params[:id])
      unless @user == current_user
        redirect_to root_path
      end
  end

  def update
    @user = User.find(params[:id])
    unless @user == current_user
      redirect_to root_path
    end
    if @user.update_attributes(user_params)
      flash[:info] = "Your profile has been saved."
      redirect_to user_path(@user)
    else
      render :edit
    end
  end
  
  def followings
    @user  = User.find(params[:id])
    @following_users = @user.following_users
  end
  
  def followers
    @user = User.find(params[:id])
    @follower_users = @user.follower_users
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:area, :bio)
  end
end