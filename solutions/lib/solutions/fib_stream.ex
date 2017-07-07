defmodule Solutions.FibStream do 
  @moduledoc false

  def fib(n) when n >= 0 and is_integer(n) do 
    [0, 1]
    |> Stream.iterate(fn([a, b]) -> [b, a + b] end)
    |> Stream.with_index
    |> Stream.drop_while(fn({_, i}) -> i < n end)
    |> Stream.take(1)
    |> Enum.map(fn({[value, _], _}) -> value end)
    |> Enum.to_list
    |> List.first
  end
end
