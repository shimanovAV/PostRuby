class UsersController < ApplicationController
  respond_to :json

  def index
    respond_with(user_service.get_users_by_login(user_params))
  end

  private

  def user_params
    params.permit(:login, :page, :per)
  end

  def user_service
    @user_service ||= UserService.new
  end
end
