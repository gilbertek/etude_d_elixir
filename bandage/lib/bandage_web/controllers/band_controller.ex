defmodule BandageWeb.BandController do
  use BandageWeb, :controller

  alias Bandage.Artists

  def index(conn, %{"query" => search} = params) do
    bands = Artists.find_bands(search)

    conn
    |> put_flash(:search, "Found #{Enum.count(bands)} band(s) matching your search.")
    |> assign(:bands, bands)
    |> render("index.html")
  end
  def index(conn, _params) do
    render conn, "index.html", bands: Artists.list_bands()
  end

  def show(conn, %{"id" => id}) do
    render conn, "show.html", band: Artists.get_band!(id)
  end

  def edit(conn, %{"id" => id}) do
    band = Artists.get_band!(id)
    changeset = Artists.change_band(band)

    render conn, "edit.html", band: band, changeset: changeset
  end

  def update(conn, %{"id" => id, "band" => band_params}) do
    band = Artists.get_band!(id)

    case Artists.update_band(band, band_params) do
      {:ok, band} ->
        redirect(conn, to: band_path(conn, :show, band))
      {:error, changeset} ->
        conn
        |> assign(:band, band)
        |> assign(:changeset, changeset)
        |> render("edit.html")
    end
  end
end
