class BuildingsController < ApplicationController

  # GET: /buildings
  get "/buildings" do
    erb :"/buildings/index.html"
  end

  # GET: /buildings/new
  get "/buildings/new" do
    erb :"/buildings/new.html"
  end

  # POST: /buildings
  post "/buildings" do
    redirect "/buildings"
  end

  # GET: /buildings/5
  get "/buildings/:id" do
    erb :"/buildings/show.html"
  end

  # GET: /buildings/5/edit
  get "/buildings/:id/edit" do
    erb :"/buildings/edit.html"
  end

  # PATCH: /buildings/5
  patch "/buildings/:id" do
    redirect "/buildings/:id"
  end

  # DELETE: /buildings/5/delete
  delete "/buildings/:id/delete" do
    redirect "/buildings"
  end
end
