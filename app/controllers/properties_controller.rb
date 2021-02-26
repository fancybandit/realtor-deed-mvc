class PropertiesController < ApplicationController

  before("/properties") do
    redirect_if_not_logged_in # if request.path_info != "/login"
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
    property = current_user.properties.create(params[:property])
    if property.valid?
      flash[:success] = "Successfully recorded a new property"
      redirect "/properties/#{ property.id }"
    else
      flash[:error] = property.errors.full_messages.first
      redirect "/properties/new"
    end
  end

  # GET: /properties/5
  get "/properties/:id" do
    find_property #CREATE BEFORE
    if current_user == @property.owner
      erb :"/properties/show.html"
    else
      redirect "/properties"
    end
  end

  # GET: /properties/5/edit
  get "/properties/:id/edit" do
    find_property
    is_owner_of?(@property)
    erb :"/properties/edit.html"
  end

  # PATCH: /properties/5
  patch "/properties/:id" do
    find_property
    is_owner_of?(@property)

    redirect "/properties/:id"
  end

  # DELETE: /properties/5/delete
  delete "/properties/:id/delete" do
    redirect "/properties"
  end

  private

  def find_property
    @property = Property.find_by(id: params[:id])
  end

end
