class PropertiesController < ApplicationController

  before("/properties/*") do #QUESTION EVERYTHING BUT /PROPERTIES(/:id)
    redirect_if_not_logged_in if request.path_info != "/login"
  end

  # GET: /properties
  get "/properties" do
    @properties = current_user.properties
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
    find_property #CREATE BEFORE
    erb :"/properties/show.html"
  end

  # GET: /properties/5/edit
  get "/properties/:id/edit" do
    find_property
    not_owner?(@property)
    erb :"/properties/edit.html"
  end

  # PATCH: /properties/5
  patch "/properties/:id" do
    find_property
    not_owner?(@property)
    
    redirect "/properties/:id"
  end

  # DELETE: /properties/5/delete
  delete "/properties/:id/delete" do
    redirect "/properties"
  end

  private

  def find_property
    @property = Property.find_by(params[:id])
  end

end
