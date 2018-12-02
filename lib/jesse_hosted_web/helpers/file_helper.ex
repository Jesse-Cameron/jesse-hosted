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

  def read_json_to_map(file_path) do
    album_path = "./assets/srv_metadata/" <> file_path

    case File.read(album_path) do
      {:ok, body} -> Poison.Parser.parse!(body)
      {:error, _response} -> raise FileNotFoundError
    end
  end
end
