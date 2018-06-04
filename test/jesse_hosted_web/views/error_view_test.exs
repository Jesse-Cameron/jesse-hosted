defmodule JesseHostedWeb.ErrorViewTest do
  use JesseHostedWeb.ConnCase, async: true

  # Bring render/3 and render_to_string/3 for testing custom views
  import Phoenix.View

  test "render 500.html" do
    assert render_to_string(JesseHostedWeb.ErrorView, "500.html", []) == "Internal server error"
  end

  test "render any other" do
    assert render_to_string(JesseHostedWeb.ErrorView, "505.html", []) == "Internal server error"
  end
end
