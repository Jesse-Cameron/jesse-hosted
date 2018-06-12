defmodule JesseHostedWeb.ErrorView do
  use JesseHostedWeb, :view

  import JesseHostedWeb.FileHelper

  def render("404.html", assigns) do
    render("404_page.html", assigns)
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    render("500.html", assigns)
  end

  def get_recommended_links() do
    read_json_to_map("site.json")["albums"] |> Enum.take_random(3) 
  end

  def get_album_route(album_name) do 
    String.replace(album_name, "-", "_")
  end

end
