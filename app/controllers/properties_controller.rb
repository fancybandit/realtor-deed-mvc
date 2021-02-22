class PropertiesController < ApplicationController

  before("/properties/*") do #QUESTION EVERYTHING BUT /PROPERTIES(/:id)
    redirect_if_not_logged_in if request.path_info != "/login"
  end

  # GET: /properties
  get "/properties" do
    erb :"/properties/index.html"
  end

  # GET: /properties/new
  get "/properties/new" do
    erb :"/properties/new.html"
  end

  # POST: /properties
  post "/properties" do
    redirect "/properties"
  end

  # GET: /properties/5
  get "/properties/:id" do
    erb :"/properties/show.html"
  end

  # GET: /properties/5/edit
  get "/properties/:id/edit" do
    erb :"/properties/edit.html"
  end

  # PATCH: /properties/5
  patch "/properties/:id" do
    redirect "/properties/:id"
  end

  # DELETE: /properties/5/delete
  delete "/properties/:id/delete" do
    redirect "/properties"
  end
end
