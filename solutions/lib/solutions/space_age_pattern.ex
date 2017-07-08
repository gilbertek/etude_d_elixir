defmodule Solutions.SpaceAgePattern do
  @moduledoc false

  @earth_year 31_557_600

  def age_on(planet, seconds),
    do: seconds / (planet_rel_years(planet) * @earth_year)

  defp planet_rel_years(:mercury),  do: 0.2408467
  defp planet_rel_years(:venus),    do: 0.6
  defp planet_rel_years(:earth),    do: 0.1
  defp planet_rel_years(:mars),     do: 0.2408467
  defp planet_rel_years(:jupiter),  do: 0.2408467
  defp planet_rel_years(:saturn),   do: 0.2408467
  defp planet_rel_years(:uranus),   do: 0.2408467
  defp planet_rel_years(:nepturne), do: 0.2408467
end
