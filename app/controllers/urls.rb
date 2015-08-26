post '/urls' do
  # create a new Url
  @url = params[:url]

  @url = Url.new(long_url: @url, shortened_url: Url.generate_short_url, click_count: 0)

  if logged_in? == true
    byebug
    @user = User.find(session[:user_id])
    if @url.valid?
      @url.save
      @user.urls << @url
    end

  else
    @url.save if @url.valid?

  end

  if @url.valid? == true
    erb :short
  else
    erb :invalid
  end
end

# # HOW TO CREATE ASSOCIATIONS USING ACTIVE RECORD

#   @user = User.find(session[:user_id])
#   @url = Url.new(url: @url, shortened_url: Url.generate_short_url, click_count: 0)
#   if @url.save
#     @user.urls << @url
#   else
#     asdasd
#   end

#   @url = @user.urls.new(url: @url, shortened_url: Url.generate_short_url, click_count: 0)
#   if @url.save
#     asdasd
#   else
#     asdasd
#   end


# e.g., /q6bda
get '/s/:short_url' do
  # redirect to appropriate "long" URL
  @url = Url.get_url(params[:short_url])
  redirect to(@url)
end