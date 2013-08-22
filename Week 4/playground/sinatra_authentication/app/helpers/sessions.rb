helpers do

  def login(user)
    if returned_user = User.where('email = ?', params[:email]).first
      if returned_user.password == params[:password]
        session[:id] = user.id
      end
    end
    redirect '/'
  end

  def current_user
    user = User.find_by_id(session[:id])
  end

end
