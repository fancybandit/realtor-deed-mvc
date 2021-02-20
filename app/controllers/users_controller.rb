class UsersController < ApplicationController

  # GET: /users
  get "/users" do
    erb :"/users/index.html"
  end

  # GET: /users/new
  get "/signup" do
    erb :"/users/new.html"
  end

  # POST: /users
  post "/signup" do
    user = User.create(params[:user])
    if user.valid?
      flash[:success] = "Successfully signed-in new user"
      session[:user_id] = user.id
      redirect "/users" #ACKNOWLEDGE
    else
      flash[:error] = user.errors.full_messages.first
      redirect "/signup"
    end
  end

  # GET: /users/5
  get "/users/:id" do
    erb :"/users/show.html"
  end

  # GET: /users/5/edit
  get "/users/:id/edit" do
    erb :"/users/edit.html"
  end

  # PATCH: /users/5
  patch "/users/:id" do
    redirect "/users/:id"
  end

  # DELETE: /users/5/delete
  delete "/users/:id/delete" do
    redirect "/users"
  end
end
