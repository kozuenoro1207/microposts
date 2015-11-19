class UsersController < ApplicationController
  before_action :logged_in_user, only: [:edit, :update]
  def show
    @user = User.find(params[:id])
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
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update_attributes(user_params)
      flash[:info] = "Your profile has been saved."
      redirect_to user_url(@user)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation,:area, :bio)
  end
end