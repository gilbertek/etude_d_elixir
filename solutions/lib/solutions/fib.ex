defmodule Fib do
  @moduledoc"""
  Fibonacci implementation with task
  """
  def fib_list(list) do
    list
    |> Enum.map(&Task.async(Fib, :fib, [&1]))
    |> Enum.map(&Task.await/1)
  end

  def fib(n), do: fib(0, 1, n)
  defp fib(a, _, 0), do: a
  defp fib(a, b, n), do: fib(b, a + b, n - 1)
end
