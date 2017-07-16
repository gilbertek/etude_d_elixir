defmodule Solutions.TheListMap do
  @moduledoc false

  def double([]), do: []
  def double(list) when is_list(list) do
    Enum.map(list, fn(item) ->  item * 2 end)
  end
end
