defmodule JesseHostedWeb.Router do
  use JesseHostedWeb, :router

  pipeline :browser do
    plug(:accepts, ["html"])
    plug(:fetch_session)
    plug(:fetch_flash)
    plug(:protect_from_forgery)
    plug(:put_secure_browser_headers)
  end

  scope "/", JesseHostedWeb do
    pipe_through(:browser)

    get("/", LandingController, :index)
    get("/home", IndexController, :index)
    get("/about", IndexController, :about)
    get("/album", AlbumController, :index_redirect)
    get("/album/:name", AlbumController, :album)
  end
end