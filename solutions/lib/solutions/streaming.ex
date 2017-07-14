defmodule Solutions.Streaming do
  @moduledoc false

  @path "data/sample.txt"
  def parse() do
    @path
    |> File.stream!
    |> Stream.map(&String.strip/1)
    |> Stream.filter(&String.starts_with?(&1, "d"))
    |> Enum.sort(&(bit_size(&1) >= bit_size(&2)))
    |> Stream.map(&String.capitalize(&1))
    |> Stream.with_index
    |> Enum.take(10)
    |> IO.inspect
  end
end
