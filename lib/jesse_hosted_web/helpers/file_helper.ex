defmodule JesseHostedWeb.FileHelper do
  @moduledoc """
  a helper for accessing, reading and parsing various file types 
  """

  defmodule AlbumNotFoundError do
    defexception [:message, :plug_status]
  
    def exception(_) do
      %__MODULE__{message: "Album Not Found", plug_status: 404}
    end
  end

  def read_json_to_map(file_path) do
    album_path = "./assets/srv_metadata/" <> file_path

    case File.read(album_path) do
      {:ok, body} -> Poison.Parser.parse!(body)
      {:error, response} -> raise AlbumNotFoundError
    end
  end
end
