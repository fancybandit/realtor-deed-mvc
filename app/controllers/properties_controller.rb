class PropertiesController < ApplicationController

  get "/properties" do
    @properties = current_user.properties
    erb :"/properties/index.html"
  end

  get "/properties/new" do
    erb :"/properties/new.html"
  end

  get "/properties/:id" do
    find_property
    is_owner_of?(@property)
    erb :"/properties/show.html"
  end

  get "/properties/:id/edit" do
    find_property
    is_owner_of?(@property)
    erb :"/properties/edit.html"
  end

  post "/properties" do
    property = current_user.properties.create(params[:property])
    if property.valid?
      flash[:success] = "Successfully recorded a new property"
      redirect "/properties/#{property.id}"
    else
      flash[:error] = property.errors.full_messages.first
      redirect "/properties/new"
    end
  end

  patch "/properties/:id" do
    find_property
    is_owner_of?(@property)
    if @property.update(params[:property])
      flash[:success] = "Successfully updated existing property"
      redirect "/properties/#{@property.id}"
    else
      flash[:error] = @property.errors.full_messages.first
      redirect "/properties/#{@property.id}/edit"
    end
  end

  # DELETE: /properties/5/delete
  delete "/properties/:id" do
    find_property
    is_owner_of?(@property)
    if @property.destroy
      flash[:success] = "Successfully deleted existing property"
      redirect "/properties"
    else
      flash[:error] = @property.errors.full_messages.first
      redirect "/properties/#{@property.id}"
    end
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
