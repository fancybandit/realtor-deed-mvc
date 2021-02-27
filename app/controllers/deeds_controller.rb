
class DeedsController < ApplicationController

  before("/deeds") do
    redirect_if_not_logged_in # if request.path_info != "/login"
  end

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
    if Deed.exists?(params[:id])
      @deed = Deed.find_by(id: params[:id])
    else
      redirect "/deeds"
    end
  end

end

