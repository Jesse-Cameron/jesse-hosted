defmodule JesseHostedWeb.StorageHelperTest do
  use ExUnit.Case

  alias JesseHostedWeb.GoogleStorageHelper, as: StorageHelper

  test "gets correct storage url" do
    correct_path = "https://storage.googleapis.com/jesse-hosted-images/albums/album1/file1.jpg"
    full_path = StorageHelper.image_url("album1", "file1.jpg")
    assert correct_path == full_path
  end

  test "get correct storage url - no folder" do
    correct_path = "https://storage.googleapis.com/jesse-hosted-images/landing/file2.jpg"
    full_path = StorageHelper.image_url("landing", "", "file2.jpg")
    assert correct_path == full_path
  end
end