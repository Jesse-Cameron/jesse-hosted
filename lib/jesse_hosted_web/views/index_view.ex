defmodule JesseHostedWeb.IndexView do
  use JesseHostedWeb, :view

  import JesseHostedWeb.GoogleStorageHelper

  def get_srcset_filename(album_id, filename, size) do
    [ name | ext ] = String.split(filename, ".")
    ext_name = ".#{hd(ext)}"
    image_url("albums/#{album_id}", "#{name}_#{size}#{ext_name}")
  end

  def get_album_route(album_name) do
    String.replace(album_name, "-", "_")
  end
end
