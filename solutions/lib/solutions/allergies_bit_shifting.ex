defmodule Solutions.AllergiesBitShifting do
  @moduledoc """
  Use Bitwise operation &&& to check allergic_to? flags.
  """

  use Bitwise, only_operators: true

  @allergies %{
    1 =>   "eggs",
    2 =>   "peanuts",
    4 =>   "shellfish",
    8 =>   "strawberries",
    16 =>  "tomatoes",
    32 =>  "chocolate",
    64 =>  "pollen",
    128 => "cats"
  }

  def allergic_to?(flags, item), do: item in list(flags)

  def list(flags) do
    Enum.filter_map(@allergies, &(flagged? flags, &1), fn({_, item}) -> item end)
  end

  defp flagged?(flags, {value, _}) do
    (flags &&& value) > 0
  end
end
