get '/' do
  erb :index
end

#----------- SESSIONS -----------

get '/sessions/new' do
  erb :sign_in
end

post '/sessions' do
  user = User.find_by_email(params[:email])
  login(user)
end

delete '/sessions/:id' do
  session.clear
end

#----------- USERS -----------

get '/users/new' do
  # render sign-up page
  erb :sign_up
end

post '/users' do
  puts params.inspect
  if @user = User.create(params[:user])
    session[:id] = @user.id
    redirect to '/'
  else
    @error = @user.errors
    redirect to '/'
  end
end
