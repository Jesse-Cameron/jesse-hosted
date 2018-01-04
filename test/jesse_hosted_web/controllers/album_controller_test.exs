defmodule JesseHostedWeb.AlbumControllerTest do
  use JesseHostedWeb.ConnCase

  test "GET /album - should redirect", %{conn: conn} do
    conn = get conn, "/album"
    assert html_response(conn, 302)
  end
end