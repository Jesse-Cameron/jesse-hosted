defmodule JesseHostedWeb.IndexControllerTest do
  use JesseHostedWeb.ConnCase

  import JesseHostedWeb.IndexController

  test "GET /", %{conn: conn} do
    conn = get(conn, "/")
    assert html_response(conn, 200) =~ "<!DOCTYPE html>"
  end

  test "to_album_map - converts to the correct format" do
    original_map = [
      %{
        "album_number" => 1,
        "cover_image" => "front.jpg",
        "date" => "2018-01-09",
        "subtitle" => "",
        "title" => "album1"
      },
      %{
        "album_number" => 2,
        "cover_image" => "front.jpg",
        "date" => "2016-01-09",
        "subtitle" => "",
        "title" => "album2"
      },
      %{
        "album_number" => 3,
        "cover_image" => "front.jpg",
        "date" => "2017-01-09",
        "subtitle" => "",
        "title" => "album3"
      },
      %{
        "album_number" => 4,
        "cover_image" => "front.jpg",
        "date" => "2016-08-09",
        "subtitle" => "",
        "title" => "album4"
      }
    ]

    result_map = to_album_map(original_map)

    expected_map = [
      %{
        "album_number" => 1,
        "cover_image" => "https://storage.googleapis.com/jesse-hosted-images/albums/1/front.jpg",
        "date" => "2018-01-09",
        "subtitle" => "",
        "title" => "album1"
      },
      %{
        "album_number" => 2,
        "cover_image" => "https://storage.googleapis.com/jesse-hosted-images/albums/2/front.jpg",
        "date" => "2016-01-09",
        "subtitle" => "",
        "title" => "album2"
      },
      %{
        "album_number" => 3,
        "cover_image" => "https://storage.googleapis.com/jesse-hosted-images/albums/3/front.jpg",
        "date" => "2017-01-09",
        "subtitle" => "",
        "title" => "album3"
      },
      %{
        "album_number" => 4,
        "cover_image" => "https://storage.googleapis.com/jesse-hosted-images/albums/4/front.jpg",
        "date" => "2016-08-09",
        "subtitle" => "",
        "title" => "album4"
      }
    ]

    assert result_map == expected_map
  end
end
