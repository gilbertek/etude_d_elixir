defmodule Solutions.AllergiesHash do
  @moduledoc false

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

  defp list(flags) do
    flags
    |> Integer.digits(2)
    |> Enum.reverse()
    |> Enum.zip(@allergies)
    |> Enum.reduce([], fn
      {1, {_, allergy}}, acc -> [allergy | acc]
      _,                 acc -> acc
    end)
  end
end
