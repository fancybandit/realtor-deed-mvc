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

  # GET: /properties/5
  get "/properties/:id" do
    find_property
    is_owner_of?(@property)
    erb :"/properties/show.html"
  end
  
  # GET: /properties/5/edit
  get "/properties/:id/edit" do
    find_property
    is_owner_of?(@property)
    erb :"/properties/edit.html"
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

  # PATCH: /properties/5
  patch "/properties/:id" do
    find_property
    is_owner_of?(@property)
    @property.update(params[:property])
    redirect "/properties/#{@property.id}"
  end

  # DELETE: /properties/5/delete
  delete "/properties/:id" do
    find_property
    is_owner_of?(@property)
    @property.destroy
    redirect "/properties"
  end

  private

  def find_property
    if Property.exists?(params[:id])
      @property = Property.find_by(id: params[:id])
    else
      redirect "/properties"
    end
  end

end
