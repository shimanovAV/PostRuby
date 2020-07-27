class UserService
  def get_users_by_login(params)
    users_per_page = params[:per] ? params[:per].to_i : 10
    skipped_users = [(params[:page].to_i-1)*users_per_page, 0].max
    User.where('login LIKE ?', "%#{params[:login]}%").limit(users_per_page).offset(skipped_users)
  end
end
