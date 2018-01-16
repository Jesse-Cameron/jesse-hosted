defmodule JesseHostedWeb.AlbumView do
  use JesseHostedWeb, :view

  def series_title(conn, series_title) do
    series_title
  end

  def series_subtitle do 
    "album subtitle"
  end

  def series_date do
    "DD-MM_YYYY"
  end
end