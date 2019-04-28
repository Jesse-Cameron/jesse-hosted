defmodule JesseHostedWeb.IndexView do
  use JesseHostedWeb, :view

  import JesseHostedWeb.ImageTagHelper

  def get_album_route(album_name) do
    String.replace(album_name, "-", "_")
  end
end
