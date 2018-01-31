defmodule JesseHostedWeb.GoogleStorageHelper do
  @moduledoc """
  helper for interacting with google storage
  """
  @google_storage_base_url "https://storage.googleapis.com/"
  @config_buck_name "jesse-hosted-config"
  
  @doc """
  creates a url string for accessing an image

  ##Examples
    JesseHostedWeb.GoogleStorageHelper.image_url("album_1", "image_name.jpg")
  """
  def image_url(location \\ "albums", album_name, image_name) do
    album_bucket = @google_storage_base_url <> "jesse-hosted-images/" <> location <> "/"
    
    case String.trim(album_name) do
      "" -> # if no album is specified
        album_bucket <> image_name
      _ ->
        album_bucket <> album_name <> "/" <> image_name
    end
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