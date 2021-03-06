
class DeedsController < ApplicationController

  ['/deeds', "/deeds/*"].each do |path|
    before path do
      redirect_if_not_logged_in
    end
  end

  get "/deeds" do
    @deeds = current_user.deeds
    erb :"/deeds/index.html"
  end

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

