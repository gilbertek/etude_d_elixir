defmodule Solutions.AllergiesPattern do
  @moduledoc false

  def allergic_to?(flags, item), do: item in list(flags)

  def list(flags), do: list(<<flags>>, [])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<0 :: size(1), r :: size(7)>>, ["cats" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["pollen" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["chocolate" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["tomatoes" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["strawberries" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["shellfish" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["peanuts" | acc])

  defp list(<<l :: size(1), r :: size(7)>>, acc), do:
    list(<<l :: size(1), r :: size(7)>>, ["eggs" | acc])

  defp list(_, ac), do: acc
end
