defmodule JesseHostedWeb.GoogleStorageHelper do
  @moduledoc """
  helper for interacting with google storage
  """
  @google_storage_base_url "https://storage.googleapis.com/"

  @doc """
  creates a url string for accessing an image on google storage


  ## Parameters

  - location: folder of the image
  - image_name: name of the image file

  Returns `string` - contains the path to the google hosted resource

  ##Examples
  GoogleStorageHelper.image_url("albums/album_1", "image_name.jpg")
  """
  def image_url(location, image_name) do
    @google_storage_base_url <> "jesse-hosted-images/" <> location <> "/" <> image_name
  end
end
