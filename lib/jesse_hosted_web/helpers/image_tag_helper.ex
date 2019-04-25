defmodule JesseHostedWeb.ImageTagHelper do
  @moduledoc """
  Module for creating
  """

  import JesseHostedWeb.GoogleStorageHelper

  defp append_if_exists(list, map, key) do
    if Map.has_key?(map, key) do
      key_atom = String.to_atom(key)
      Keyword.put(list, key_atom, map[key])
    else
      list
    end
  end

  defp get_srcset_filename(album_id, filename, size) do
    [ name | ext ] = String.split(filename, ".")
    ext_name = ".#{hd(ext)}"
    image_url("albums/#{album_id}", "#{name}_#{size}#{ext_name}")
  end

  @doc """
  Creates the necessary image tag attributes

  Returns [srcset: String, size: String]

  ## Examples
    iex> create_img_attrs("folder1", %{file: "file.jpg"})
  """
  def create_img_attrs(folder_name, img_data, file_key \\ "file") do
    file_name = img_data[file_key]
    opt_list = [
      srcset: "#{get_srcset_filename(folder_name, file_name, "380w")} 380w, #{get_srcset_filename(folder_name, file_name, "480w")} 480w, #{get_srcset_filename(folder_name, file_name, "700w")} 700w",
      sizes: "(max-width: 380px) 340px, (max-width: 480px) 440px, 700px"
    ]
    opt_list
    |> append_if_exists(img_data, "title")
    |> append_if_exists(img_data, "alt")
  end
end
