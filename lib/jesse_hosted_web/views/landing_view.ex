defmodule JesseHostedWeb.LandingView do
  use JesseHostedWeb, :view

  alias JesseHostedWeb.GoogleStorageHelper

  # TODO: make this randomly generate an image?
  def get_image_url(number_list, index) do
    {file_number, list} = List.pop_at(number_list, index)
    GoogleStorageHelper.image_url("landing", "#{file_number}.jpg")
  end

  def get_bg_url() do
    GoogleStorageHelper.image_url("landing", "bg.jpg")
  end
end
