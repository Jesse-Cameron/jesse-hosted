defmodule JesseHostedWeb.ErrorView do
  use JesseHostedWeb, :view

  def render("404.html", _assigns) do
    #render("404_page.html", %{})

    "404"
  end

  def render("500.html", _assigns) do
    "Internal server error"
  end

  # In case no render clause matches or no
  # template is found, let's render it as 500
  def template_not_found(_template, assigns) do
    IO.puts("here")
    render("500.html", assigns)
  end
end
