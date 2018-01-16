defmodule JesseHostedWeb.AlbumController do
  use JesseHostedWeb, :controller

  import JesseHostedWeb.FileHelper
  import JesseHostedWeb.GoogleStorageHelper

  def index_redirect(conn, _params) do
    redirect conn, to: "/"
  end
  
  def album(conn, %{"id" => id}) do
    album_data = read_json_to_map(id <> ".json") |> to_image_map()
    render conn, "index.html", id: id
  end

  def to_image_map(album_map) do
    album_id = album_map["id"] |> Integer.to_string()
    image_list = album_map["images"]
    new_map = Enum.map(image_list, &update_fn(&1, album_id))
    Map.put(album_map, "images", new_map)
  end

  defp update_fn(map, album_id) do
    Map.update!(map, "file", &image_url(album_id, &1))
  end
end