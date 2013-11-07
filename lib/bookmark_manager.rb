require 'sinatra/base'
require 'rack-flash'
require_relative 'link'

class BookmarkManager < Sinatra::Base

  use Rack::Flash 

  enable :sessions
  set :session_secret, 'incredible sensitive devesh'

  set :views, File.join(File.dirname(__FILE__), '..', 'views')

  get '/' do
  	@links = Link.all
  	erb :index
  end

  get '/add_link' do
    erb :add_link
  end

  get '/tags' do 
    @tags = Tag.all
    erb :tags
  end

  get '/tags/:text' do
    tag = Tag.first(:text => params[:text])
    @links = Link.all.select {|link| link.tags.include? tag }
    erb :index
  end

  get '/sign_in' do 
    erb :sign_in
  end

  get '/sign_up' do
    @user = User.new
    erb :sign_up
  end

  post '/links' do 
    uri = params["uri"]
    title = params["title"]
    description = params["description"]
    tags = params["tags"].split(" ").map do |tag|
      Tag.first_or_create(:text => tag)
    end
    Link.create(:title => title, :uri => uri, :description => description, :tags => tags)
    redirect to('/')
  end

  post '/sign_up' do 
    @user = User.create(:email => params[:email], :password => params[:password], :password_confirmation => params[:password_confirmation])
    
    if @user.save
      session[:user_id] = @user.id 
      redirect to ('/')
    else 
      flash.now[:errors] = @user.errors.full_messages
      erb :sign_up 
    end

  end

  helpers do 

    def current_user 
      @current_user ||= User.get(session[:user_id]) if session[:user_id]
    end

  end

  # post '/'

  # post '/sign_up' do 
  #   name = params["name"]
  #   email = params["email"]
  #   password = params["password"]
  #   User.first_or_create(:text => tag)
  #   end
  #   Link.create(:title => title, :uri => uri, :description => description, :tags => tags)
  #   redirect to('/')
  # end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
