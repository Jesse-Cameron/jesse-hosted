defmodule JesseHostedWeb.LandingController do
  use JesseHostedWeb, :controller

  @maximum_images 7

  def index(conn, _params) do
    conn
    |> put_layout(false)
    |> render("index.html", number_list: generate_file_order())
  end

  defp generate_file_order() do
    1..@maximum_images |> Enum.to_list() |> Enum.take_random(5)
  end
end
