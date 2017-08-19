defmodule Budget do
  @moduledoc """
  Documentation for Budget.
  """

  alias NimbleCSV.RFC4180, as: CSV

  @doc """
  Return a list of all transactions
  """
  def transactions do
    File.read!("./data/transactions.csv")
    |> parse
    |> filter
    |> normalize
    |> order_by_amount
    |> output
  end

  defp parse(string) do
    CSV.parse_string(string)
  end

  defp filter(rows) do
    Enum.map(rows, &(Enum.drop(&1, 1)))
  end

  defp normalize(rows) do
    Enum.map(rows, &parse_amount(&1))
  end

  defp parse_amount([date, description, amount] = row) do
    [date, description, to_float(amount)]
  end

  defp to_float(string) do
    string
    |> String.to_float
    |> abs
  end

  defp order_by_amount(rows) do
    Enum.sort(rows, &sort_by_amount(&1, &2))
  end

  defp sort_by_amount([_, _, prev], [_, _, next]) do
    prev < next
  end

  defp output(rows) do
    IO.puts "\nTransactions:"

    Enum.each(rows, &print_to_stdout(&1))
  end

  defp print_to_stdout([date, description, amount]) do
    IO.puts "#{date} #{description} $#{:erlang.float_to_binary(amount, decimals: 2)}"
  end
end
