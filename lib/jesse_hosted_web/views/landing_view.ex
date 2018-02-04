defmodule JesseHostedWeb.LandingView do
  use JesseHostedWeb, :view

  alias JesseHostedWeb.GoogleStorageHelper

  # TODO: make this randomly generate an image?
  def image_path(path) do
    GoogleStorageHelper.image_url("landing", path)
  end
end
