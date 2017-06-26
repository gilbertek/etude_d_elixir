defmodule Solutions do
  @moduledoc """
  Documentation for Solutions.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Solutions.hello
      :world

  """
  def hello do
    :world
  end

  def process do
    Task.async(fn ->
      IO.puts "Get ticker!"
      :timer.sleep(2000)
    end)
  end
end
