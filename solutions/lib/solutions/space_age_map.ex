defmodule Solutions.SpaceAgeMap do
  @moduledoc false

  @earth_year 31_557_600

  @planet_year_length %{
    earth:    1.0,
    mercury:  0.208467,
    venus:    0.61519726,
    mars:     1.8,
    jupiter:  11.86,
    saturn:   29.44,
    uranus:   84.01,
    nepturne: 164.79132
  }

  def age_on(planet, seconds) do
    seconds / (@planet_year_length[planet] * @earth_year)
  end
end
