defmodule Tik.Portfolio do
  @moduledoc"""
    Portfolio manager Agent server
  """

  @name __MODULE__
  def start_link() do
    Agent.start_link(fn -> %{} end, name: @name)
  end

  def get do
    Agent.get(@name, &Map.values(&1))
  end

  def get(%Tik.Stock{ticker: ticker} = _params) do
    Agent.get(@name, &Map.get(&1, String.to_atom(ticker)))
  end

  def add(%Tik.Stock{ticker: ticker} = params) do
    Agent.update(@name, &Map.put(&1, String.to_atom(ticker), params))
  end

  def update(%Tik.Stock{ticker: ticker} = params) do
    Agent.update(@name, &Map.put(&1, String.to_atom(ticker), params))
  end

  def delete(ticker) do
    Agent.get_and_update(@name, &Map.delete(&1, ticker))
  end

  def delete(%Tik.Stock{ticker: ticker} = _params) do
    Agent.get_and_update(@name, &Map.delete(&1, ticker))
  end
end
