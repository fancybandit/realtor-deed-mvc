class UsersController < ApplicationController

  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/5
  get "/users/:slug" do
    @user = User.find_by_slug(params[:slug])
    if @user
      erb :"/users/show.html"
    else
      flash[:error] = "Unable to find the user you requested"
      redirect "/users"
    end
  end

  # GET: /users/new
  get "/signup" do
    if logged_in?
      redirect "/users/#{current_user.slug}"
    else
      erb :"/users/new.html"
    end
  end

  # GET: /users/5/edit
  get "/users/:slug/edit" do
    redirect_if_not_logged_in
    erb :"/users/edit.html"
  end
  
  # POST: /users
  post "/signup" do
    user = User.create(params[:user])
    if user.valid?
      session[:user_id] = user.id
      flash[:success] = "Successfully signed-in new user"
      redirect "/users/#{current_user.slug}"
    else
      flash[:error] = user.errors.full_messages.first
      redirect "/signup"
    end
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:slug/delete" do
    redirect "/users"
  end
end
