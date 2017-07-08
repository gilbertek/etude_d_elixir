defmodule Solutions.SpaceAgeMacros do
  @moduledoc false

  @earth_year 31_557_600

  def age_on(planet, seconds),
    do: seconds / planet_rel_years(planet)

  defp planet_rel_years(:mercury),  do: unquote(0.2408467 * @earth_year)
  defp planet_rel_years(:venus),    do: unquote(0.6 * @earth_year)
  defp planet_rel_years(:earth),    do: unquote(0.1 * @earth_year)
  defp planet_rel_years(:mars),     do: unquote(0.2408467 * @earth_year)
  defp planet_rel_years(:jupiter),  do: unquote(0.2408467 * @earth_year)
  defp planet_rel_years(:saturn),   do: unquote(0.2408467 * @earth_year)
  defp planet_rel_years(:uranus),   do: unquote(0.2408467 * @earth_year)
  defp planet_rel_years(:nepturne), do: unquote(0.2408467 * @earth_year)
end
