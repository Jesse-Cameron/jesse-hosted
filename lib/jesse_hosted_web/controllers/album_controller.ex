defmodule JesseHostedWeb.AlbumController do
  use JesseHostedWeb, :controller

  def index_redirect(conn, _params) do
    redirect conn, to: "/"
  end

  def album(conn, _params) do
    text conn, "Album!"
  end
end