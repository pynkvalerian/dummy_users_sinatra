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

get '/register' do
  erb :register
end

post '/register' do

  @name = params[:name]
  @email = params[:email]
  @password = params[:password]

  if User.check_duplicate(@email) == false
    redirect to '/'
  else
    @user = User.create(name: @name, email: @email, password: @password)
    redirect to '/sign_in'
  end
end
