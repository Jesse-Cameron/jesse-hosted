defmodule JesseHostedWeb.Router do
  use JesseHostedWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  scope "/", JesseHostedWeb do
    pipe_through :browser

    get "/", IndexController, :index
    get "/landing", LandingController, :index
    get "/album", AlbumController, :index
    get "/album/:id", AlbumController, :index
  end 
end
