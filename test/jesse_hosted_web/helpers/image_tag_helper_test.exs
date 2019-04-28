defmodule JesseHostedWeb.ImageTagHelperTest do
  use ExUnit.Case

  alias JesseHostedWeb.ImageTagHelper, as: ImageTagHelper

  test "gets correct img tag list" do
    map = %{
      "file" => "1.jpg",
      "folder_name" => "album1",
      "title" => "title1",
      "alt" => "alt1"
    }
    expected_list = [
      alt: "alt1",
      title: "title1",
      srcset: "https://storage.googleapis.com/jesse-hosted-images/albums/album-1/1_380w.jpg 380w, https://storage.googleapis.com/jesse-hosted-images/albums/album-1/1_480w.jpg 480w, https://storage.googleapis.com/jesse-hosted-images/albums/album-1/1_700w.jpg 700w",
      sizes: "(max-width: 380px) 340px, (max-width: 480px) 440px, 700px"
    ]
    actual_list = ImageTagHelper.create_img_attrs("album-1", map)
    assert expected_list == actual_list
  end
end
