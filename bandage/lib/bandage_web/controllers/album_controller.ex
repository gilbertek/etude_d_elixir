defmodule BandageWeb.AlbumController do
  use BandageWeb, :controller

  alias Bandage.Artists
  alias Bandage.Artists.Album

  def new(conn, %{"band_id" => band_id}) do
    band = Artists.get_band!(band_id)
    changeset = Artists.change_album(%Album{})

    conn
    |> assign(:changeset, changeset)
    |> assign(:band, band)
    |> render("new.html")
  end

  def create(conn, %{"band_id" => band_id, "album" => album_params}) do
    band = Artists.get_band!(band_id)

    case Artists.create_album_with_songs(band, album_params) do
      {:ok, _} ->
        conn
        |> put_flash(:info, "Album created successfully.")
        |> redirect(to: band_path(conn, :show, band))
      {:error, :album, changeset} ->
        render(conn, "new.html", band: band, changeset: changeset)
      {:error, :songs} ->
        conn
        |> assign(:band, band)
        |> assign(:changeset, Artists.Album.changeset(%Artists.Album{}, album_params))
        |> render("new.html")
    end
  end
end
