defmodule FileHelperTest do
  use ExUnit.Case, async: false

  import Mock
  import JesseHostedWeb.FileHelper

  test "read_album_from_file - is cached" do
    album_name = "album_name"
    album_path = "./assets/srv_metadata/albums/#{album_name}.json"
    with_mock File, [read: fn(_filename) -> {:ok, "{}"} end] do
      read_album_from_file(album_name)
      assert called File.read(album_path)
      res = Cachex.inspect(:app_cache, {:entry, "albums/#{album_name}"})
      assert res |> elem(0) == :ok
    end
  end
end
