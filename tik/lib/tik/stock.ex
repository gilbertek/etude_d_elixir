defmodule Tik.Stock do
  @moduledoc"""
  Datatype to hold Stock definition.
  """
  defstruct [
    ticker: nil,
    name: nil,
    mkt_value: 0.0
  ]
end
