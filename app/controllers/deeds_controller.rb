
class DeedsController < ApplicationController

  # GET: /deeds
  get "/deeds" do
    @deeds = current_user.deeds
    erb :"/deeds/index.html"
  end

  # GET: /deeds/5
  get "/deeds/:id" do
    find_deed
    is_owner_of?(@deed)
    erb :"/deeds/show.html"
  end
  
  # GET: /deeds/5/edit
  get "/deeds/:id/edit" do
    find_deed
    is_owner_of?(@deed)
    erb :"/deeds/edit.html"
  end
  
  # POST: /deeds
  post "/deeds" do
    redirect "/deeds"
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

