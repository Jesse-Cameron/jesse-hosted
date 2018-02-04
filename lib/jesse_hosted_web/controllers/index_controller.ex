defmodule JesseHostedWeb.IndexController do
  use JesseHostedWeb, :controller

  import JesseHostedWeb.FileHelper
  import JesseHostedWeb.GoogleStorageHelper

  def index(conn, _params) do
    index_map = read_json_to_map("site.json")["albums"] |> to_album_map()
    render(conn, "index.html", index_map: index_map)
  end

  def to_album_map(index_map) do
    index_map
    |> Enum.map(&update_fn(&1))
  end

  defp update_fn(map) do
    album_id = map["album_number"] |> Integer.to_string()
    map |> Map.update!("cover_image", &image_url("albums/#{album_id}", &1))
  end
end
