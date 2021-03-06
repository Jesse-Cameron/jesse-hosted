defmodule JesseHostedWeb.IndexController do
  use JesseHostedWeb, :controller

  import JesseHostedWeb.FileHelper
  import JesseHostedWeb.GoogleStorageHelper

  def index(conn, _params) do
    index_map = get_site_map() |> to_album_map()
    render(conn, "index.html", index_map: index_map)
  end

  def to_album_map(index_map) do
    index_map
    |> Enum.map(&update_fn(&1))
  end

  defp update_fn(map) do
    album_id = map["folder_name"]
    file_name = image_url("albums/#{album_id}", map["cover_image"])
    Map.put(map, "cover_image_url",  file_name)
  end

  def about(conn, _params) do
    render(conn, "about.html")
  end
end
