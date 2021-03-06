
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, ENV['SESSION_SECRET']
    register Sinatra::Flash
  end

  get "/" do
    erb :"index.html"
  end

  get ["/log-in", "/signin", "/sign-in"] do
    redirect "/login"
  end

  error Sinatra::NotFound do
    erb :"error.html"
  end

  helpers do

    def current_user
      @current_user ||= User.find_by_id(session[:user_id]) if session[:user_id]
    end

    def logged_in?
      !!current_user
    end

    def redirect_if_not_logged_in
        redirect "/login" if !logged_in?
    end

    def is_owner_of?(obj)
      if current_user != obj.owner
        flash[:error] = "You don't have permission to view this page!"
        redirect "/properties"
      end
    end
  end

end

