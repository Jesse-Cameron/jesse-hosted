defmodule JesseHostedWeb.GoogleStorageHelper do
  @moduledoc """
  helper for interacting with google storage
  """

  @doc """
  creates a url string for accessing an image

  ##Examples
    JesseHostedWeb.GoogleStorageHelper.image_url("album_1", "image_name.jpg")
  """

  @google_storage_base_url "https://storage.googleapis.com/jesse-hosted-images/"
  def image_url(location \\ "albums", album_name, image_name) do
    case String.trim(album_name) do
      "" ->
        @google_storage_base_url <> location <> "/" <> image_name
      _ ->
        @google_storage_base_url <> location <> "/" <> album_name <> "/" <> image_name
    end
  end
end