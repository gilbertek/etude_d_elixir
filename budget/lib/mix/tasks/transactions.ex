defmodule Mix.Tasks.Transactions do
  use Mix.Task

  @shortdoc"""
  List transactions from csv file
  """
  def run(_) do
    Budget.transactions
  end
end
