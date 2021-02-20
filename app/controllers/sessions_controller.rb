class SessionsController < ApplicationController

  # GET: /sessions
  get "/login" do
    erb :"/sessions/login.html"
  end

  # GET: /sessions/new
  get "/logout" do
    session.clear
    redirect "/"
  end

  # POST: /sessions
  post "/login" do
    binding.pry
  end

  # GET: /sessions/5
  get "/sessions/:id" do
    erb :"/sessions/show.html"
  end

  # GET: /sessions/5/edit
  get "/sessions/:id/edit" do
    erb :"/sessions/edit.html"
  end

  # PATCH: /sessions/5
  patch "/sessions/:id" do
    redirect "/sessions/:id"
  end

  # DELETE: /sessions/5/delete
  delete "/sessions/:id/delete" do
    redirect "/sessions"
  end
end
