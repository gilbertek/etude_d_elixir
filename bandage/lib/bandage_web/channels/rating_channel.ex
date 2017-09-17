defmodule BandageWeb.RatingChannel do
  use BandageWeb, :channel

  alias Bandage.Artists

  def join("rating:" <> _band, payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("ping", payload, socket) do
    {:reply, {:ok, payload}, socket}
  end

  # It is also common to receive messages from the client and
  # broadcast to everyone in the current topic (rating:lobby).
  def handle_in("shout", payload, socket) do
    broadcast socket, "shout", payload
    {:noreply, socket}
  end

  def handle_in("rating:add", payload, socket) do
    song = Artists.get_song!(payload["song"])

    Bandage.Ratings.add_rating(song, %{value: payload["rating"]})

    broadcast(socket, "rating:changed", %{song: song.id, rating: Artists.average_song_rating(song)})
    {:noreply, socket}
  end

  # Add authorization logic here as required.
  defp authorized?(_payload) do
    true
  end
end
