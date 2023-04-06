class Api::UsersController < ApplicationController
  
  def index
    @users = User.all

    render json: @users, only:[:id,:first_name,:last_name,:email]
  end

  def new
    @user = User.new
    render json:user 
    
  end

  
  def create
    @user = User.new(user_params)

    if @user.save
      render json:" user has been created"
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  def show
      @user = User.find(params[:id])
    render json: @user,only:[:id,:first_name,:last_name,:email]
  

  end

def edit
   @user = User.find(params[:id])
   render json:@user
    
end
 
  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      render json: @user
      
    else
      render json: {errors: "User not found"}
    end
  end

  
  def destroy
     @user = User.find(params[:id])
    @user.destroy
    render json:" user has been deleted"
  end

  def show_name
    @search = User.new(search_params)
    @users = search_params.present? ? @search.results : User.all
    render json:@user ,only:[:first_name,:last_name]
  end

  private

    def user_params
      params.require(:user).permit(:first_name, :last_name,:email)
    end


end
