defmodule Tik.Portfolio do
  @doc"""
    Portfolio manager
  """
  def start_link(tickers \\ %{}) do
    Agent.start_link(fn -> tickers end)
  end

  def get(pid, ticker) do
    Agent.get(pid, &Map.get(&1, ticker))
  end

  def put(pid, ticker, value \\ 0) do
    Agent.update(pid, &Map.put(&1, ticker, value))
  end
end
