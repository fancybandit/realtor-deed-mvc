
class DeedsController < ApplicationController

  # GET: /deeds
  get "/deeds" do
    @deeds = current_user.deeds
    erb :"/deeds/index.html"
  end

  # GET: /deeds/new
  get "/deeds/new" do
    erb :"/deeds/new.html"
  end

  # POST: /deeds
  post "/deeds" do
    redirect "/deeds"
  end

  # GET: /deeds/5
  get "/deeds/:id" do
    find_deed
    if current_user == @deed.owner
      erb :"/deeds/show.html"
    else
      redirect "/deeds"
    end
  end

  # GET: /deeds/5/edit
  get "/deeds/:id/edit" do
    erb :"/deeds/edit.html"
  end

  # PATCH: /deeds/5
  patch "/deeds/:id" do
    redirect "/deeds/:id"
  end

  # DELETE: /deeds/5/delete
  delete "/deeds/:id/delete" do
    redirect "/deeds"
  end

  private

  def find_deed
    @deed = Deed.find_by(id: params[:id])
  end

end

