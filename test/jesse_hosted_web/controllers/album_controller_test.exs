defmodule JesseHostedWeb.AlbumControllerTest do
  use JesseHostedWeb.ConnCase

  import JesseHostedWeb.AlbumController

  test "GET /album - should redirect", %{conn: conn} do
    conn = get conn, "/album"
    assert html_response(conn, 302)
  end

  test "to_image_map - converts to the correct format" do
    original_map = %{
      "date_uploaded" => "2018-01-05T11:34:35.333Z", 
      "id" => 1,
      "images" => [
        %{"alt_text" => "", "file" => "poohie.jpg", "title" => "pretty paradise"},
        %{"alt_text" => "", "file" => "lucy.jpg", "title" => "lovely lucy"},
        %{"alt_text" => "", "file" => "teddy.jpg", "title" => "temperate teddy"},
        %{"alt_text" => "", "file" => "polly.jpg", "title" => "pleasant polly"}
        ],
      "title" => "furred friends"
    }

    result_map = to_image_map(original_map)

    expected_map = %{
      "date_uploaded" => "2018-01-05T11:34:35.333Z",
      "id" => 1,
      "images" => [
        %{"alt_text" => "", "file" => "https://storage.googleapis.com/jesse-hosted-images/albums/1/poohie.jpg", "title" => "pretty paradise"},
        %{"alt_text" => "", "file" => "https://storage.googleapis.com/jesse-hosted-images/albums/1/lucy.jpg", "title" => "lovely lucy"},
        %{"alt_text" => "", "file" => "https://storage.googleapis.com/jesse-hosted-images/albums/1/teddy.jpg", "title" => "temperate teddy"},
        %{"alt_text" => "", "file" => "https://storage.googleapis.com/jesse-hosted-images/albums/1/polly.jpg", "title" => "pleasant polly"}
      ],
      "title" => "furred friends"
    }

    assert result_map == expected_map
  end
end