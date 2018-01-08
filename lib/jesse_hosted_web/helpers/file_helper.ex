defmodule JesseHostedWeb.FileHelper do

  def read_json_to_map(file_path \\ "1.json") do
    album_path = "./assets/srv_metadata/" <> file_path
    case File.read(album_path) do
      {:ok, body}         -> Poison.Parser.parse!(body)
      {:error, response}  -> IO.puts(response)
    end
  end
end