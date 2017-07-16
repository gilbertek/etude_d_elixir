defmodule Solutions.TheListReduce do
  @moduledoc false

  def double([]), do: []
  def double(list) when is_list(list) do
    Enum.reduce(list, [], fn(item, acc) ->
      [item * 2 | acc]
    end)
  end
end
