defmodule BandageWeb.BandView do
  use BandageWeb, :view

  def rating(song) do
    rating = round(Bandage.Artists.average_song_rating(song))

    Enum.map (5..1), fn(i) ->
      content_tag :span, "",
        id: "rating-#{song.id}-#{i}",
        class: "glyphicon glyphicon-star#{if i > rating do "-empty" end} rating-star",
        "data-song": song.id,
        "data-rating": i
    end
  end
end
