defmodule Solutions.TheList do
  @moduledoc"""
    Recursive implementation of length on a list
  """

  @doc"""
    Returns the length of a list
  """
  def length(list) when is_list(list) do
    length(list, 0)
  end

  defp length([], count), do: count
  defp length([_ | tail], count) do
    length(tail, count + 1)
  end
end
