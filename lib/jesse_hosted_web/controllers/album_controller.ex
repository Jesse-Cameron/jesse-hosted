defmodule JesseHostedWeb.AlbumController do
  use JesseHostedWeb, :controller

  import JesseHostedWeb.FileHelper
  import JesseHostedWeb.GoogleStorageHelper

  def index_redirect(conn, _params) do
    redirect(conn, to: "/")
  end

  def album(conn, %{"name" => file_name}) do
    album_map = read_album_from_file(file_name) |> to_image_map()
    render(conn, "index.html", album_map: album_map)
  end

  def to_image_map(album_map) do
    new_map = Enum.map(album_map["images"], &update_fn(&1, album_map["folder_name"]))
    Map.put(album_map, "images", new_map)
  end

  defp update_fn(map, album_id) do
    filename = Map.get(map, "file")
    file_url = image_url("albums/#{album_id}", filename)
    Map.put(map, "url", file_url)
  end
end
