class Api::TypeaheadController < ApplicationController
  def index
    input= params[:input]
    @users= User.where("first_name LIKE ? OR last_name LIKE ? OR email LIKE ?", "%#{input}%", "%#{input}%","%#{input}%").limit(10)
    render json: @users.map {| user| { id: user.id,text:"#{user.first_name}#{user.last_name} email: #{user.email}"}}
  end
end
