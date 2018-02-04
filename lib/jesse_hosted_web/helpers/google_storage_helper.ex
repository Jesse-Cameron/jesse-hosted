defmodule JesseHostedWeb.GoogleStorageHelper do
  @moduledoc """
  helper for interacting with google storage
  """
  @google_storage_base_url "https://storage.googleapis.com/"
  @config_buck_name "jesse-hosted-config"

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

  @doc """
  gets the metadata for all of the albums and stores it locally
  """
  def init do
    # setup dat sweet connection
    {:ok, token} = Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
    conn = GoogleApi.Storage.V1.Connection.new(token.token)
    GoogleApi.Storage.V1.Api.Objects.storage_objects_list(conn, @config_buck_name)
  end

  # def download_image(file_name, folder_name \\ :empty) do
  #   # setup dat sweet connection
  #   {:ok, token} = Goth.Token.for_scope("https://www.googleapis.com/auth/cloud-platform")
  #   conn = GoogleApi.Storage.V1.Connection.new(token.token)

  #   GoogleApi.Storage.V1.Api.Objects.storage_objects_get(conn, @config_buck_name, file_name, [{:alt, "media"}])
  # end
end
