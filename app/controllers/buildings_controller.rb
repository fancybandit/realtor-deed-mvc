class BuildingsController < ApplicationController

  # GET: /buildings
  get "/buildings" do
    @properties = current_user.properties
    @buildings = current_user.buildings
    erb :"/buildings/index.html"
  end

  # GET: /buildings/new
  get "/buildings/new" do
    @properties = current_user.properties
    erb :"/buildings/new.html"
  end
  
  # GET: /buildings/5
  get "/buildings/:id" do
    find_building
    is_owner_of?(@building)
    erb :"/buildings/show.html"
  end
  
  # GET: /buildings/5/edit
  get "/buildings/:id/edit" do
    find_building
    is_owner_of?(@building)
    @properties = current_user.properties
    erb :"/buildings/edit.html"
  end
  
  # POST: /buildings
  post "/buildings" do
    property = current_user.properties.find_by_id(params[:property][:id])
    is_owner_of?(property)
    building = property.buildings.create(params[:building])
    if building.valid?
      flash[:success] = "Successfully recorded a new building"
      redirect "/buildings/#{ building.id }"
    else
      flash[:error] = building.errors.full_messages.first
      redirect "/buildings/new"
    end
  end

  # PATCH: /buildings/5
  patch "/buildings/:id" do
    find_building
    is_owner_of?(@building)
    if @building.update(year_built: params[:building][:year_built], price: params[:building][:price], property_id: params[:property][:id])
      flash[:success] = "Successfully updated existing building"
      redirect "/buildings/#{@building.id}"
    else
      flash[:error] = @building.errors.full_messages.first
      redirect "/buildings/#{@building.id}/edit"
    end
  end

  # DELETE: /buildings/5/delete
  delete "/buildings/:id" do
    find_building
    is_owner_of?(@building)
    if @building.destroy
      flash[:success] = "Successfully deleted existing building"
      redirect "/buildings"
    else
      flash[:error] = @building.errors.full_messages.first
      redirect "/buildings/#{@building.id}/edit"
    end
  end

  private

  def find_building
    @building = Building.find_by(id: params[:id])
  end

end
