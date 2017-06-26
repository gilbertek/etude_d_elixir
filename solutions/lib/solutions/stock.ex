defmodule Solutions.Stock do
  @moduledoc "Define a stock object"

  defstruct name: nil, mkt_value: 0.0

  defimpl Inspect do
    def inspect(%Solutions.Stock{name: name, mkt_value: mkt_value}, _options) do
      "Current market value for: #{name} is #{mkt_value}"
    end
  end
end
