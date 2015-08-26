post '/sign_in' do
  @email = params[:email]
  @password = params[:password]

  if User.authenticate(@email, @password)
    user = User.find_by email: @email
    session[:user_id] = user.id
    current_user
    redirect to '/secret'
  else
    redirect to '/'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end

get '/secret' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :secret
  else
    redirect '/sign_in'
  end
end

