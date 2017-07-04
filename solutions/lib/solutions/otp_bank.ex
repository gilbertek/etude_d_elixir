defmodule OtpBank do
  @moduledoc"""
  Simple OTP using spawn
  """
  # Client
  def new(balance \\ 0) do
    spawn(fn -> loop(balance) end)
  end

  def deposit(pid, amount) do
    send(pid, {:deposit, amount})
  end

  def withdraw(pid, amount) do
    send(pid, {:withdraw, amount})
  end

  def balance(pid) do
    send(pid, {:balance, self()})

    receive do
      {:balance, balance} -> balance
    after 1000 -> "Error: Request timeout."
    end
  end

  # Server API
  defp loop(balance) do
    receive do
      {:deposit, amount} -> loop(balance + amount)
      {:withdraw, amount} -> loop(balance - amount)
      {:balance, parent}
        -> send(parent, {:balance, balance})
        loop(balance)
    end
  end
end
