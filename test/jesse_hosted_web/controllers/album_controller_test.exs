defmodule JesseHostedWeb.AlbumControllerTest do
  use JesseHostedWeb.ConnCase

  import JesseHostedWeb.AlbumController

  test "GET /album - should redirect", %{conn: conn} do
    conn = get(conn, "/album")
    assert html_response(conn, 302)
  end

  test "to_image_map - converts to the correct format" do
    original_map = %{
      "folder_name" => "furred-friends",
      "date_uploaded" => "2018-01-05T11:34:35.333Z",
      "id" => "1",
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
      "id" => "1",
      "images" => [
        %{
          "alt_text" => "",
          "file" => "poohie.jpg",
          "url" => "https://storage.googleapis.com/jesse-hosted-images/albums/furred-friends/poohie.jpg",
          "title" => "pretty paradise"
        },
        %{
          "alt_text" => "",
          "file" => "lucy.jpg",
          "url" => "https://storage.googleapis.com/jesse-hosted-images/albums/furred-friends/lucy.jpg",
          "title" => "lovely lucy"
        },
        %{
          "alt_text" => "",
          "file" => "teddy.jpg",
          "url" => "https://storage.googleapis.com/jesse-hosted-images/albums/furred-friends/teddy.jpg",
          "title" => "temperate teddy"
        },
        %{
          "alt_text" => "",
          "file" => "polly.jpg",
          "url" => "https://storage.googleapis.com/jesse-hosted-images/albums/furred-friends/polly.jpg",
          "title" => "pleasant polly"
        }
      ],
      "title" => "furred friends",
      "folder_name" => "furred-friends"
    }

    assert result_map == expected_map
  end

  test "GET /album/fakeAlbum - should throw an error", %{conn: conn} do
    assert_raise JesseHostedWeb.FileHelper.FileNotFoundError, fn ->
      get(conn, "album/fakeAlbum")
    end
  end
end
