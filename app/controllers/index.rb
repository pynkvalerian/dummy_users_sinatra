#login page
get '/' do
  # Look in app/views/index.erb
  erb :index
end

#form for signups
get '/sign_in' do
  #if successful
  erb :sign_in
end

post '/sign_in' do
  @email = params[:email]
  @password = params[:password]

  if User.authenticate(@email, @password)
    user = User.find_by email: @email
    session[:user_id] = user.id
    redirect to '/secret'
  else
    redirect to '/'
  end
end

get '/register' do
  erb :register
end

post '/register' do
  p session[:email]
  byebug

  @name = params[:name]
  @email = params[:email]
  @password = params[:password]

  if User.check_duplicate(@email) == false
    redirect to '/'
  else
    @user = User.create(name: @name, email: @email, password: @password)
    erb :secret
  end
end

get '/secret' do
  if session[:user_id]
    @user = User.find(session[:user_id])
    erb :secret
  else
    redirect '/sign_in'
  end
end

post '/logout' do
  session[:user_id] = nil
  redirect to '/'
end
