
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

  private

  def find_deed
    @deed = Deed.find_by(id: params[:id])
  end

end

