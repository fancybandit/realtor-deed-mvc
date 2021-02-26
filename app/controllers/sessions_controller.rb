class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    redirect "/users/#{current_user.slug}" if logged_in?
    erb :"/sessions/login.html"
  end

  # GET: /sessions/new
  get "/logout" do
    session.clear
    redirect "/"
  end

  # POST: /sessions
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

  # GET: /sessions/5
  get "/sessions/:id" do
    erb :"/sessions/show.html"
  end

  # GET: /sessions/5/edit
  get "/sessions/:id/edit" do
    erb :"/sessions/edit.html"
  end

  # PATCH: /sessions/5
  patch "/sessions/:id" do
    redirect "/sessions/:id"
  end

  # DELETE: /sessions/5/delete
  delete "/sessions/:id/delete" do
    redirect "/sessions"
  end
end
