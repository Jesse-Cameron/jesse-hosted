defmodule JesseHostedWeb.GoogleStorageHelper do
  @moduledoc """
  helper for interacting with google storage
  """

  @doc """
  creates a url string for accessing an image

  ##Examples
    JesseHostedWeb.GoogleStorageHelper.image_url("album_1", "image_name.jpg")
  """
  def image_url(location \\ "album", album_name, image_name) do
    bucket_path = "https://storage.googleapis.com/jesse-hosted-images/"
    bucket_path <> location <> "/" <> album_name <> "/" <> image_name
  end
end