defmodule JesseHostedWeb.AlbumView do
  use JesseHostedWeb, :view

  import JesseHostedWeb.GoogleStorageHelper

  def get_srcset_filename(album_id, filename, size) do
    [ name | ext ] = String.split(filename, ".")
    ext_name = ".#{hd(ext)}"
    image_url("albums/#{album_id}", "#{name}_#{size}#{ext_name}")
  end
end
