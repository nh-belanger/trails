class UsersController < ApplicationController


  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "User created!"
      redirect_to users_path
    else
      flash[:alert] = "User not created"
      render :new
    end
  end

  def update
    @user = User.find(params[:id])
    @user.update_attributes(user_params)
    if @user.save
      flash[:notice] = "Nothing bad happened :)"
      redirect_to users_path
    else
      flash[:alert] = "Something went wrong"
      render :show
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :role, :profile_picture)
  end
end
