
class SessionsController < ApplicationController

  before("/logout") do
    redirect_if_not_logged_in
  end

  get "/login" do
    redirect "/users/#{current_user.slug}" if logged_in?
    erb :"/sessions/login.html"
  end

  get "/logout" do
    session.clear
    redirect "/"
  end

  post "/login" do
    user = User.find_by_email(params[:user][:email])
    if user && user.authenticate(params[:user][:password])
      session[:user_id] = user.id
      flash[:success] = "Successfully logged in"
      redirect "/users/#{current_user.slug}"
    else
      flash[:error] = "Invalid credentials"
      redirect "/login"
    end
  end

end

