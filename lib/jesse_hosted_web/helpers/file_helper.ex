defmodule JesseHostedWeb.FileHelper do
  @moduledoc """
  a helper for accessing, reading and parsing various file types
  """

  defmodule FileNotFoundError do
    defexception [:message, :plug_status]

    def exception(_) do
      %__MODULE__{message: "File Not Found", plug_status: 404}
    end
  end

  defp read_json_file_to_map(album_name) do
    album_path = "./assets/srv_metadata/#{album_name}.json"
    case File.read(album_path) do
      {:ok, body} -> Poison.Parser.parse!(body, %{})
      {:error, _response} -> raise FileNotFoundError
    end
  end

  def read_album_from_file(album_name) do
    get_album_map("albums/#{album_name}")
  end

  def get_site_map() do
    get_album_map("site")
    |> Map.get("albums")
  end

  defp get_album_map(album_name) do
    Cachex.fetch(:app_cache, album_name, fn(key) ->
      {:commit, read_json_file_to_map(key)}
    end)
    |> case do
      {success, result} when success in [:ok, :commit] -> result
      {failed, _} when failed in [:error, :loaded] -> raise FileNotFoundError
    end
  end
end
