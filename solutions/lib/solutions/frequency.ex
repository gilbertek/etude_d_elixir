defmodule Solutions.Frequency do
  @doc"""
    Return a frequency of item in a list

  Implement take
  """
  def count(list) do
    Enum.reduce(list, %{}, fn(n, acc) ->
      Map.update(acc, n, 1, &(&1 +1))
    end)
  end

  def reverse() do
    
  end
end
